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
        return AiParsedIntent(
          type: AiIntentType.createRoutineItem,
          module: AiModule.routine,
          originalMessage: message,
          title: _parser.cleanRoutineTitle(payload),
          scheduledDate: _parser.extractDate(payload) ?? DateTime.now(),
          timeMinutes: _parser.extractTimeMinutes(payload),
          metadata: const {'notify': 'false'},
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
      case '/historico':
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
