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
      case '/rotina':
        return AiParsedIntent(
          type: AiIntentType.listRoutine,
          module: AiModule.routine,
          originalMessage: message,
          scheduledDate: DateTime.now(),
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
        );
      case '/iniciartreino':
        return AiParsedIntent(
          type: AiIntentType.startWorkout,
          module: AiModule.training,
          originalMessage: message,
          title: payload.isEmpty
              ? 'Treino rapido'
              : _parser.extractWorkoutName(payload),
        );
      case '/add':
        return AiParsedIntent(
          type: AiIntentType.createTask,
          module: AiModule.tasks,
          originalMessage: message,
          title: _parser.cleanTaskTitle(payload),
          scheduledDate: _parser.extractDate(payload),
          timeMinutes: _parser.extractTimeMinutes(payload),
        );
      case '/financas':
        return AiParsedIntent(
          type: AiIntentType.listFinance,
          module: AiModule.finance,
          originalMessage: message,
        );
      case '/consumo':
        return AiParsedIntent(
          type: AiIntentType.showDailyConsumption,
          module: AiModule.consumption,
          originalMessage: message,
        );
      case '/agua':
        return AiParsedIntent(
          type: AiIntentType.showWaterIntake,
          module: AiModule.hydration,
          originalMessage: message,
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
        );
      case '/produtos':
        return AiParsedIntent(
          type: AiIntentType.listProducts,
          module: AiModule.products,
          originalMessage: message,
        );
      case '/addproduto':
        return AiParsedIntent(
          type: AiIntentType.createProduct,
          module: AiModule.products,
          originalMessage: message,
          title: payload.isEmpty
              ? 'Novo produto'
              : _parser.cleanProductName(payload),
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
        );
      case '/nutricao':
        return AiParsedIntent(
          type: AiIntentType.showNutritionSummary,
          module: AiModule.consumption,
          originalMessage: message,
        );
      case '/historico':
        if (_parser.normalize(payload).contains('consumo')) {
          return AiParsedIntent(
            type: AiIntentType.showDailyConsumption,
            module: AiModule.consumption,
            originalMessage: message,
          );
        }
        return AiParsedIntent(
          type: AiIntentType.listHistory,
          module: AiModule.history,
          originalMessage: message,
        );
      case '/help':
        return AiParsedIntent(
          type: AiIntentType.help,
          module: AiModule.assistant,
          originalMessage: message,
        );
      case '/confirmar':
        return AiParsedIntent(
          type: AiIntentType.unknown,
          module: AiModule.assistant,
          originalMessage: message,
          metadata: const {'confirmation': 'confirm'},
        );
      case '/cancelar':
        return AiParsedIntent(
          type: AiIntentType.unknown,
          module: AiModule.assistant,
          originalMessage: message,
          metadata: const {'confirmation': 'cancel'},
        );
      default:
        return AiParsedIntent(
          type: AiIntentType.unknown,
          module: AiModule.assistant,
          originalMessage: message,
        );
    }
  }
}
