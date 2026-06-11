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
      final intent = parser.parseNatural('Adiciona gasto de 35 reais no mercado');

      expect(intent.type, AiIntentType.createFinanceRecord);
      expect(intent.financeType, AiFinanceRecordType.expense);
      expect(intent.amount, 35);
    });

    test('detecta historico', () {
      final intent = parser.parseNatural('Me mostra meu historico');

      expect(intent.type, AiIntentType.listHistory);
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
  });
}
