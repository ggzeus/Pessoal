import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../data/repositories/personal_repository.dart';
import '../../data/repositories/providers.dart';
import '../finance/chat/finance_chat_controller.dart';
import 'ai_actions.dart';
import 'ai_command_handler.dart';
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
  late final AiHistoryService _history;

  @override
  Future<AiState> build() async {
    _repository = ref.read(personalRepositoryProvider);
    _parser = AiParser();
    _commands = AiCommandHandler(_parser);
    _actions = AiActions(_repository);
    _history = AiHistoryService(_repository);

    await _repository.ensureReady();
    final entries = await _history.loadRecent();
    final restoredMessages = <AiChatMessage>[
      _assistantMessage(
        'Olá! Eu sou sua IA pessoal. Posso te ajudar a organizar sua rotina, iniciar treinos, registrar informações, adicionar tarefas e centralizar tudo no app. O que deseja fazer agora?',
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

    return AiState(messages: restoredMessages, isSending: false);
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
    final intent = commandIntent ?? _parser.parseNatural(message);
    final result = await _actions.execute(intent);
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
        result = _actions.cancelConfirmation();
        break;
      case 'complete_routine':
        final eventId = card.metadata['eventId'];
        final scheduledDate = card.metadata['scheduledDate'];
        userMessage = 'Concluir rotina';
        if (eventId == null || scheduledDate == null) {
          result = const AiExecutionResult(
            responseText: 'Nao consegui localizar esse item da rotina.',
            actionType: AiIntentType.unknown,
            module: AiModule.routine,
          );
          break;
        }
        final event = await _repository.loadRoutineEventById(eventId);
        if (event == null) {
          result = const AiExecutionResult(
            responseText: 'Esse item da rotina nao esta mais disponivel.',
            actionType: AiIntentType.unknown,
            module: AiModule.routine,
          );
          break;
        }
        await _repository.completeRoutineEventForDate(
          event,
          DateTime.parse(scheduledDate),
        );
        result = AiExecutionResult(
          responseText: '✅ ${event.title} marcado como concluido.',
          actionType: AiIntentType.listRoutine,
          module: AiModule.routine,
        );
        break;
      case 'complete_task':
        final taskId = card.metadata['taskId'];
        userMessage = 'Concluir tarefa';
        if (taskId == null) {
          result = const AiExecutionResult(
            responseText: 'Nao consegui localizar essa tarefa.',
            actionType: AiIntentType.unknown,
            module: AiModule.tasks,
          );
          break;
        }
        final task = await _repository.loadTaskById(taskId);
        if (task == null) {
          result = const AiExecutionResult(
            responseText: 'Essa tarefa nao esta mais disponivel.',
            actionType: AiIntentType.unknown,
            module: AiModule.tasks,
          );
          break;
        }
        await _repository.completeTask(task);
        result = AiExecutionResult(
          responseText: '✅ ${task.title} concluida com sucesso.',
          actionType: AiIntentType.createTask,
          module: AiModule.tasks,
        );
        break;
      case 'start_workout':
        final workoutId = card.metadata['workoutId'];
        userMessage = 'Iniciar treino';
        if (workoutId == null) {
          result = const AiExecutionResult(
            responseText: 'Nao consegui localizar esse treino agora.',
            actionType: AiIntentType.unknown,
            module: AiModule.training,
          );
          break;
        }
        final workout = await _repository.loadWorkoutById(workoutId);
        if (workout == null) {
          result = const AiExecutionResult(
            responseText: 'Esse treino nao esta mais disponivel.',
            actionType: AiIntentType.unknown,
            module: AiModule.training,
          );
          break;
        }
        await _repository.startWorkout(workout);
        result = AiExecutionResult(
          responseText: '🏋️ ${workout.name} iniciado. Vamos nessa.',
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
        normalized == 'não' ||
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
        clearPendingConfirmation: result.clearPendingConfirmation,
      ),
    );
  }

  void _invalidateRelatedProviders(AiExecutionResult result) {
    switch (result.module) {
      case AiModule.routine:
        ref.invalidate(dashboardProvider);
        ref.invalidate(routineProvider(DateTime.now().weekday));
        ref.invalidate(
          routineProvider(DateTime.now().add(const Duration(days: 1)).weekday),
        );
      case AiModule.training:
        ref.invalidate(dashboardProvider);
      case AiModule.tasks:
        ref.invalidate(dashboardProvider);
      case AiModule.finance:
        ref.invalidate(dashboardProvider);
        ref.invalidate(financeChatControllerProvider);
      case AiModule.history:
      case AiModule.notes:
      case AiModule.assistant:
        break;
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
