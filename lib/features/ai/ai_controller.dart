import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../data/repositories/personal_repository.dart';
import '../../data/repositories/providers.dart';
import '../finance/chat/finance_chat_controller.dart';
import 'ai_actions.dart';
import 'ai_command_handler.dart';
import 'ai_context_manager.dart';
import 'ai_engine.dart';
import 'ai_history.dart';
import 'ai_models.dart';
import 'ai_parser.dart';

final aiControllerProvider = AsyncNotifierProvider<AiController, AiState>(
  AiController.new,
);

class AiController extends AsyncNotifier<AiState> {
  final Uuid _uuid = const Uuid();

  late final PersonalRepository _repository;
  late final AiParser _parser;
  late final AiCommandHandler _commands;
  late final AiActions _actions;
  late final AiContextManager _contextManager;
  late final AiEngine _engine;
  late final AiHistoryService _history;

  @override
  Future<AiState> build() async {
    _repository = ref.read(personalRepositoryProvider);
    _parser = AiParser();
    _commands = AiCommandHandler(_parser);
    _actions = AiActions(_repository);
    _contextManager = AiContextManager(_repository);
    _engine = AiEngine(
      repository: _repository,
      parser: _parser,
      actions: _actions,
      contextManager: _contextManager,
    );
    _history = AiHistoryService(_repository);

    await _repository.ensureReady();
    final entries = await _history.loadRecent();
    final conversationState = await _engine.loadConversationState();
    final restoredMessages = <AiChatMessage>[
      _assistantMessage(
        'Ola! Eu sou sua IA pessoal. Posso te ajudar com rotina, treinos, financas, consumo, produtos, tarefas e historico. O que deseja fazer agora?',
        createdAt: DateTime.now(),
      ),
    ];

    for (final entry in entries.reversed) {
      restoredMessages.add(
        _userMessage(entry.userMessage, createdAt: entry.createdAt),
      );
      restoredMessages.add(
        _assistantMessage(entry.aiResponse, createdAt: entry.createdAt),
      );
    }

    return AiState(
      messages: restoredMessages,
      isSending: false,
      conversationState: conversationState,
    );
  }

  Future<void> sendMessage(String rawMessage) async {
    final message = rawMessage.trim();
    if (message.isEmpty) {
      return;
    }

    final current = state.asData?.value;
    if (current == null) {
      return;
    }

    state = AsyncData(
      current.copyWith(
        messages: [...current.messages, _userMessage(message)],
        isSending: true,
      ),
    );

    final confirmationResult = await _maybeHandlePendingConfirmation(message);
    if (confirmationResult != null) {
      await _finalizeResult(
        message,
        confirmationResult,
        saveToHistory:
            confirmationResult.actionType != AiIntentType.clearHistory,
      );
      return;
    }

    final commandIntent = _commands.parse(message);
    final result = commandIntent == null
        ? await _engine.processMessage(
            message,
            conversationState: current.conversationState,
          )
        : await _engine.executeIntent(
            commandIntent,
            conversationState: current.conversationState,
          );
    await _finalizeResult(message, result);
  }

