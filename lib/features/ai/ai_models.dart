enum AiMessageSender { user, assistant }

enum AiIntentType {
  createRoutineItem,
  listRoutine,
  startWorkout,
  listWorkout,
  createTask,
  createNote,
  createFinanceRecord,
  listFinance,
  listHistory,
  clearHistory,
  clearRoutine,
  help,
  unknown,
}

enum AiModule { assistant, routine, training, tasks, finance, notes, history }

enum AiFinanceRecordType { income, expense }

enum AiCardType { routine, workout, finance, confirmation, note, summary }

extension AiIntentTypeX on AiIntentType {
  String get storageValue => switch (this) {
    AiIntentType.createRoutineItem => 'CREATE_ROUTINE_ITEM',
    AiIntentType.listRoutine => 'LIST_ROUTINE',
    AiIntentType.startWorkout => 'START_WORKOUT',
    AiIntentType.listWorkout => 'LIST_WORKOUT',
    AiIntentType.createTask => 'CREATE_TASK',
    AiIntentType.createNote => 'CREATE_NOTE',
    AiIntentType.createFinanceRecord => 'CREATE_FINANCE_RECORD',
    AiIntentType.listFinance => 'LIST_FINANCE',
    AiIntentType.listHistory => 'LIST_HISTORY',
    AiIntentType.clearHistory => 'CLEAR_HISTORY',
    AiIntentType.clearRoutine => 'CLEAR_ROUTINE',
    AiIntentType.help => 'HELP',
    AiIntentType.unknown => 'UNKNOWN',
  };
}

extension AiModuleX on AiModule {
  String get storageValue => switch (this) {
    AiModule.assistant => 'assistant',
    AiModule.routine => 'routine',
    AiModule.training => 'training',
    AiModule.tasks => 'tasks',
    AiModule.finance => 'finance',
    AiModule.notes => 'notes',
    AiModule.history => 'history',
  };
}

class AiCardAction {
  const AiCardAction({
    required this.id,
    required this.label,
    this.isPrimary = false,
    this.isDestructive = false,
  });

  final String id;
  final String label;
  final bool isPrimary;
  final bool isDestructive;
}

class AiChatCard {
  const AiChatCard({
    required this.type,
    required this.title,
    this.subtitle,
    this.status,
    this.details = const [],
    this.metadata = const {},
    this.actions = const [],
  });

  final AiCardType type;
  final String title;
  final String? subtitle;
  final String? status;
  final List<String> details;
  final Map<String, String> metadata;
  final List<AiCardAction> actions;
}

class AiChatMessage {
  const AiChatMessage({
    required this.id,
    required this.sender,
    required this.text,
    required this.createdAt,
    this.cards = const [],
  });

  final String id;
  final AiMessageSender sender;
  final String text;
  final DateTime createdAt;
  final List<AiChatCard> cards;
}

class AiParsedIntent {
  const AiParsedIntent({
    required this.type,
    required this.module,
    required this.originalMessage,
    this.title,
    this.description,
    this.query,
    this.scheduledDate,
    this.timeMinutes,
    this.amount,
    this.financeType,
    this.metadata = const {},
  });

  final AiIntentType type;
  final AiModule module;
  final String originalMessage;
  final String? title;
  final String? description;
  final String? query;
  final DateTime? scheduledDate;
  final int? timeMinutes;
  final double? amount;
  final AiFinanceRecordType? financeType;
  final Map<String, String> metadata;

  AiParsedIntent copyWith({
    AiIntentType? type,
    AiModule? module,
    String? title,
    String? description,
    String? query,
    DateTime? scheduledDate,
    int? timeMinutes,
    double? amount,
    AiFinanceRecordType? financeType,
    Map<String, String>? metadata,
  }) {
    return AiParsedIntent(
      type: type ?? this.type,
      module: module ?? this.module,
      originalMessage: originalMessage,
      title: title ?? this.title,
      description: description ?? this.description,
      query: query ?? this.query,
      scheduledDate: scheduledDate ?? this.scheduledDate,
      timeMinutes: timeMinutes ?? this.timeMinutes,
      amount: amount ?? this.amount,
      financeType: financeType ?? this.financeType,
      metadata: metadata ?? this.metadata,
    );
  }
}

class AiPendingConfirmation {
  const AiPendingConfirmation({
    required this.id,
    required this.prompt,
    required this.intent,
  });

  final String id;
  final String prompt;
  final AiParsedIntent intent;
}

class AiExecutionResult {
  const AiExecutionResult({
    required this.responseText,
    required this.actionType,
    required this.module,
    this.cards = const [],
    this.pendingConfirmation,
    this.clearPendingConfirmation = false,
  });

  final String responseText;
  final AiIntentType actionType;
  final AiModule module;
  final List<AiChatCard> cards;
  final AiPendingConfirmation? pendingConfirmation;
  final bool clearPendingConfirmation;
}

class AiState {
  const AiState({
    required this.messages,
    required this.isSending,
    this.pendingConfirmation,
  });

  final List<AiChatMessage> messages;
  final bool isSending;
  final AiPendingConfirmation? pendingConfirmation;

  AiState copyWith({
    List<AiChatMessage>? messages,
    bool? isSending,
    AiPendingConfirmation? pendingConfirmation,
    bool clearPendingConfirmation = false,
  }) {
    return AiState(
      messages: messages ?? this.messages,
      isSending: isSending ?? this.isSending,
      pendingConfirmation: clearPendingConfirmation
          ? null
          : pendingConfirmation ?? this.pendingConfirmation,
    );
  }
}
