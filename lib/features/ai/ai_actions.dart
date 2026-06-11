import 'package:intl/intl.dart';

import '../../core/utils/date_utils.dart';
import '../../data/local/database/app_database.dart';
import '../../data/repositories/personal_repository.dart';
import 'ai_models.dart';

class AiActions {
  AiActions(this._repository)
    : _money = NumberFormat.currency(locale: 'pt_BR', symbol: r'R$'),
      _date = DateFormat("dd/MM/yyyy 'as' HH:mm", 'pt_BR');

  final PersonalRepository _repository;
  final NumberFormat _money;
  final DateFormat _date;

  Future<AiExecutionResult> execute(AiParsedIntent intent) async {
    switch (intent.type) {
      case AiIntentType.createRoutineItem:
        return _createRoutineItem(intent);
      case AiIntentType.listRoutine:
        return _listRoutine(intent);
      case AiIntentType.startWorkout:
        return _startWorkout(intent);
      case AiIntentType.listWorkout:
        return _listWorkout(intent);
      case AiIntentType.createTask:
        return _createTask(intent);
      case AiIntentType.createNote:
        return _createNote(intent);
      case AiIntentType.createFinanceRecord:
        return _createFinanceRecord(intent);
      case AiIntentType.listFinance:
        return _listFinance();
      case AiIntentType.listHistory:
        return _listHistory();
      case AiIntentType.clearHistory:
        return _askToConfirm(
          intent,
          '⚠️ Tem certeza que deseja apagar o historico da IA?',
        );
      case AiIntentType.clearRoutine:
        return _askToConfirm(
          intent,
          '⚠️ Tem certeza que deseja apagar a rotina desse dia?',
        );
      case AiIntentType.help:
        return _help();
      case AiIntentType.unknown:
        return const AiExecutionResult(
          responseText:
              'Nao consegui entender totalmente. Você quer adicionar isso à rotina, iniciar um treino ou salvar como anotação?',
          actionType: AiIntentType.unknown,
          module: AiModule.assistant,
        );
    }
  }

  Future<AiExecutionResult> executeConfirmed(
    AiPendingConfirmation confirmation,
  ) async {
    switch (confirmation.intent.type) {
      case AiIntentType.clearHistory:
        await _repository.clearAiHistory();
        return const AiExecutionResult(
          responseText: '🧹 Historico da IA apagado com sucesso.',
          actionType: AiIntentType.clearHistory,
          module: AiModule.history,
          clearPendingConfirmation: true,
        );
      case AiIntentType.clearRoutine:
        final date = confirmation.intent.scheduledDate ?? DateTime.now();
        await _repository.clearRoutineForWeekday(date.weekday);
        return AiExecutionResult(
          responseText: '🗑️ Rotina do dia removida com sucesso.',
          actionType: AiIntentType.clearRoutine,
          module: AiModule.routine,
          clearPendingConfirmation: true,
        );
      default:
        return const AiExecutionResult(
          responseText: 'Tudo certo, seguimos sem alterar nada importante.',
          actionType: AiIntentType.unknown,
          module: AiModule.assistant,
          clearPendingConfirmation: true,
        );
    }
  }

  AiExecutionResult cancelConfirmation() {
    return const AiExecutionResult(
      responseText: 'Perfeito, mantive tudo como estava.',
      actionType: AiIntentType.unknown,
      module: AiModule.assistant,
      clearPendingConfirmation: true,
    );
  }