  Future<void> handleCardAction(AiChatCard card, AiCardAction action) async {
    if (action.id.startsWith('nav:') || action.id == 'open_immersive') {
      return;
    }

    final current = state.asData?.value;
    if (current == null) {
      return;
    }
    state = AsyncData(current.copyWith(isSending: true));

    late final AiExecutionResult result;
    late final String userMessage;

    switch (action.id) {
      case 'confirm_pending':
        userMessage = 'Confirmar';
        final pending = current.pendingConfirmation;
        result = pending == null
            ? _actions.cancelConfirmation()
            : await _actions.executeConfirmed(pending);
        break;
      case 'cancel_pending':
        userMessage = 'Cancelar';
        if (current.conversationState != null) {
          result = await _engine.processMessage(
            'cancelar',
            conversationState: current.conversationState,
          );
        } else {
          result = current.pendingProductDraft != null
              ? _actions.cancelPendingProductDraft()
              : _actions.cancelConfirmation();
        }
        break;
      case 'complete_routine':
        result = await _completeRoutineCard(card);
        userMessage = 'Concluir rotina';
        break;
      case 'complete_task':
        result = await _completeTaskCard(card);
        userMessage = 'Concluir tarefa';
        break;
      case 'start_workout':
        result = await _startWorkoutCard(card);
        userMessage = 'Iniciar treino';
        break;
      case 'register_ambiguous_product':
        userMessage = 'Registrar consumo';
        result = await _actions.execute(
          AiParsedIntent(
            type: AiIntentType.registerProductConsumption,
            module: AiModule.consumption,
            originalMessage: card.title,
            title: card.metadata['productName'] ?? card.title,
            quantity: double.tryParse(card.metadata['quantity'] ?? ''),
            unit: card.metadata['unit'] ?? 'porcao',
            consumptionType: AiConsumptionType.product,
          ),
        );
        break;
      case 'create_ambiguous_product':
      case 'create_product_from_consumption':
        userMessage = 'Cadastrar produto';
        result = await _engine.processMessage(
          'cadastrar produto ${card.metadata['productName'] ?? card.title}',
          conversationState: current.conversationState,
        );
        break;
      case 'register_as_food':
        userMessage = 'Registrar como alimento';
        result = await _actions.registerFreeFood(
          name: card.metadata['productName'] ?? card.title,
          quantity: double.tryParse(card.metadata['quantity'] ?? '') ?? 1,
          unit: card.metadata['unit'] ?? 'unidade',
        );
        break;
      case 'consume_matched_product':
        userMessage = 'Consumir produto';
        final productId = card.metadata['productId'];
        if (productId == null) {
          result = const AiExecutionResult(
            responseText: 'Nao consegui localizar esse produto agora.',
            actionType: AiIntentType.registerProductConsumption,
            module: AiModule.products,
          );
          break;
        }
        result = await _actions.registerProductById(
          productId: productId,
          quantity: double.tryParse(card.metadata['quantity'] ?? '') ?? 1,
          unit: card.metadata['unit'] ?? 'porcao',
        );
        break;
      case 'delete_product':
        userMessage = 'Excluir produto';
        final productId = card.metadata['productId'];
        if (productId == null) {
          result = const AiExecutionResult(
            responseText: 'Nao consegui localizar esse produto agora.',
            actionType: AiIntentType.unknown,
            module: AiModule.products,
          );
          break;
        }
        result = await _actions.deleteProductById(productId);
        break;
      case 'save_product_draft':
        userMessage = 'Salvar assim';
        result = await _engine.processMessage(
          'salvar assim',
          conversationState: current.conversationState,
        );
        break;
      case 'complete_product_draft':
        userMessage = 'Completar dados';
        result = await _engine.processMessage(
          'continuar',
          conversationState: current.conversationState,
        );
        break;
      case 'update_existing_pending_product':
        userMessage = 'Atualizar produto';
        result = await _engine.processMessage(
          'atualizar',
          conversationState: current.conversationState,
        );
        break;
      case 'create_new_pending_product':
        userMessage = 'Criar novo produto';
        result = await _engine.processMessage(
          'criar novo',
          conversationState: current.conversationState,
        );
        break;
      case 'confirm_water_consumption':
        userMessage = 'Sim, agua';
        result = await _actions.execute(
          AiParsedIntent(
            type: AiIntentType.registerWaterConsumption,
            module: AiModule.hydration,
            originalMessage: userMessage,
            title: 'Agua',
            quantity: double.tryParse(card.metadata['quantity'] ?? '') ?? 250,
            unit: card.metadata['unit'] ?? 'ml',
            consumptionType: AiConsumptionType.water,
          ),
        );
        break;
      case 'register_other_drink':
        userMessage = 'Outra bebida';
        result = const AiExecutionResult(
          responseText:
              'Tudo bem. Me diga qual bebida voce quer registrar e, se puder, a quantidade.',
          actionType: AiIntentType.registerDrinkConsumption,
          module: AiModule.consumption,
        );
        break;
      default:
        userMessage = action.label;
        result = const AiExecutionResult(
          responseText: 'Ainda nao sei executar essa acao pelo chat.',
          actionType: AiIntentType.unknown,
          module: AiModule.assistant,
        );
    }

    await _finalizeResult(userMessage, result);
  }

  Future<AiExecutionResult> _completeRoutineCard(AiChatCard card) async {
    final eventId = card.metadata['eventId'];
    final scheduledDate = card.metadata['scheduledDate'];
    if (eventId == null || scheduledDate == null) {
      return const AiExecutionResult(
        responseText: 'Nao consegui localizar esse item da rotina.',
        actionType: AiIntentType.unknown,
        module: AiModule.routine,
      );
    }

    final event = await _repository.loadRoutineEventById(eventId);
    if (event == null) {
      return const AiExecutionResult(
        responseText: 'Esse item da rotina nao esta mais disponivel.',
        actionType: AiIntentType.unknown,
        module: AiModule.routine,
      );
    }
    await _repository.completeRoutineEventForDate(
      event,
      DateTime.parse(scheduledDate),
    );
    return AiExecutionResult(
      responseText: '${event.title} marcado como concluido.',
      actionType: AiIntentType.listRoutine,
      module: AiModule.routine,
    );
  }

  Future<AiExecutionResult> _completeTaskCard(AiChatCard card) async {
    final taskId = card.metadata['taskId'];
    if (taskId == null) {
      return const AiExecutionResult(
        responseText: 'Nao consegui localizar essa tarefa.',
        actionType: AiIntentType.unknown,
        module: AiModule.tasks,
      );
    }
    final task = await _repository.loadTaskById(taskId);
    if (task == null) {
      return const AiExecutionResult(
        responseText: 'Essa tarefa nao esta mais disponivel.',
        actionType: AiIntentType.unknown,
        module: AiModule.tasks,
      );
    }
    await _repository.completeTask(task);
    return AiExecutionResult(
      responseText: '${task.title} concluida com sucesso.',
      actionType: AiIntentType.createTask,
      module: AiModule.tasks,
    );
  }

