enum AiMessageSender { user, assistant }

enum AiIntentType {
  createRoutineItem,
  updateRoutineItem,
  listRoutine,
  completeRoutineItem,
  deleteRoutineItem,
  startWorkout,
  finishWorkout,
  listWorkout,
  registerExercise,
  createTask,
  listTasks,
  completeTask,
  createNote,
  createFinanceRecord,
  createFinanceIncome,
  createFinanceExpense,
  listFinance,
  showBalance,
  listHistory,
  listAiHistory,
  registerWaterConsumption,
  registerFoodConsumption,
  registerDrinkConsumption,
  registerProductConsumption,
  createProduct,
  updateProduct,
  listProducts,
  findProduct,
  deleteProduct,
  addProductNutrition,
  showDailyConsumption,
  showWaterIntake,
  showNutritionSummary,
  showCaloriesToday,
  showNutrientToday,
  listTodayConsumption,
  clearHistory,
  clearRoutine,
  savePendingAction,
  cancelAction,
  editPendingAction,
  help,
  explainApp,
  explainCommands,
  unknown,
}

enum AiModule {
  assistant,
  routine,
  home,
  training,
  tasks,
  finance,
  products,
  consumption,
  hydration,
  settings,
  notes,
  history,
}

enum AiFinanceRecordType { income, expense }

enum AiConsumptionType { water, food, drink, product }

enum AiCardType {
  routine,
  workout,
  finance,
  confirmation,
  note,
  summary,
  product,
  consumption,
  water,
}

extension AiIntentTypeX on AiIntentType {
  String get storageValue => switch (this) {
    AiIntentType.createRoutineItem => 'CREATE_ROUTINE_ITEM',
    AiIntentType.updateRoutineItem => 'UPDATE_ROUTINE_ITEM',
    AiIntentType.listRoutine => 'LIST_ROUTINE',
    AiIntentType.completeRoutineItem => 'COMPLETE_ROUTINE_ITEM',
    AiIntentType.deleteRoutineItem => 'DELETE_ROUTINE_ITEM',
    AiIntentType.startWorkout => 'START_WORKOUT',
    AiIntentType.finishWorkout => 'FINISH_WORKOUT',
    AiIntentType.listWorkout => 'LIST_WORKOUTS',
    AiIntentType.registerExercise => 'REGISTER_EXERCISE',
    AiIntentType.createTask => 'CREATE_TASK',
    AiIntentType.listTasks => 'LIST_TASKS',
    AiIntentType.completeTask => 'COMPLETE_TASK',
    AiIntentType.createNote => 'CREATE_NOTE',
    AiIntentType.createFinanceRecord => 'CREATE_FINANCE_RECORD',
    AiIntentType.createFinanceIncome => 'CREATE_FINANCE_INCOME',
    AiIntentType.createFinanceExpense => 'CREATE_FINANCE_EXPENSE',
    AiIntentType.listFinance => 'LIST_FINANCE_HISTORY',
    AiIntentType.showBalance => 'SHOW_BALANCE',
    AiIntentType.listHistory => 'LIST_HISTORY',
    AiIntentType.listAiHistory => 'LIST_AI_HISTORY',
    AiIntentType.registerWaterConsumption => 'REGISTER_WATER_CONSUMPTION',
    AiIntentType.registerFoodConsumption => 'REGISTER_FOOD_CONSUMPTION',
    AiIntentType.registerDrinkConsumption => 'REGISTER_DRINK_CONSUMPTION',
    AiIntentType.registerProductConsumption => 'REGISTER_PRODUCT_CONSUMPTION',
    AiIntentType.createProduct => 'CREATE_PRODUCT',
    AiIntentType.updateProduct => 'UPDATE_PRODUCT',
    AiIntentType.listProducts => 'LIST_PRODUCTS',
    AiIntentType.findProduct => 'FIND_PRODUCT',
    AiIntentType.deleteProduct => 'DELETE_PRODUCT',
    AiIntentType.addProductNutrition => 'ADD_PRODUCT_NUTRITION',
    AiIntentType.showDailyConsumption => 'SHOW_DAILY_CONSUMPTION',
    AiIntentType.showWaterIntake => 'SHOW_WATER_INTAKE',
    AiIntentType.showNutritionSummary => 'SHOW_NUTRITION_SUMMARY',
    AiIntentType.showCaloriesToday => 'SHOW_CALORIES_TODAY',
    AiIntentType.showNutrientToday => 'SHOW_NUTRIENT_TODAY',
    AiIntentType.listTodayConsumption => 'LIST_TODAY_CONSUMPTION',
    AiIntentType.clearHistory => 'CLEAR_HISTORY',
    AiIntentType.clearRoutine => 'CLEAR_ROUTINE',
    AiIntentType.savePendingAction => 'SAVE_PENDING_ACTION',
    AiIntentType.cancelAction => 'CANCEL_ACTION',
    AiIntentType.editPendingAction => 'EDIT_PENDING_ACTION',
    AiIntentType.help => 'SHOW_HELP',
    AiIntentType.explainApp => 'EXPLAIN_APP',
    AiIntentType.explainCommands => 'EXPLAIN_COMMANDS',
    AiIntentType.unknown => 'UNKNOWN',
  };
}