  Future<AiExecutionResult> _createRoutineItem(AiParsedIntent intent) async {
    if (intent.timeMinutes == null) {
      return const AiExecutionResult(
        responseText:
            'Entendi que você quer adicionar algo à rotina, mas preciso de um horário ou data.',
        actionType: AiIntentType.createRoutineItem,
        module: AiModule.routine,
      );
    }

    final scheduledDate = intent.scheduledDate ?? DateTime.now();
    final title = intent.title ?? 'Novo item na rotina';
    final startMinutes = intent.timeMinutes!;
    final endMinutes = (startMinutes + _defaultDurationForTitle(title)).clamp(
      0,
      24 * 60,
    );
    final event = await _repository.addRoutineEvent(
      title: title,
      type: _routineTypeFor(title),
      weekday: scheduledDate.weekday,
      startMinutes: startMinutes,
      endMinutes: endMinutes,
      description: intent.description,
      notify: intent.metadata['notify'] == 'true',
      variable: true,
    );

    final dateTime = _combineDateAndTime(scheduledDate, startMinutes);
    return AiExecutionResult(
      responseText:
          '📅 Adicionado à sua rotina:\n$title em ${_date.format(dateTime)}.',
      actionType: AiIntentType.createRoutineItem,
      module: AiModule.routine,
      cards: [
        AiChatCard(
          type: AiCardType.routine,
          title: event.title,
          subtitle: _date.format(dateTime),
          status: 'Planejado',
          details: [
            'Tipo: ${event.type}',
            'Horario: ${AppDateUtils.clockFromMinutes(event.startMinutes)} - ${AppDateUtils.clockFromMinutes(event.endMinutes)}',
          ],
          metadata: {
            'eventId': event.id,
            'scheduledDate': AppDateUtils.startOfDay(
              scheduledDate,
            ).toIso8601String(),
          },
          actions: const [
            AiCardAction(
              id: 'nav:/routine',
              label: 'Abrir rotina',
              isPrimary: true,
            ),
          ],
        ),
      ],
    );
  }

  Future<AiExecutionResult> _listRoutine(AiParsedIntent intent) async {
    final date = AppDateUtils.startOfDay(
      intent.scheduledDate ?? DateTime.now(),
    );
    final events = await _repository.loadRoutineForWeekday(date.weekday);
    final logs = await _repository.loadRoutineLogsForDate(date);
    final tasks = await _repository.loadTasksForDate(date);
    final completedIds = logs.map((log) => log.routineEventId).toSet();

    if (events.isEmpty && tasks.isEmpty) {
      return AiExecutionResult(
        responseText:
            'Hoje está livre por aqui. Posso adicionar algo à sua rotina se quiser.',
        actionType: AiIntentType.listRoutine,
        module: AiModule.routine,
      );
    }

    final cards = <AiChatCard>[
      for (final event in events)
        AiChatCard(
          type: AiCardType.routine,
          title: event.title,
          subtitle:
              '${AppDateUtils.clockFromMinutes(event.startMinutes)} - ${AppDateUtils.clockFromMinutes(event.endMinutes)}',
          status: completedIds.contains(event.id) ? 'Concluido' : 'Planejado',
          details: [
            'Categoria: ${event.type}',
            'Dia: ${DateFormat('dd/MM/yyyy').format(date)}',
          ],
          metadata: {
            'eventId': event.id,
            'scheduledDate': date.toIso8601String(),
          },
          actions: [
            if (!completedIds.contains(event.id))
              const AiCardAction(
                id: 'complete_routine',
                label: 'Concluir',
                isPrimary: true,
              ),
            const AiCardAction(id: 'nav:/routine', label: 'Editar'),
          ],
        ),
      for (final task in tasks)
        AiChatCard(
          type: AiCardType.routine,
          title: task.title,
          subtitle: task.dueDate == null
              ? 'Sem horario'
              : _date.format(task.dueDate!),
          status: 'Pendente',
          metadata: {'taskId': task.id},
          actions: const [
            AiCardAction(
              id: 'complete_task',
              label: 'Concluir',
              isPrimary: true,
            ),
          ],
        ),
    ];

    return AiExecutionResult(
      responseText:
          '📋 Aqui está sua rotina de ${DateFormat('dd/MM').format(date)}.',
      actionType: AiIntentType.listRoutine,
      module: AiModule.routine,
      cards: cards,
    );
  }

