import 'package:controle_pessoal/features/ai/ai_command_handler.dart';
import 'package:controle_pessoal/features/ai/ai_models.dart';
import 'package:controle_pessoal/features/ai/ai_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
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
}
