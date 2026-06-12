import 'ai_models.dart';
import 'ai_parser.dart';

class AiCommandHandler {
  AiCommandHandler(this._parser);

  final AiParser _parser;

  AiParsedIntent? parse(String message) {
    final trimmed = message.trim();
    if (!trimmed.startsWith('/')) {
      return null;
    }

    final parts = trimmed.split(RegExp(r'\s+'));
    final command = parts.first.toLowerCase();
    final payload = trimmed.substring(command.length).trim();

    switch (command) {
      case '/help':
        return AiParsedIntent(
          type: AiIntentType.help,
          module: AiModule.assistant,
          originalMessage: message,
          skillId: 'app_help',
          confidence: 1,
        );
      case '/cancelar':
        return AiParsedIntent(
          type: AiIntentType.cancelAction,
          module: AiModule.assistant,
          originalMessage: message,
          confidence: 1,
        );
      case '/salvar':
        return AiParsedIntent(
          type: AiIntentType.savePendingAction,
          module: AiModule.assistant,
          originalMessage: message,
          confidence: 1,
        );
      case '/historico':
        if (_parser.normalize(payload).contains('consumo')) {
          return AiParsedIntent(
            type: AiIntentType.showDailyConsumption,
            module: AiModule.consumption,
            originalMessage: message,
            skillId: 'consumption',
            confidence: 1,
          );
        }
        return AiParsedIntent(
          type: AiIntentType.listHistory,
          module: AiModule.history,
          originalMessage: message,
          skillId: 'history',
          confidence: 1,
        );
      case '/rotina':
      case '/hoje':
        return AiParsedIntent(
          type: AiIntentType.listRoutine,
          module: AiModule.routine,
          originalMessage: message,
          scheduledDate: DateTime.now(),
          skillId: 'routine',
          confidence: 1,
        );
      case '/addrotina':
        final weekdays = _parser.extractWeekdays(payload);
        final normalizedPayload = _parser.normalize(payload);
        return AiParsedIntent(
          type: AiIntentType.createRoutineItem,
          module: AiModule.routine,
          originalMessage: message,
          title: _parser.cleanRoutineTitle(payload),
          scheduledDate: _parser.extractDate(payload) ?? DateTime.now(),
          timeMinutes: _parser.extractTimeMinutes(payload),
          skillId: 'routine',
          confidence: 1,
          metadata: {
            'notify': 'false',
            'recurrence': weekdays.length == 7
                ? 'daily'
                : (weekdays.isNotEmpty ? 'weekly' : 'single'),
            'weekdays': weekdays.join(','),
            if (normalizedPayload.contains('de 2 em 2 horas'))
              'interval_hours': '2',
          },
        );
      case '/treino':
        return AiParsedIntent(
          type: AiIntentType.listWorkout,
          module: AiModule.training,
          originalMessage: message,
          skillId: 'workout',
          confidence: 1,
        );
      case '/iniciartreino':
        return AiParsedIntent(
          type: AiIntentType.startWorkout,
          module: AiModule.training,
          originalMessage: message,
          title: payload.isEmpty
              ? 'Treino rapido'
              : _parser.extractWorkoutName(payload),
          skillId: 'workout',
          confidence: 1,
        );
      case '/add':
        return AiParsedIntent(
          type: AiIntentType.createTask,
          module: AiModule.tasks,
          originalMessage: message,
          title: _parser.cleanTaskTitle(payload),
          scheduledDate: _parser.extractDate(payload),
          timeMinutes: _parser.extractTimeMinutes(payload),
          skillId: 'task',
          confidence: 1,
        );
      case '/financas':
        return AiParsedIntent(
          type: AiIntentType.listFinance,
          module: AiModule.finance,
          originalMessage: message,
          skillId: 'finance',
          confidence: 1,
        );
      case '/saldo':
        return AiParsedIntent(
          type: AiIntentType.showBalance,
          module: AiModule.finance,
          originalMessage: message,
          skillId: 'finance',
          confidence: 1,
        );
      case '/addentrada':
        final incomeAmount = _parser.extractMoney(payload);
        return AiParsedIntent(
          type: AiIntentType.createFinanceIncome,
          module: AiModule.finance,
          originalMessage: message,
          amount: incomeAmount,
          financeType: AiFinanceRecordType.income,
          description: _parser.cleanFinanceDescription(payload),
          skillId: 'finance',
          confidence: incomeAmount == null ? 0.5 : 1,
        );
      case '/addsaida':
        final expenseAmount = _parser.extractMoney(payload);
        return AiParsedIntent(
          type: AiIntentType.createFinanceExpense,
          module: AiModule.finance,
          originalMessage: message,
          amount: expenseAmount,
          financeType: AiFinanceRecordType.expense,
          description: _parser.cleanFinanceDescription(payload),
          skillId: 'finance',
          confidence: expenseAmount == null ? 0.5 : 1,
        );
      case '/consumo':
        return AiParsedIntent(
          type: AiIntentType.showDailyConsumption,
          module: AiModule.consumption,
          originalMessage: message,
          skillId: 'consumption',
          confidence: 1,
        );
      case '/agua':
        return AiParsedIntent(
          type: AiIntentType.showWaterIntake,
          module: AiModule.hydration,
          originalMessage: message,
          skillId: 'consumption',
          confidence: 1,
        );
      case '/addagua':
        final parsed =
            _parser.extractQuantity(payload) ??
            const ParsedQuantity(quantity: 250, unit: 'ml');
        return AiParsedIntent(
          type: AiIntentType.registerWaterConsumption,
          module: AiModule.hydration,
          originalMessage: message,
          title: 'Agua',
          quantity: parsed.quantity,
          unit: parsed.unit,
          consumptionType: AiConsumptionType.water,
          skillId: 'consumption',
          confidence: 1,
        );
      case '/consumir':
        final parsed =
            _parser.extractQuantity(payload) ??
            const ParsedQuantity(quantity: 1, unit: 'porcao');
        return AiParsedIntent(
          type: AiIntentType.registerProductConsumption,
          module: AiModule.consumption,
          originalMessage: message,
          title: _parser.cleanConsumptionName(payload),
          quantity: parsed.quantity,
          unit: parsed.unit,
          consumptionType: AiConsumptionType.product,
          skillId: 'consumption',
          confidence: 1,
        );
      case '/nutricao':
        return AiParsedIntent(
          type: AiIntentType.showNutritionSummary,
          module: AiModule.consumption,
          originalMessage: message,
          skillId: 'consumption',
          confidence: 1,
        );
      case '/produtos':
        return AiParsedIntent(
          type: AiIntentType.listProducts,
          module: AiModule.products,
          originalMessage: message,
          skillId: 'product',
          confidence: 1,
        );
      case '/produto':
        return AiParsedIntent(
          type: AiIntentType.findProduct,
          module: AiModule.products,
          originalMessage: message,
          title: payload,
          query: payload,
          skillId: 'product',
          confidence: payload.isEmpty ? 0.4 : 1,
        );
      case '/addproduto':
        return AiParsedIntent(
          type: AiIntentType.createProduct,
          module: AiModule.products,
          originalMessage: message,
          title: payload.isEmpty
              ? 'Novo produto'
              : _parser.cleanProductName(payload),
          skillId: 'product',
          confidence: 1,
        );
      case '/editarproduto':
        return AiParsedIntent(
          type: AiIntentType.updateProduct,
          module: AiModule.products,
          originalMessage: message,
          title: payload,
          skillId: 'product',
          confidence: payload.isEmpty ? 0.4 : 1,
        );
      default:
        return AiParsedIntent(
          type: AiIntentType.unknown,
          module: AiModule.assistant,
          originalMessage: message,
          confidence: 0.2,
        );
    }
  }
}