  Future<AiExecutionResult> _startWorkout(AiParsedIntent intent) async {
    final workoutName = intent.title ?? 'Treino rapido';
    final existing = await _repository.findWorkoutByQuery(workoutName);
    final workout =
        existing ??
        await _repository.createAdHocWorkout(
          name:
              'Treino ${workoutName.toLowerCase().startsWith('treino') ? workoutName.substring(6).trim() : workoutName}',
          objective:
              'Sessao criada pela IA para manter sua constancia em $workoutName.',
        );
    await _repository.startWorkout(workout);

    return AiExecutionResult(
      responseText: '🏋️ Treino iniciado. Bora manter o foco.',
      actionType: AiIntentType.startWorkout,
      module: AiModule.training,
      cards: [
        AiChatCard(
          type: AiCardType.workout,
          title: workout.name,
          subtitle: workout.objective,
          status: 'Ativo agora',
          details: [
            'Duracao estimada: ${workout.durationMinutes} min',
            'Intensidade: ${workout.intensity}',
          ],
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
            AiCardAction(id: 'nav:/training', label: 'Ver treinos'),
          ],
        ),
      ],
    );
  }

  Future<AiExecutionResult> _listWorkout(AiParsedIntent intent) async {
    final workouts = await _repository.loadWorkouts();
    if (workouts.isEmpty) {
      return const AiExecutionResult(
        responseText: 'Ainda nao encontrei treinos cadastrados por aqui.',
        actionType: AiIntentType.listWorkout,
        module: AiModule.training,
      );
    }

    return AiExecutionResult(
      responseText: '🏃 Separei alguns treinos para você escolher.',
      actionType: AiIntentType.listWorkout,
      module: AiModule.training,
      cards: [
        for (final workout in workouts.take(3))
          AiChatCard(
            type: AiCardType.workout,
            title: workout.name,
            subtitle: workout.objective,
            details: [
              'Tipo: ${workout.type}',
              'Duracao estimada: ${workout.durationMinutes} min',
            ],
            metadata: {
              'workoutId': workout.id,
              'planName': workout.name,
              'planObjective': workout.objective ?? 'Treino do repertorio.',
              'durationMinutes': workout.durationMinutes.toString(),
            },
            actions: const [
              AiCardAction(
                id: 'start_workout',
                label: 'Iniciar',
                isPrimary: true,
              ),
              AiCardAction(id: 'nav:/training', label: 'Abrir modulo'),
            ],
          ),
      ],
    );
  }

  Future<AiExecutionResult> _createTask(AiParsedIntent intent) async {
    final title = intent.title;
    if (title == null || title.trim().isEmpty) {
      return const AiExecutionResult(
        responseText: 'Entendi a ideia, mas preciso da descricao da tarefa.',
        actionType: AiIntentType.createTask,
        module: AiModule.tasks,
      );
    }

    final dueDate = _combineOptionalDateAndTime(
      intent.scheduledDate,
      intent.timeMinutes,
    );
    final task = await _repository.addTask(title, dueDate: dueDate);
    return AiExecutionResult(
      responseText: '✅ Registrado com sucesso.',
      actionType: AiIntentType.createTask,
      module: AiModule.tasks,
      cards: [
        AiChatCard(
          type: AiCardType.routine,
          title: task.title,
          subtitle: dueDate == null
              ? 'Sem prazo definido'
              : _date.format(dueDate),
          status: 'Pendente',
          metadata: {'taskId': task.id},
          actions: const [
            AiCardAction(
              id: 'complete_task',
              label: 'Concluir',
              isPrimary: true,
            ),
          ],
        ),
      ],
    );
  }

  Future<AiExecutionResult> _createNote(AiParsedIntent intent) async {
    final content = intent.description;
    if (content == null || content.trim().isEmpty) {
      return const AiExecutionResult(
        responseText: 'Posso salvar isso, mas preciso do texto da anotacao.',
        actionType: AiIntentType.createNote,
        module: AiModule.notes,
      );
    }

    final note = await _repository.addAiNote(content);
    return AiExecutionResult(
      responseText: '📝 Anotacao salva com sucesso.',
      actionType: AiIntentType.createNote,
      module: AiModule.notes,
      cards: [
        AiChatCard(
          type: AiCardType.note,
          title: note.content,
          subtitle: _date.format(note.createdAt),
        ),
      ],
    );
  }

  Future<AiExecutionResult> _createFinanceRecord(AiParsedIntent intent) async {
    if (intent.amount == null || intent.financeType == null) {
      return const AiExecutionResult(
        responseText:
            "Não consegui identificar o valor. Tente escrever algo como: 'gastei 40 no mercado'.",
        actionType: AiIntentType.createFinanceRecord,
        module: AiModule.finance,
      );
    }

    final description = intent.description ?? 'Movimentacao';
    final category = await _resolveFinanceCategory(
      description,
      intent.financeType!,
    );
    if (intent.financeType == AiFinanceRecordType.income) {
      await _repository.addIncome(
        intent.amount!,
        category?.id,
        description: description,
      );
    } else {
      await _repository.addExpense(
        intent.amount!,
        category?.id,
        description: description,
      );
    }

    return AiExecutionResult(
      responseText: intent.financeType == AiFinanceRecordType.income
          ? '✅ Entrada registrada: ${_money.format(intent.amount)} - $description'
          : '✅ Gasto registrado:\n${_money.format(intent.amount)} - $description.',
      actionType: AiIntentType.createFinanceRecord,
      module: AiModule.finance,
      cards: [
        AiChatCard(
          type: AiCardType.finance,
          title:
              '${intent.financeType == AiFinanceRecordType.income ? 'Entrada' : 'Saida'} • ${_money.format(intent.amount)}',
          subtitle: description,
          details: [
            if (category != null) 'Categoria: ${category.name}',
            'Registrado em ${_date.format(DateTime.now())}',
          ],
          actions: const [
            AiCardAction(
              id: 'nav:/finance',
              label: 'Abrir financas',
              isPrimary: true,
            ),
          ],
        ),
      ],
    );
  }

  Future<AiExecutionResult> _listFinance() async {
    final transactions = await _repository.loadFinanceTransactions();
    final recent = transactions.take(4).toList();
    final income = transactions
        .where((item) => item.type == 'income')
        .fold<double>(0, (sum, item) => sum + item.amount);
    final expense = transactions
        .where((item) => item.type == 'expense')
        .fold<double>(0, (sum, item) => sum + item.amount);

    return AiExecutionResult(
      responseText:
          '💰 Seu saldo atual esta em ${_money.format(income - expense)}.',
      actionType: AiIntentType.listFinance,
      module: AiModule.finance,
      cards: [
        AiChatCard(
          type: AiCardType.summary,
          title: 'Resumo financeiro',
          details: [
            'Entradas: ${_money.format(income)}',
            'Saidas: ${_money.format(expense)}',
            'Saldo: ${_money.format(income - expense)}',
          ],
        ),
        for (final item in recent)
          AiChatCard(
            type: AiCardType.finance,
            title:
                '${item.type == 'income' ? 'Entrada' : 'Saida'} • ${_money.format(item.amount)}',
            subtitle: item.description ?? 'Movimentacao',
            details: ['Data: ${_date.format(item.date)}'],
          ),
      ],
    );
  }

  Future<AiExecutionResult> _listHistory() async {
    final history = await _repository.loadAiHistoryEntries(limit: 8);
    if (history.isEmpty) {
      return const AiExecutionResult(
        responseText: 'Ainda nao tenho acoes registradas no historico da IA.',
        actionType: AiIntentType.listHistory,
        module: AiModule.history,
      );
    }

    return AiExecutionResult(
      responseText: '🧠 Aqui está o histórico recente da IA.',
      actionType: AiIntentType.listHistory,
      module: AiModule.history,
      cards: [
        for (final item in history)
          AiChatCard(
            type: AiCardType.summary,
            title: item.userMessage,
            subtitle: item.aiResponse,
            details: [
              'Acao: ${item.actionType}',
              'Modulo: ${item.module}',
              'Data: ${_date.format(item.createdAt)}',
            ],
          ),
      ],
    );
  }

  AiExecutionResult _help() {
    return const AiExecutionResult(
      responseText:
          '🤖 Comandos disponíveis:\n\n'
          '/rotina - mostra sua rotina de hoje\n'
          '/addrotina descricao data horario - adiciona algo à rotina\n'
          '/treino - mostra seus treinos\n'
          '/iniciartreino nome - inicia um treino\n'
          '/add descricao - adiciona uma tarefa ou anotacao\n'
          '/financas - mostra resumo financeiro\n'
          '/historico - mostra o histórico de ações\n'
          '/help - mostra esta ajuda',
      actionType: AiIntentType.help,
      module: AiModule.assistant,
    );
  }

  AiExecutionResult _askToConfirm(AiParsedIntent intent, String prompt) {
    final confirmation = AiPendingConfirmation(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      prompt: prompt,
      intent: intent,
    );
    return AiExecutionResult(
      responseText: prompt,
      actionType: intent.type,
      module: intent.module,
      pendingConfirmation: confirmation,
      cards: const [
        AiChatCard(
          type: AiCardType.confirmation,
          title: 'Confirmar acao',
          subtitle: 'Essa acao nao pode ser desfeita.',
          actions: [
            AiCardAction(
              id: 'confirm_pending',
              label: 'Confirmar',
              isPrimary: true,
            ),
            AiCardAction(id: 'cancel_pending', label: 'Cancelar'),
          ],
        ),
      ],
    );
  }

  Future<FinanceCategory?> _resolveFinanceCategory(
    String description,
    AiFinanceRecordType type,
  ) async {
    final categories = await _repository.loadFinanceCategories();
    final normalized = _normalize(description);
    final candidates = categories.where(
      (category) =>
          category.nature ==
          (type == AiFinanceRecordType.income ? 'income' : 'expense'),
    );

    for (final category in candidates) {
      if (normalized.contains(_normalize(category.name))) {
        return category;
      }
    }

    final keywordMap = {
      'alimentacao': ['mercado', 'lanche', 'restaurante', 'delivery'],
      'trabalho': ['salario', 'cliente', 'freela', 'pagamento'],
      'assinaturas': ['internet', 'spotify', 'netflix'],
      'transporte': ['gasolina', 'uber', 'onibus'],
    };

    for (final entry in keywordMap.entries) {
      if (!entry.value.any((keyword) => normalized.contains(keyword))) {
        continue;
      }
      return candidates
          .where((category) => _normalize(category.name) == entry.key)
          .firstOrNull;
    }

    return candidates.firstOrNull;
  }

  String _routineTypeFor(String title) {
    final normalized = _normalize(title);
    if (normalized.contains('treino')) {
      return 'Treino';
    }
    if (normalized.contains('estudar') || normalized.contains('estudo')) {
      return 'Estudo';
    }
    if (normalized.contains('trabalho')) {
      return 'Trabalho';
    }
    if (normalized.contains('remedio') || normalized.contains('medico')) {
      return 'Compromisso';
    }
    return 'Tarefa livre';
  }

  int _defaultDurationForTitle(String title) {
    final normalized = _normalize(title);
    if (normalized.contains('treino')) {
      return 60;
    }
    if (normalized.contains('estudar')) {
      return 90;
    }
    return 45;
  }

  DateTime _combineDateAndTime(DateTime date, int timeMinutes) {
    return DateTime(
      date.year,
      date.month,
      date.day,
      timeMinutes ~/ 60,
      timeMinutes % 60,
    );
  }

  DateTime? _combineOptionalDateAndTime(DateTime? date, int? timeMinutes) {
    if (date == null) {
      return null;
    }
    if (timeMinutes == null) {
      return AppDateUtils.startOfDay(date);
    }
    return _combineDateAndTime(date, timeMinutes);
  }

  String _normalize(String value) {
    return value
        .toLowerCase()
        .replaceAll('á', 'a')
        .replaceAll('à', 'a')
        .replaceAll('â', 'a')
        .replaceAll('ã', 'a')
        .replaceAll('é', 'e')
        .replaceAll('ê', 'e')
        .replaceAll('í', 'i')
        .replaceAll('ó', 'o')
        .replaceAll('ô', 'o')
        .replaceAll('õ', 'o')
        .replaceAll('ú', 'u')
        .replaceAll('ç', 'c');
  }
}
