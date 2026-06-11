import 'package:controle_pessoal/data/local/database/app_database.dart';
import 'package:controle_pessoal/features/finance/chat/finance_chat_models.dart';
import 'package:controle_pessoal/features/finance/chat/finance_message_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final parser = FinanceMessageParser(_categories);

  group('FinanceMessageParser', () {
    test('detecta entrada em mensagem natural', () {
      final intent = parser.parse(
        'Recebi 1500 do salario',
        awaitingClearConfirmation: false,
      );

      expect(intent, isA<FinanceRegisterMovementIntent>());
      final register = intent as FinanceRegisterMovementIntent;
      expect(register.type, FinanceEntryType.income);
      expect(register.amount, 1500);
      expect(register.description, 'Salario');
      expect(register.categoryId, 'FIN-CAT-004');
    });

    test('detecta saida em mensagem natural', () {
      final intent = parser.parse(
        'Comprei lanche 28 reais',
        awaitingClearConfirmation: false,
      );

      expect(intent, isA<FinanceRegisterMovementIntent>());
      final register = intent as FinanceRegisterMovementIntent;
      expect(register.type, FinanceEntryType.expense);
      expect(register.amount, 28);
      expect(register.description, 'Lanche');
      expect(register.categoryId, 'FIN-CAT-001');
    });

    test('comando add sempre vira entrada', () {
      final intent = parser.parse(
        '/add 500 presente',
        awaitingClearConfirmation: false,
      );

      expect(intent, isA<FinanceRegisterMovementIntent>());
      final register = intent as FinanceRegisterMovementIntent;
      expect(register.type, FinanceEntryType.income);
      expect(register.amount, 500);
      expect(register.description, 'Presente');
      expect(register.compactResponse, isTrue);
    });

    test('retorna erro quando nao encontra valor', () {
      final intent = parser.parse(
        'gastei no mercado',
        awaitingClearConfirmation: false,
      );

      expect(intent, isA<FinanceInvalidIntent>());
    });

    test('interpreta confirmacao de limpeza quando aguardando', () {
      final intent = parser.parse('sim', awaitingClearConfirmation: true);

      expect(intent, isA<FinanceConfirmClearIntent>());
    });
  });
}

final _categories = [
  FinanceCategory(
    id: 'FIN-CAT-001',
    name: 'Alimentacao',
    nature: 'expense',
    description: null,
    acceptsRecurrence: true,
    alertRule: null,
    createdAt: DateTime(2026),
  ),
  FinanceCategory(
    id: 'FIN-CAT-004',
    name: 'Trabalho',
    nature: 'income',
    description: null,
    acceptsRecurrence: true,
    alertRule: null,
    createdAt: DateTime(2026),
  ),
  FinanceCategory(
    id: 'FIN-CAT-009',
    name: 'Familia',
    nature: 'expense',
    description: null,
    acceptsRecurrence: false,
    alertRule: null,
    createdAt: DateTime(2026),
  ),
];