  Future<AiExecutionResult> _startWorkoutCard(AiChatCard card) async {
    final workoutId = card.metadata['workoutId'];
    if (workoutId == null) {
      return const AiExecutionResult(
        responseText: 'Nao consegui localizar esse treino agora.',
        actionType: AiIntentType.unknown,
        module: AiModule.training,
      );
    }
    final workout = await _repository.loadWorkoutById(workoutId);
    if (workout == null) {
      return const AiExecutionResult(
        responseText: 'Esse treino nao esta mais disponivel.',
        actionType: AiIntentType.unknown,
        module: AiModule.training,
      );
    }
    await _repository.startWorkout(workout);
    return AiExecutionResult(
      responseText: '${workout.name} iniciado. Vamos nessa.',
      actionType: AiIntentType.startWorkout,
      module: AiModule.training,
      cards: [
        AiChatCard(
          type: AiCardType.workout,
          title: workout.name,
          subtitle: workout.objective,
          status: 'Ativo agora',
          metadata: {
            'workoutId': workout.id,
            'planName': workout.name,
            'planObjective': workout.objective ?? 'Treino guiado pela IA.',
            'durationMinutes': workout.durationMinutes.toString(),
          },
          actions: const [
            AiCardAction(
              id: 'open_immersive',
              label: 'Iniciar',
              isPrimary: true,
            ),
          ],
        ),
      ],
    );
  }

  Future<AiExecutionResult?> _maybeHandlePendingConfirmation(
    String message,
  ) async {
    final pending = state.asData?.value.pendingConfirmation;
    if (pending == null) {
      return null;
    }

    final normalized = _parser.normalize(message);
    if (normalized == 'sim' ||
        normalized == 'confirmar' ||
        normalized == '/confirmar') {
      return _actions.executeConfirmed(pending);
    }
    if (normalized == 'nao' ||
        normalized == 'cancelar' ||
        normalized == '/cancelar') {
      return _actions.cancelConfirmation();
    }
    return null;
  }

  Future<void> _finalizeResult(
    String userMessage,
    AiExecutionResult result, {
    bool saveToHistory = true,
  }) async {
    final current = state.asData?.value;
    if (current == null) {
      return;
    }

    if (saveToHistory) {
      await _history.saveInteraction(
        userMessage: userMessage,
        aiResponse: result.responseText,
        actionType: result.actionType,
        module: result.module,
        metadataJson: jsonEncode({
          'cards': result.cards.length,
          if (result.pendingConfirmation != null) 'pending': true,
          if (result.conversationState != null)
            'activeSkill': result.conversationState!.activeSkill,
        }),
      );
    }

    _invalidateRelatedProviders(result);

    state = AsyncData(
      current.copyWith(
        messages: [
          ...current.messages,
          _assistantMessage(result.responseText, cards: result.cards),
        ],
        isSending: false,
        pendingConfirmation: result.pendingConfirmation,
        pendingProductDraft: result.pendingProductDraft,
        conversationState: result.conversationState,
        clearPendingConfirmation: result.clearPendingConfirmation,
        clearPendingProductDraft: result.clearPendingProductDraft,
        clearConversationState: result.clearConversationState,
      ),
    );
  }

  void _invalidateRelatedProviders(AiExecutionResult result) {
    if (result.module == AiModule.routine) {
      ref.invalidate(dashboardProvider);
      ref.invalidate(routineProvider(DateTime.now().weekday));
      ref.invalidate(
        routineProvider(DateTime.now().add(const Duration(days: 1)).weekday),
      );
      return;
    }

    if (result.module == AiModule.training) {
      ref.invalidate(dashboardProvider);
      return;
    }

    if (result.module == AiModule.tasks) {
      ref.invalidate(dashboardProvider);
      return;
    }

    if (result.module == AiModule.finance) {
      ref.invalidate(dashboardProvider);
      ref.invalidate(financeChatControllerProvider);
      return;
    }

    if (result.module == AiModule.products ||
        result.module == AiModule.consumption ||
        result.module == AiModule.hydration) {
      ref.invalidate(dashboardProvider);
      ref.invalidate(productsProvider);
    }
  }

  AiChatMessage _userMessage(String text, {DateTime? createdAt}) {
    return AiChatMessage(
      id: _uuid.v4(),
      sender: AiMessageSender.user,
      text: text,
      createdAt: createdAt ?? DateTime.now(),
    );
  }

  AiChatMessage _assistantMessage(
    String text, {
    DateTime? createdAt,
    List<AiChatCard> cards = const [],
  }) {
    return AiChatMessage(
      id: _uuid.v4(),
      sender: AiMessageSender.assistant,
      text: text,
      createdAt: createdAt ?? DateTime.now(),
      cards: cards,
    );
  }
}