extension AiModuleX on AiModule {
  String get storageValue => switch (this) {
    AiModule.assistant => 'assistant',
    AiModule.routine => 'routine',
    AiModule.home => 'home',
    AiModule.training => 'training',
    AiModule.tasks => 'tasks',
    AiModule.finance => 'finance',
    AiModule.products => 'products',
    AiModule.consumption => 'consumption',
    AiModule.hydration => 'hydration',
    AiModule.settings => 'settings',
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
    this.consumptionType,
    this.quantity,
    this.unit,
    this.skillId,
    this.confidence = 0,
    this.entities = const {},
    this.missingFields = const [],
    this.shouldAskConfirmation = false,
    this.shouldContinueFlow = false,
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
  final AiConsumptionType? consumptionType;
  final double? quantity;
  final String? unit;
  final String? skillId;
  final double confidence;
  final Map<String, Object?> entities;
  final List<String> missingFields;
  final bool shouldAskConfirmation;
  final bool shouldContinueFlow;
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
    AiConsumptionType? consumptionType,
    double? quantity,
    String? unit,
    String? skillId,
    double? confidence,
    Map<String, Object?>? entities,
    List<String>? missingFields,
    bool? shouldAskConfirmation,
    bool? shouldContinueFlow,
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
      consumptionType: consumptionType ?? this.consumptionType,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      skillId: skillId ?? this.skillId,
      confidence: confidence ?? this.confidence,
      entities: entities ?? this.entities,
      missingFields: missingFields ?? this.missingFields,
      shouldAskConfirmation:
          shouldAskConfirmation ?? this.shouldAskConfirmation,
      shouldContinueFlow: shouldContinueFlow ?? this.shouldContinueFlow,
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

class AiPendingProductDraft {
  const AiPendingProductDraft({required this.name, this.brand, this.category});

  final String name;
  final String? brand;
  final String? category;
}

class AiConversationState {
  const AiConversationState({
    required this.activeSkill,
    required this.pendingIntent,
    required this.step,
    required this.collectedData,
    required this.missingFields,
    required this.createdAt,
    this.waitingFor,
    this.lastAssistantMessage,
    this.expectingConfirmation = false,
    this.expectingAdditionalData = false,
  });

  final String activeSkill;
  final AiIntentType pendingIntent;
  final String step;
  final Map<String, Object?> collectedData;
  final List<String> missingFields;
  final String? waitingFor;
  final String? lastAssistantMessage;
  final DateTime createdAt;
  final bool expectingConfirmation;
  final bool expectingAdditionalData;

  AiConversationState copyWith({
    String? activeSkill,
    AiIntentType? pendingIntent,
    String? step,
    Map<String, Object?>? collectedData,
    List<String>? missingFields,
    String? waitingFor,
    String? lastAssistantMessage,
    DateTime? createdAt,
    bool? expectingConfirmation,
    bool? expectingAdditionalData,
  }) {
    return AiConversationState(
      activeSkill: activeSkill ?? this.activeSkill,
      pendingIntent: pendingIntent ?? this.pendingIntent,
      step: step ?? this.step,
      collectedData: collectedData ?? this.collectedData,
      missingFields: missingFields ?? this.missingFields,
      waitingFor: waitingFor ?? this.waitingFor,
      lastAssistantMessage: lastAssistantMessage ?? this.lastAssistantMessage,
      createdAt: createdAt ?? this.createdAt,
      expectingConfirmation:
          expectingConfirmation ?? this.expectingConfirmation,
      expectingAdditionalData:
          expectingAdditionalData ?? this.expectingAdditionalData,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'activeSkill': activeSkill,
      'pendingIntent': pendingIntent.storageValue,
      'step': step,
      'collectedData': collectedData,
      'missingFields': missingFields,
      'waitingFor': waitingFor,
      'lastAssistantMessage': lastAssistantMessage,
      'createdAt': createdAt.toIso8601String(),
      'expectingConfirmation': expectingConfirmation,
      'expectingAdditionalData': expectingAdditionalData,
    };
  }

  static AiConversationState fromJson(Map<String, Object?> json) {
    final pendingIntentValue = (json['pendingIntent'] ?? 'UNKNOWN')
        .toString()
        .trim();
    final intent = AiIntentType.values.firstWhere(
      (value) => value.storageValue == pendingIntentValue,
      orElse: () => AiIntentType.unknown,
    );
    final rawCollected = json['collectedData'];
    final collected = rawCollected is Map
        ? rawCollected.map(
            (key, value) => MapEntry(key.toString(), _decodeJsonValue(value)),
          )
        : <String, Object?>{};

    final rawMissing = json['missingFields'];
    final missing = rawMissing is List
        ? rawMissing.map((item) => item.toString()).toList()
        : const <String>[];

    return AiConversationState(
      activeSkill: (json['activeSkill'] ?? '').toString(),
      pendingIntent: intent,
      step: (json['step'] ?? '').toString(),
      collectedData: collected,
      missingFields: missing,
      waitingFor: json['waitingFor']?.toString(),
      lastAssistantMessage: json['lastAssistantMessage']?.toString(),
      createdAt:
          DateTime.tryParse((json['createdAt'] ?? '').toString()) ??
          DateTime.now(),
      expectingConfirmation: json['expectingConfirmation'] == true,
      expectingAdditionalData: json['expectingAdditionalData'] == true,
    );
  }
}

Object? _decodeJsonValue(Object? value) {
  if (value is Map) {
    return value.map(
      (key, nestedValue) =>
          MapEntry(key.toString(), _decodeJsonValue(nestedValue)),
    );
  }
  if (value is List) {
    return value.map(_decodeJsonValue).toList();
  }
  return value;
}

class AiExecutionResult {
  const AiExecutionResult({
    required this.responseText,
    required this.actionType,
    required this.module,
    this.cards = const [],
    this.pendingConfirmation,
    this.pendingProductDraft,
    this.conversationState,
    this.clearPendingConfirmation = false,
    this.clearPendingProductDraft = false,
    this.clearConversationState = false,
  });

  final String responseText;
  final AiIntentType actionType;
  final AiModule module;
  final List<AiChatCard> cards;
  final AiPendingConfirmation? pendingConfirmation;
  final AiPendingProductDraft? pendingProductDraft;
  final AiConversationState? conversationState;
  final bool clearPendingConfirmation;
  final bool clearPendingProductDraft;
  final bool clearConversationState;
}

class AiState {
  const AiState({
    required this.messages,
    required this.isSending,
    this.pendingConfirmation,
    this.pendingProductDraft,
    this.conversationState,
  });

  final List<AiChatMessage> messages;
  final bool isSending;
  final AiPendingConfirmation? pendingConfirmation;
  final AiPendingProductDraft? pendingProductDraft;
  final AiConversationState? conversationState;

  AiState copyWith({
    List<AiChatMessage>? messages,
    bool? isSending,
    AiPendingConfirmation? pendingConfirmation,
    AiPendingProductDraft? pendingProductDraft,
    AiConversationState? conversationState,
    bool clearPendingConfirmation = false,
    bool clearPendingProductDraft = false,
    bool clearConversationState = false,
  }) {
    return AiState(
      messages: messages ?? this.messages,
      isSending: isSending ?? this.isSending,
      pendingConfirmation: clearPendingConfirmation
          ? null
          : pendingConfirmation ?? this.pendingConfirmation,
      pendingProductDraft: clearPendingProductDraft
          ? null
          : pendingProductDraft ?? this.pendingProductDraft,
      conversationState: clearConversationState
          ? null
          : conversationState ?? this.conversationState,
    );
  }
}
