import 'package:controle_pessoal/data/local/database/app_database.dart';
import 'package:controle_pessoal/data/local/seed/seed_service.dart';
import 'package:controle_pessoal/data/repositories/personal_repository.dart';
import 'package:controle_pessoal/features/ai/ai_actions.dart';
import 'package:controle_pessoal/features/ai/ai_command_handler.dart';
import 'package:controle_pessoal/features/ai/ai_context_manager.dart';
import 'package:controle_pessoal/features/ai/ai_engine.dart';
import 'package:controle_pessoal/features/ai/ai_intent_classifier.dart';
import 'package:controle_pessoal/features/ai/ai_models.dart';
import 'package:controle_pessoal/features/ai/ai_parser.dart';
import 'package:controle_pessoal/features/ai/services/product_service.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    await initializeDateFormatting('pt_BR');
  });

  final parser = AiParser();
  final commands = AiCommandHandler(parser);

  group('AiParser', () {
    test('detecta criacao de rotina com data e horario', () {
      final intent = parser.parseNatural(
        'Coloca estudar matematica amanha às 19h',
      );

      expect(intent.type, AiIntentType.createRoutineItem);
      expect(intent.module, AiModule.routine);
      expect(intent.title, 'Estudar matematica');
      expect(intent.timeMinutes, 19 * 60);
      expect(intent.scheduledDate, isNotNull);
    });

    test('detecta inicio de treino', () {
      final intent = parser.parseNatural('Iniciar treino de peito');

      expect(intent.type, AiIntentType.startWorkout);
      expect(intent.title, contains('Peito'));
    });

    test('detecta registro financeiro', () {
      final intent = parser.parseNatural(
        'Adiciona gasto de 35 reais no mercado',
      );

      expect(intent.type, AiIntentType.createFinanceRecord);
      expect(intent.financeType, AiFinanceRecordType.expense);
      expect(intent.amount, 35);
    });

    test('detecta historico', () {
      final intent = parser.parseNatural('Me mostra meu historico');

      expect(intent.type, AiIntentType.listHistory);
    });

    test('limpa titulo de rotina e entende recorrencia diaria', () {
      final intent = parser.parseNatural(
        'adicione acordar as 06:00 em todos dias da semana',
      );

      expect(intent.type, AiIntentType.createRoutineItem);
      expect(intent.title, 'Acordar');
      expect(intent.timeMinutes, 6 * 60);
      expect(intent.metadata['recurrence'], 'daily');
      expect(
        intent.metadata['weekdays'],
        '${DateTime.monday},${DateTime.tuesday},${DateTime.wednesday},${DateTime.thursday},${DateTime.friday},${DateTime.saturday},${DateTime.sunday}',
      );
    });

    test('detecta consumo de agua', () {
      final intent = parser.parseNatural('bebi 250ml de agua');

      expect(intent.type, AiIntentType.registerWaterConsumption);
      expect(intent.quantity, 250);
      expect(intent.unit, 'ml');
    });

    test('detecta consumo de alimento', () {
      final intent = parser.parseNatural('comi 100g de frango');

      expect(intent.type, AiIntentType.registerFoodConsumption);
      expect(intent.title, 'Frango');
      expect(intent.quantity, 100);
      expect(intent.unit, 'g');
    });

    test('detecta consumo de produto', () {
      final intent = parser.parseNatural('tomei whey');

      expect(intent.type, AiIntentType.registerProductConsumption);
      expect(intent.title, 'Whey');
    });

    test('detecta cadastro de produto', () {
      final intent = parser.parseNatural('cadastrar produto whey');

      expect(intent.type, AiIntentType.createProduct);
      expect(intent.title, 'Whey');
    });
  });

  group('AiCommandHandler', () {
    test('interpreta /addrotina', () {
      final intent = commands.parse('/addrotina estudar programacao hoje 20h');

      expect(intent, isNotNull);
      expect(intent!.type, AiIntentType.createRoutineItem);
      expect(intent.timeMinutes, 20 * 60);
      expect(intent.title, 'Estudar programacao');
    });

    test('interpreta /financas', () {
      final intent = commands.parse('/financas');

      expect(intent, isNotNull);
      expect(intent!.type, AiIntentType.listFinance);
    });

    test('interpreta /addagua', () {
      final intent = commands.parse('/addagua 250ml');

      expect(intent, isNotNull);
      expect(intent!.type, AiIntentType.registerWaterConsumption);
      expect(intent.quantity, 250);
    });

    test('interpreta /produtos', () {
      final intent = commands.parse('/produtos');

      expect(intent, isNotNull);
      expect(intent!.type, AiIntentType.listProducts);
    });

    test('interpreta /consumir', () {
      final intent = commands.parse('/consumir whey 30g');

      expect(intent, isNotNull);
      expect(intent!.type, AiIntentType.registerProductConsumption);
      expect(intent.title, 'Whey');
      expect(intent.quantity, 30);
      expect(intent.unit, 'g');
    });

    test('interpreta /nutricao', () {
      final intent = commands.parse('/nutricao');

      expect(intent, isNotNull);
      expect(intent!.type, AiIntentType.showNutritionSummary);
    });
  });

  group('AiEngine e contexto conversacional', () {
    late AppDatabase database;
    late PersonalRepository repository;
    late AiEngine engine;
    late AiIntentClassifier classifier;

    setUp(() {
      database = AppDatabase(NativeDatabase.memory());
      repository = PersonalRepository(database, SeedService(database));
      final actions = AiActions(repository);
      engine = AiEngine(
        repository: repository,
        parser: parser,
        actions: actions,
        contextManager: AiContextManager(repository),
      );
      classifier = AiIntentClassifier(parser, ProductService(repository));
    });

    tearDown(() async {
      await database.close();
    });

    test(
      'mantem contexto no cadastro de produto em varias mensagens',
      () async {
        final start = await engine.processMessage('cadastrar produto');

        expect(start.conversationState, isNotNull);
        expect(start.conversationState!.activeSkill, 'product');
        expect(start.conversationState!.waitingFor, 'product_name');
        expect(start.responseText, contains('nome do produto'));

        final partial = await engine.processMessage(
          'halls, 11kcal, 13g de acucar',
          conversationState: start.conversationState,
        );

        expect(partial.responseText, contains('Produto Halls'));
        expect(partial.responseText, contains('11 kcal'));
        expect(partial.responseText, contains('13g de acucar'));
        expect(partial.conversationState, isNotNull);
        expect(partial.conversationState!.collectedData['name'], 'Halls');
        expect(partial.conversationState!.collectedData['calories'], 11);
        expect(partial.conversationState!.collectedData['sugars'], 13);

        final saved = await engine.processMessage(
          'salvar assim',
          conversationState: partial.conversationState,
        );

        expect(saved.responseText, contains('Produto cadastrado: Halls.'));
        expect(saved.clearConversationState, isTrue);

        final products = await repository.loadProducts();
        final halls = products.firstWhere((product) => product.name == 'Halls');
        expect(halls.calories, 11);
        expect(halls.sugars, 13);
      },
    );

    test(
      'continuar fluxo de produto pede mais dados sem salvar antes da hora',
      () async {
        final start = await engine.processMessage('cadastrar produto');
        final partial = await engine.processMessage(
          'halls, 11kcal',
          conversationState: start.conversationState,
        );

        final continued = await engine.processMessage(
          'continuar',
          conversationState: partial.conversationState,
        );

        expect(
          continued.responseText,
          contains('Me envie os dados que faltam'),
        );
        expect(continued.conversationState, isNotNull);
        expect(continued.conversationState!.waitingFor, 'product_nutrition');

        final products = await repository.findProductsByQuery('Halls');
        expect(products, isEmpty);
      },
    );

    test('transforma bebi 250ml em confirmacao especifica de agua', () async {
      final result = await engine.processMessage('bebi 250ml');

      expect(result.responseText, contains('250ml'));
      expect(result.responseText, contains('agua'));
      expect(result.cards, isNotEmpty);
      expect(
        result.cards.first.actions.map((action) => action.id),
        contains('confirm_water_consumption'),
      );
    });

    test('classifica produto com dados incompletos sem contexto', () {
      final intent = classifier.classify('halls, 11kcal, 13g de acucar');

      expect(intent.type, AiIntentType.createProduct);
      expect(intent.skillId, 'product');
      expect(intent.title, 'Halls');
      expect(intent.shouldAskConfirmation, isTrue);
      expect(intent.entities['calories'], 11);
      expect(intent.entities['sugars'], 13);
      expect(intent.confidence, lessThan(0.8));
    });
  });
}
