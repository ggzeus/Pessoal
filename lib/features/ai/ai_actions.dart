import 'package:intl/intl.dart';

import '../../core/utils/date_utils.dart';
import '../../data/local/database/app_database.dart';
import '../../data/repositories/personal_repository.dart';
import 'ai_knowledge_base.dart';
import 'ai_models.dart';
import 'services/consumption_service.dart';
import 'services/nutrition_calculator.dart';
import 'services/product_service.dart';
import 'services/routine_service.dart';

class AiActions {
  AiActions(this._repository)
    : _money = NumberFormat.currency(locale: 'pt_BR', symbol: r'R$'),
      _date = DateFormat("dd/MM/yyyy 'as' HH:mm", 'pt_BR'),
      _day = DateFormat('dd/MM/yyyy', 'pt_BR'),
      _calculator = NutritionCalculator() {
    _consumptionService = ConsumptionService(_repository, _calculator);
    _productService = ProductService(_repository);
    _routineService = RoutineService(_repository);
  }

  final PersonalRepository _repository;
  final NumberFormat _money;
  final DateFormat _date;
  final DateFormat _day;
  final NutritionCalculator _calculator;

  late final ConsumptionService _consumptionService;
  late final ProductService _productService;
  late final RoutineService _routineService;

  Future<AiExecutionResult> execute(AiParsedIntent intent) async {
    switch (intent.type) {
      case AiIntentType.createRoutineItem:
        return _createRoutineItem(intent);
      case AiIntentType.updateRoutineItem:
      case AiIntentType.completeRoutineItem:
      case AiIntentType.deleteRoutineItem:
        return const AiExecutionResult(
          responseText:
              'Consigo atualizar itens da rotina pelo modulo da rotina por enquanto.',
          actionType: AiIntentType.unknown,
          module: AiModule.routine,
        );
      case AiIntentType.listRoutine:
        return _listRoutine(intent);
      case AiIntentType.startWorkout:
        return _startWorkout(intent);
      case AiIntentType.finishWorkout:
      case AiIntentType.registerExercise:
        return const AiExecutionResult(
          responseText:
              'Posso te levar ao treino ativo, mas esse ajuste fino ainda esta melhor no modulo de treino.',
          actionType: AiIntentType.unknown,
          module: AiModule.training,
        );
      case AiIntentType.listWorkout:
        return _listWorkout(intent);
      case AiIntentType.createTask:
        return _createTask(intent);
      case AiIntentType.listTasks:
      case AiIntentType.completeTask:
        return _listRoutine(
          intent.copyWith(
            type: AiIntentType.listRoutine,
            module: AiModule.routine,
          ),
        );
      case AiIntentType.createNote:
        return _createNote(intent);
      case AiIntentType.createFinanceRecord:
        return _createFinanceRecord(intent);
      case AiIntentType.createFinanceIncome:
        return _createFinanceRecord(
          intent.copyWith(
            type: AiIntentType.createFinanceRecord,
            financeType: AiFinanceRecordType.income,
            module: AiModule.finance,
          ),
        );
      case AiIntentType.createFinanceExpense:
        return _createFinanceRecord(
          intent.copyWith(
            type: AiIntentType.createFinanceRecord,
            financeType: AiFinanceRecordType.expense,
            module: AiModule.finance,
          ),
        );
      case AiIntentType.listFinance:
      case AiIntentType.showBalance:
        return _listFinance();
      case AiIntentType.listHistory:
      case AiIntentType.listAiHistory:
        return _listHistory();
      case AiIntentType.registerWaterConsumption:
        return _registerWater(intent);
      case AiIntentType.registerFoodConsumption:
        return _registerFood(intent);
      case AiIntentType.registerDrinkConsumption:
        return _registerDrink(intent);
      case AiIntentType.registerProductConsumption:
        return _registerProductConsumption(intent);
      case AiIntentType.createProduct:
        return _beginProductCreation(intent);
      case AiIntentType.updateProduct:
      case AiIntentType.findProduct:
      case AiIntentType.deleteProduct:
      case AiIntentType.addProductNutrition:
        return const AiExecutionResult(
          responseText:
              'Posso seguir com isso pelo fluxo inteligente de produto. Me diga o nome do produto.',
          actionType: AiIntentType.createProduct,
          module: AiModule.products,
        );
      case AiIntentType.listProducts:
        return _listProducts();
      case AiIntentType.showDailyConsumption:
        return _showDailyConsumption(intent);
      case AiIntentType.showWaterIntake:
        return _showWaterIntake(intent);
      case AiIntentType.showNutritionSummary:
        return _showNutritionSummary(intent);
      case AiIntentType.showCaloriesToday:
        return _showCaloriesToday(intent);
      case AiIntentType.showNutrientToday:
        return _showNutrientToday(intent);
      case AiIntentType.listTodayConsumption:
        return _listTodayConsumption(intent);
      case AiIntentType.clearHistory:
        return _askToConfirm(
          intent,
          'Tem certeza que deseja apagar o historico da IA?',
        );
      case AiIntentType.clearRoutine:
        return _askToConfirm(
          intent,
          'Tem certeza que deseja apagar a rotina desse dia?',
        );
      case AiIntentType.savePendingAction:
      case AiIntentType.cancelAction:
      case AiIntentType.editPendingAction:
        return const AiExecutionResult(
          responseText: 'Nao encontrei nenhuma acao pendente para isso.',
          actionType: AiIntentType.unknown,
          module: AiModule.assistant,
        );
      case AiIntentType.help:
      case AiIntentType.explainApp:
      case AiIntentType.explainCommands:
        return _help();
      case AiIntentType.unknown:
        return _handleUnknown(intent);
    }
  }

  Future<AiExecutionResult> executeConfirmed(
    AiPendingConfirmation confirmation,
  ) async {
    switch (confirmation.intent.type) {
      case AiIntentType.clearHistory:
        await _repository.clearAiHistory();
        return const AiExecutionResult(
          responseText: 'Historico da IA apagado com sucesso.',
          actionType: AiIntentType.clearHistory,
          module: AiModule.history,
          clearPendingConfirmation: true,
        );
      case AiIntentType.clearRoutine:
        final date = confirmation.intent.scheduledDate ?? DateTime.now();
        await _repository.clearRoutineForWeekday(date.weekday);
        return const AiExecutionResult(
          responseText: 'Rotina do dia removida com sucesso.',
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

  Future<AiExecutionResult> continuePendingProductDraft(
    AiPendingProductDraft draft,
    String message,
  ) async {
    final parsed = _productService.parseNutritionMessage(message);
    if (parsed == null) {
      return AiExecutionResult(
        responseText:
            'Ainda faltam alguns dados nutricionais para salvar ${draft.name}. '
            'Me envie por porcao: calorias, proteinas, carboidratos, acucares, gorduras totais, gorduras saturadas, gorduras trans, fibras, sodio e sal.',
        actionType: AiIntentType.createProduct,
        module: AiModule.products,
        pendingProductDraft: draft,
      );
    }

    final product = await _productService.createProductFromChat(
      name: draft.name,
      brand: draft.brand,
      category: draft.category,
      draft: parsed,
    );

    return AiExecutionResult(
      responseText: 'Produto cadastrado: ${product.name}.',
      actionType: AiIntentType.createProduct,
      module: AiModule.products,
      clearPendingProductDraft: true,
      cards: [_buildProductCard(product)],
    );
  }

  AiExecutionResult cancelConfirmation() {
    return const AiExecutionResult(
      responseText: 'Perfeito, mantive tudo como estava.',
      actionType: AiIntentType.unknown,
      module: AiModule.assistant,
      clearPendingConfirmation: true,
    );
  }

  AiExecutionResult cancelPendingProductDraft() {
    return const AiExecutionResult(
      responseText: 'Tudo bem, cancelei o cadastro do produto.',
      actionType: AiIntentType.createProduct,
      module: AiModule.products,
      clearPendingProductDraft: true,
    );
  }

  Future<AiExecutionResult> registerProductById({
    required String productId,
    required double quantity,
    required String unit,
  }) async {
    final product = await _repository.loadProductById(productId);
    if (product == null) {
      return const AiExecutionResult(
        responseText: 'Nao encontrei esse produto cadastrado agora.',
        actionType: AiIntentType.registerProductConsumption,
        module: AiModule.products,
      );
    }

    final record = await _consumptionService.registerProductConsumption(
      product: product,
      quantity: quantity,
      unit: unit,
    );
    return _productConsumptionResult(product, record, quantity, unit);
  }

  Future<AiExecutionResult> registerFreeFood({
    required String name,
    required double quantity,
    required String unit,
  }) async {
    final intent = AiParsedIntent(
      type: AiIntentType.registerFoodConsumption,
      module: AiModule.consumption,
      originalMessage: name,
      title: name,
      quantity: quantity,
      unit: unit,
      consumptionType: AiConsumptionType.food,
    );
    return _registerFood(intent);
  }

  Future<AiExecutionResult> beginProductCreationFromName(String name) {
    return _beginProductCreation(
      AiParsedIntent(
        type: AiIntentType.createProduct,
        module: AiModule.products,
        originalMessage: name,
        title: name,
      ),
    );
  }

  Future<AiExecutionResult> deleteProductById(String productId) async {
    final product = await _repository.loadProductById(productId);
    if (product == null) {
      return const AiExecutionResult(
        responseText: 'Esse produto nao esta mais disponivel.',
        actionType: AiIntentType.unknown,
        module: AiModule.products,
      );
    }
    await _repository.deleteProduct(product);
    return AiExecutionResult(
      responseText: 'Produto removido: ${product.name}.',
      actionType: AiIntentType.listProducts,
      module: AiModule.products,
    );
  }

  Future<AiExecutionResult> _createRoutineItem(AiParsedIntent intent) async {
    final title = intent.title ?? 'Novo item na rotina';
    final intervalHours = int.tryParse(intent.metadata['interval_hours'] ?? '');
    final weekdays = _parseWeekdays(intent.metadata['weekdays']);

    if (intent.timeMinutes == null && intervalHours == null) {
      return const AiExecutionResult(
        responseText:
            'Entendi que voce quer adicionar algo a rotina, mas preciso de um horario ou de uma frequencia mais clara.',
        actionType: AiIntentType.createRoutineItem,
        module: AiModule.routine,
      );
    }

    final notify = intent.metadata['notify'] == 'true';
    final startMinutes = intent.timeMinutes ?? (8 * 60);
    final endMinutes = (startMinutes + _defaultDurationForTitle(title)).clamp(
      0,
      24 * 60,
    );
    final routineType = _routineTypeFor(title, weekdays);

    List<RoutineEvent> events;
    if (weekdays.isNotEmpty) {
      events = await _routineService.createRecurringItems(
        RoutineCreationRequest(
          title: title,
          type: routineType,
          startMinutes: startMinutes,
          endMinutes: endMinutes,
          weekdays: weekdays,
          description: intervalHours == null
              ? intent.description
              : 'Repetir a cada $intervalHours horas.',
          notify: notify,
          variable: true,
        ),
      );
    } else {
      final scheduledDate = intent.scheduledDate ?? DateTime.now();
      final item = await _repository.addRoutineEvent(
        title: title,
        type: routineType,
        weekday: scheduledDate.weekday,
        startMinutes: startMinutes,
        endMinutes: endMinutes,
        description: intervalHours == null
            ? intent.description
            : 'Repetir a cada $intervalHours horas.',
        notify: notify,
        variable: true,
      );
      events = [item];
    }

    final recurrenceLabel = _routineRecurrenceLabel(intent, weekdays);
    final primaryEvent = events.first;
    return AiExecutionResult(
      responseText: 'Adicionado a sua rotina: $title $recurrenceLabel.',
      actionType: AiIntentType.createRoutineItem,
      module: AiModule.routine,
      cards: [
        AiChatCard(
          type: AiCardType.routine,
          title: primaryEvent.title,
          subtitle: recurrenceLabel,
          status: 'Planejado',
          details: [
            'Tipo: $routineType',
            'Horario: ${AppDateUtils.clockFromMinutes(primaryEvent.startMinutes)} - ${AppDateUtils.clockFromMinutes(primaryEvent.endMinutes)}',
            if (intervalHours != null)
              'Frequencia: a cada $intervalHours horas',
          ],
          metadata: {
            'eventId': primaryEvent.id,
            'scheduledDate': AppDateUtils.startOfDay(
              intent.scheduledDate ?? DateTime.now(),
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
      return const AiExecutionResult(
        responseText:
            'Hoje esta mais leve por aqui. Posso adicionar algo a sua rotina se voce quiser.',
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
          details: ['Categoria: ${event.type}', 'Dia: ${_day.format(date)}'],
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
          'Aqui esta sua rotina de ${DateFormat('dd/MM').format(date)}.',
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
      responseText: 'Treino iniciado. Bora manter o foco.',
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
      responseText: 'Separei alguns treinos para voce escolher.',
      actionType: AiIntentType.listWorkout,
      module: AiModule.training,
      cards: [
        for (final workout in workouts.take(4))
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
      responseText: 'Registrado com sucesso.',
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
      responseText: 'Anotacao salva com sucesso.',
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
            "Nao consegui identificar o valor. Tente escrever algo como: 'gastei 40 no mercado'.",
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
          ? 'Entrada registrada: ${_money.format(intent.amount)} - $description'
          : 'Gasto registrado: ${_money.format(intent.amount)} - $description',
      actionType: AiIntentType.createFinanceRecord,
      module: AiModule.finance,
      cards: [
        AiChatCard(
          type: AiCardType.finance,
          title:
              '${intent.financeType == AiFinanceRecordType.income ? 'Entrada' : 'Saida'} - ${_money.format(intent.amount)}',
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
          'Seu saldo atual esta em ${_money.format(income - expense)}.',
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
                '${item.type == 'income' ? 'Entrada' : 'Saida'} - ${_money.format(item.amount)}',
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
      responseText: 'Aqui esta o historico recente da IA.',
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

  Future<AiExecutionResult> _registerWater(AiParsedIntent intent) async {
    final quantity = (intent.quantity ?? 250).round();
    final record = await _consumptionService.registerWater(quantity);
    final summary = await _consumptionService.loadSummaryForDate(
      record.createdAt,
    );

    return AiExecutionResult(
      responseText: 'Consumo registrado: ${quantity}ml de agua.',
      actionType: AiIntentType.registerWaterConsumption,
      module: AiModule.hydration,
      cards: [
        AiChatCard(
          type: AiCardType.water,
          title: '${quantity}ml de agua',
          subtitle:
              'Registrado em ${DateFormat('HH:mm').format(record.createdAt)}',
          details: ['Total do dia: ${summary.waterMl}ml'],
          actions: const [
            AiCardAction(
              id: 'nav:/nutrition',
              label: 'Abrir consumo',
              isPrimary: true,
            ),
          ],
        ),
      ],
    );
  }

  Future<AiExecutionResult> _registerFood(AiParsedIntent intent) async {
    final name = intent.title ?? 'Alimento';
    final quantity = intent.quantity ?? 1;
    final unit = intent.unit ?? 'unidade';
    final record = await _consumptionService.registerFood(
      name: name,
      quantity: quantity,
      unit: unit,
    );

    return AiExecutionResult(
      responseText:
          'Consumo registrado: ${_formatQuantity(quantity, unit)} de ${record.name.toLowerCase()}.',
      actionType: AiIntentType.registerFoodConsumption,
      module: AiModule.consumption,
      cards: [_buildConsumptionCard(record)],
    );
  }

  Future<AiExecutionResult> _registerDrink(AiParsedIntent intent) async {
    final name = intent.title ?? 'Bebida';
    final quantity = intent.quantity ?? 1;
    final unit = intent.unit ?? 'porcao';
    final record = await _consumptionService.registerDrink(
      name: name,
      quantity: quantity,
      unit: unit,
    );

    return AiExecutionResult(
      responseText:
          'Consumo registrado: ${_formatQuantity(quantity, unit)} de ${record.name.toLowerCase()}.',
      actionType: AiIntentType.registerDrinkConsumption,
      module: AiModule.consumption,
      cards: [_buildConsumptionCard(record)],
    );
  }

  Future<AiExecutionResult> _registerProductConsumption(
    AiParsedIntent intent,
  ) async {
    final name = intent.title;
    if (name == null || name.trim().isEmpty || name == 'Consumo') {
      return const AiExecutionResult(
        responseText:
            'Entendi que voce quer registrar um produto, mas preciso do nome dele.',
        actionType: AiIntentType.registerProductConsumption,
        module: AiModule.products,
      );
    }

    final quantity = intent.quantity ?? 1;
    final unit = intent.unit ?? 'porcao';
    final matches = await _productService.searchProducts(name);

    if (matches.isEmpty) {
      // Nenhum produto encontrado — registrar como alimento livre
      return _registerFood(
        intent.copyWith(
          type: AiIntentType.registerFoodConsumption,
          consumptionType: AiConsumptionType.food,
        ),
      );
    }

    if (matches.length == 1) {
      final record = await _consumptionService.registerProductConsumption(
        product: matches.first,
        quantity: quantity,
        unit: unit,
      );
      return _productConsumptionResult(matches.first, record, quantity, unit);
    }

    return AiExecutionResult(
      responseText:
          'Encontrei mais de um produto parecido. Qual deles voce consumiu?',
      actionType: AiIntentType.registerProductConsumption,
      module: AiModule.products,
      cards: [
        for (final product in matches.take(5))
          _buildProductCard(
            product,
            metadata: {'quantity': quantity.toString(), 'unit': unit},
            actions: const [
              AiCardAction(
                id: 'consume_matched_product',
                label: 'Consumir',
                isPrimary: true,
              ),
              AiCardAction(id: 'nav:/products', label: 'Abrir produtos'),
            ],
          ),
      ],
    );
  }

  Future<AiExecutionResult> _beginProductCreation(AiParsedIntent intent) async {
    final productName = intent.title?.trim();
    if (productName == null ||
        productName.isEmpty ||
        productName == 'Novo produto') {
      return const AiExecutionResult(
        responseText: 'Posso cadastrar um produto, mas preciso do nome dele.',
        actionType: AiIntentType.createProduct,
        module: AiModule.products,
      );
    }

    return AiExecutionResult(
      responseText:
          'Vamos cadastrar $productName. Me informe os dados nutricionais por porcao: calorias, proteinas, carboidratos, acucares, gorduras totais, gorduras saturadas, gorduras trans, fibras, sodio e sal.',
      actionType: AiIntentType.createProduct,
      module: AiModule.products,
      pendingProductDraft: AiPendingProductDraft(name: productName),
      cards: const [
        AiChatCard(
          type: AiCardType.product,
          title: 'Dados obrigatorios',
          details: [
            'Nome do produto',
            'Porcao de referencia',
            'Calorias, proteinas, carboidratos, acucares',
            'Gorduras totais, saturadas, trans, fibras, sodio e sal',
          ],
          actions: [
            AiCardAction(id: 'nav:/products', label: 'Abrir formulario'),
          ],
        ),
      ],
    );
  }

  Future<AiExecutionResult> _listProducts() async {
    final products = await _productService.listProducts();
    if (products.isEmpty) {
      return const AiExecutionResult(
        responseText:
            'Ainda nao encontrei produtos cadastrados. Posso cadastrar um novo pelo chat ou pelo formulario.',
        actionType: AiIntentType.listProducts,
        module: AiModule.products,
      );
    }

    return AiExecutionResult(
      responseText: 'Aqui estao seus produtos cadastrados.',
      actionType: AiIntentType.listProducts,
      module: AiModule.products,
      cards: [
        for (final product in products.take(6))
          _buildProductCard(
            product,
            actions: const [
              AiCardAction(
                id: 'consume_matched_product',
                label: 'Consumir',
                isPrimary: true,
              ),
              AiCardAction(id: 'nav:/products', label: 'Editar'),
              AiCardAction(
                id: 'delete_product',
                label: 'Excluir',
                isDestructive: true,
              ),
            ],
          ),
      ],
    );
  }

  Future<AiExecutionResult> _showDailyConsumption(AiParsedIntent intent) async {
    final date = intent.scheduledDate ?? DateTime.now();
    final summary = await _consumptionService.loadSummaryForDate(date);

    if (summary.records.isEmpty && summary.waterMl == 0) {
      return const AiExecutionResult(
        responseText: 'Ainda nao encontrei consumo registrado hoje.',
        actionType: AiIntentType.showDailyConsumption,
        module: AiModule.consumption,
      );
    }

    final details = <String>[
      'Agua: ${summary.waterMl}ml',
      'Calorias: ${_formatMetric(summary.totals.calories, suffix: 'kcal')}',
      'Proteinas: ${_formatMetric(summary.totals.protein, suffix: 'g')}',
      'Carboidratos: ${_formatMetric(summary.totals.carbohydrates, suffix: 'g')}',
      'Acucares: ${_formatMetric(summary.totals.sugars, suffix: 'g')}',
      'Gorduras totais: ${_formatMetric(summary.totals.totalFat, suffix: 'g')}',
      'Sodio: ${_formatMetric(summary.totals.sodium, suffix: 'mg')}',
      'Sal: ${_formatMetric(summary.totals.salt, suffix: 'g')}',
    ];

    return AiExecutionResult(
      responseText: 'Resumo de consumo de hoje pronto.',
      actionType: AiIntentType.showDailyConsumption,
      module: AiModule.consumption,
      cards: [
        AiChatCard(
          type: AiCardType.summary,
          title: 'Consumo de hoje',
          details: details,
          actions: const [
            AiCardAction(id: 'nav:/nutrition', label: 'Abrir consumo'),
          ],
        ),
        for (final record in summary.records.take(6))
          _buildConsumptionCard(record),
      ],
    );
  }

  Future<AiExecutionResult> _showWaterIntake(AiParsedIntent intent) async {
    final date = intent.scheduledDate ?? DateTime.now();
    final summary = await _consumptionService.loadSummaryForDate(date);
    return AiExecutionResult(
      responseText: 'Hoje voce bebeu ${summary.waterMl}ml de agua.',
      actionType: AiIntentType.showWaterIntake,
      module: AiModule.hydration,
      cards: [
        AiChatCard(
          type: AiCardType.water,
          title: 'Agua de hoje',
          subtitle: '${summary.waterMl}ml',
          details: const [
            'Meta visual: acompanhe sua hidratacao ao longo do dia.',
          ],
          actions: const [
            AiCardAction(
              id: 'nav:/nutrition',
              label: 'Abrir hidratacao',
              isPrimary: true,
            ),
          ],
        ),
      ],
    );
  }

  Future<AiExecutionResult> _showNutritionSummary(AiParsedIntent intent) async {
    final date = intent.scheduledDate ?? DateTime.now();
    final summary = await _consumptionService.loadSummaryForDate(date);

    if (summary.records.isEmpty && summary.waterMl == 0) {
      return const AiExecutionResult(
        responseText: 'Ainda nao encontrei consumo registrado hoje.',
        actionType: AiIntentType.showNutritionSummary,
        module: AiModule.consumption,
      );
    }

    // Montar lista de itens consumidos
    final itemLines = summary.records
        .where((r) => r.type != 'water')
        .map((r) {
          final qty = _formatQuantity(r.quantity, r.unit);
          final kcal = r.calories > 0
              ? ' — ${_formatMetric(r.calories, suffix: 'kcal')}'
              : '';
          return '• $qty de ${r.name}$kcal';
        })
        .join('\n');

    final responseText = [
      '\u{1F4CA} Resumo nutricional de hoje:',
      '',
      '\u{1F525} Calorias: ${_formatMetric(summary.totals.calories, suffix: 'kcal')}',
      '\u{1F969} Proteinas: ${_formatMetric(summary.totals.protein, suffix: 'g')}',
      '\u{1F35E} Carboidratos: ${_formatMetric(summary.totals.carbohydrates, suffix: 'g')}',
      '\u{1F36C} Acucares: ${_formatMetric(summary.totals.sugars, suffix: 'g')}',
      '\u{1F951} Gorduras totais: ${_formatMetric(summary.totals.totalFat, suffix: 'g')}',
      '\u{1F9C2} Sodio: ${_formatMetric(summary.totals.sodium, suffix: 'mg')}',
      '\u{1F9C2} Sal: ${_formatMetric(summary.totals.salt, suffix: 'g')}',
      if (summary.waterMl > 0)
        '\u{1F4A7} Agua: ${summary.waterMl}ml',
      if (itemLines.isNotEmpty) ...['\n\nItens consumidos:', itemLines],
    ].join('\n');

    return AiExecutionResult(
      responseText: responseText,
      actionType: AiIntentType.showNutritionSummary,
      module: AiModule.consumption,
      cards: [
        AiChatCard(
          type: AiCardType.summary,
          title: 'Resumo nutricional',
          details: [
            'Calorias: ${_formatMetric(summary.totals.calories, suffix: 'kcal')}',
            'Proteinas: ${_formatMetric(summary.totals.protein, suffix: 'g')}',
            'Carboidratos: ${_formatMetric(summary.totals.carbohydrates, suffix: 'g')}',
            'Acucares: ${_formatMetric(summary.totals.sugars, suffix: 'g')}',
            'Gorduras totais: ${_formatMetric(summary.totals.totalFat, suffix: 'g')}',
            'Gorduras saturadas: ${_formatMetric(summary.totals.saturatedFat, suffix: 'g')}',
            'Fibras: ${_formatMetric(summary.totals.fiber, suffix: 'g')}',
            'Sodio: ${_formatMetric(summary.totals.sodium, suffix: 'mg')}',
            'Sal: ${_formatMetric(summary.totals.salt, suffix: 'g')}',
          ],
          actions: const [
            AiCardAction(id: 'nav:/nutrition', label: 'Abrir consumo'),
          ],
        ),
      ],
    );
  }

  Future<AiExecutionResult> _showCaloriesToday(AiParsedIntent intent) async {
    final date = intent.scheduledDate ?? DateTime.now();
    final summary = await _consumptionService.loadSummaryForDate(date);

    final hasUnknown = summary.records.any(
      (r) => r.type != 'water' && r.calories == 0,
    );

    if (summary.records.isEmpty) {
      return const AiExecutionResult(
        responseText: 'Ainda nao ha consumo registrado hoje.',
        actionType: AiIntentType.showCaloriesToday,
        module: AiModule.consumption,
      );
    }

    final kcal = summary.totals.calories;
    var text =
        '\u{1F525} Hoje voce consumiu aproximadamente ${_formatMetric(kcal, suffix: 'kcal')} registradas.';
    if (hasUnknown) {
      text +=
          '\n\nObservacao: alguns itens nao possuem dados nutricionais cadastrados, entao o total pode estar incompleto.';
    }

    return AiExecutionResult(
      responseText: text,
      actionType: AiIntentType.showCaloriesToday,
      module: AiModule.consumption,
    );
  }

  Future<AiExecutionResult> _showNutrientToday(AiParsedIntent intent) async {
    final date = intent.scheduledDate ?? DateTime.now();
    final summary = await _consumptionService.loadSummaryForDate(date);
    final nutrient = intent.entities['nutrient']?.toString() ?? 'calories';

    double value;
    String label;
    String suffix;
    String emoji;

    switch (nutrient) {
      case 'sugars':
        value = summary.totals.sugars;
        label = 'acucar';
        suffix = 'g';
        emoji = '\u{1F36C}';
        break;
      case 'protein':
        value = summary.totals.protein;
        label = 'proteina';
        suffix = 'g';
        emoji = '\u{1F969}';
        break;
      case 'carbohydrates':
        value = summary.totals.carbohydrates;
        label = 'carboidratos';
        suffix = 'g';
        emoji = '\u{1F35E}';
        break;
      case 'totalFat':
        value = summary.totals.totalFat;
        label = 'gorduras totais';
        suffix = 'g';
        emoji = '\u{1F951}';
        break;
      case 'sodium':
        value = summary.totals.sodium;
        label = 'sodio';
        suffix = 'mg';
        emoji = '\u{1F9C2}';
        break;
      case 'salt':
        value = summary.totals.salt;
        label = 'sal';
        suffix = 'g';
        emoji = '\u{1F9C2}';
        break;
      case 'fiber':
        value = summary.totals.fiber;
        label = 'fibra';
        suffix = 'g';
        emoji = '\u{1F33F}';
        break;
      default:
        value = summary.totals.calories;
        label = 'calorias';
        suffix = 'kcal';
        emoji = '\u{1F525}';
    }

    return AiExecutionResult(
      responseText:
          '$emoji Hoje voce consumiu aproximadamente ${_formatMetric(value, suffix: suffix)} de $label registrados.',
      actionType: AiIntentType.showNutrientToday,
      module: AiModule.consumption,
    );
  }

  Future<AiExecutionResult> _listTodayConsumption(AiParsedIntent intent) async {
    final date = intent.scheduledDate ?? DateTime.now();
    final summary = await _consumptionService.loadSummaryForDate(date);

    if (summary.records.isEmpty && summary.waterMl == 0) {
      return const AiExecutionResult(
        responseText: 'Ainda nao ha consumo registrado hoje.',
        actionType: AiIntentType.listTodayConsumption,
        module: AiModule.consumption,
      );
    }

    final lines = <String>[];
    for (final r in summary.records.where((r) => r.type != 'water')) {
      final qty = _formatQuantity(r.quantity, r.unit);
      final kcal = r.calories > 0
          ? ' (${_formatMetric(r.calories, suffix: 'kcal')})'
          : '';
      lines.add('\u{1F374} $qty de ${r.name}$kcal');
    }
    if (summary.waterMl > 0) {
      lines.add('\u{1F4A7} ${summary.waterMl}ml de agua');
    }

    return AiExecutionResult(
      responseText:
          'Hoje voce consumiu:\n\n${lines.join('\n')}',
      actionType: AiIntentType.listTodayConsumption,
      module: AiModule.consumption,
      cards: [
        for (final record in summary.records.take(8))
          _buildConsumptionCard(record),
      ],
    );
  }

  AiExecutionResult _help() {
    return AiExecutionResult(
      responseText:
          '${AppKnowledgeBase.overviewText()}\n\n'
          'Comandos disponiveis:\n\n'
          'Rotina:\n'
          '/rotina - mostra sua rotina de hoje\n'
          '/addrotina descricao data horario - adiciona algo a rotina\n\n'
          'Treino:\n'
          '/treino - mostra seus treinos\n'
          '/iniciartreino nome - inicia um treino\n\n'
          'Financas:\n'
          '/financas - mostra resumo financeiro\n'
          '/historico - mostra historico da IA\n\n'
          'Consumo:\n'
          '/consumo - mostra o consumo do dia\n'
          '/agua - mostra agua consumida hoje\n'
          '/addagua quantidade - registra agua\n'
          '/consumir produto quantidade - registra consumo de produto\n'
          '/nutricao - mostra resumo nutricional\n\n'
          'Produtos:\n'
          '/produtos - lista produtos cadastrados\n'
          '/addproduto nome - cadastra um produto',
      actionType: AiIntentType.help,
      module: AiModule.assistant,
      cards: [
        AiChatCard(
          type: AiCardType.summary,
          title: 'Modulos que eu conheco',
          details: AppKnowledgeBase.modules.values
              .map((module) => '${module.name}: ${module.description}')
              .toList(),
        ),
      ],
    );
  }

  AiExecutionResult _handleUnknown(AiParsedIntent intent) {
    if (intent.metadata['ambiguous'] == 'product_or_create') {
      final name = intent.title ?? 'Produto';
      final quantity = intent.quantity ?? 1;
      final unit = intent.unit ?? 'porcao';
      return AiExecutionResult(
        responseText:
            'Voce quer registrar consumo de ${_formatQuantity(quantity, unit)} de $name ou cadastrar um novo produto chamado $name?',
        actionType: AiIntentType.unknown,
        module: AiModule.products,
        cards: [
          AiChatCard(
            type: AiCardType.confirmation,
            title: name,
            subtitle: 'Escolha a acao',
            metadata: {
              'productName': name,
              'quantity': quantity.toString(),
              'unit': unit,
            },
            actions: const [
              AiCardAction(
                id: 'register_ambiguous_product',
                label: 'Registrar consumo',
                isPrimary: true,
              ),
              AiCardAction(
                id: 'create_ambiguous_product',
                label: 'Cadastrar produto',
              ),
              AiCardAction(id: 'cancel_pending', label: 'Cancelar'),
            ],
          ),
        ],
      );
    }

    return const AiExecutionResult(
      responseText:
          'Nao consegui entender totalmente. Posso te ajudar com rotina, treino, financas, consumo, produtos ou historico. Tente algo como: "bebi 250ml de agua", "iniciar treino de peito" ou "gastei 35 no mercado".',
      actionType: AiIntentType.unknown,
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

  AiExecutionResult _productConsumptionResult(
    Product product,
    ConsumptionRecord record,
    double quantity,
    String unit,
  ) {
    final impactLines = <String>[];
    if (record.calories > 0) {
      impactLines.add('\u{1F525} ${_formatMetric(record.calories, suffix: 'kcal')}');
    }
    if (record.protein > 0) {
      impactLines.add(
          '\u{1F969} ${_formatMetric(record.protein, suffix: 'g')} de proteinas');
    }
    if (record.sugars > 0) {
      impactLines.add(
          '\u{1F36C} ${_formatMetric(record.sugars, suffix: 'g')} de acucar');
    }
    if (record.carbohydrates > 0 && record.sugars == 0) {
      impactLines.add(
          '\u{1F35E} ${_formatMetric(record.carbohydrates, suffix: 'g')} de carboidratos');
    }
    if (record.totalFat > 0) {
      impactLines.add(
          '\u{1F951} ${_formatMetric(record.totalFat, suffix: 'g')} de gordura');
    }

    final baseText =
        '\u2705 Consumo registrado: ${_formatQuantity(quantity, unit)} de ${product.name}.';
    final responseText = impactLines.isEmpty
        ? baseText
        : '$baseText\n\nIsso adicionou ao seu dia:\n${impactLines.join('\n')}';

    return AiExecutionResult(
      responseText: responseText,
      actionType: AiIntentType.registerProductConsumption,
      module: AiModule.consumption,
      cards: [_buildConsumptionCard(record)],
    );
  }

  AiChatCard _buildConsumptionCard(ConsumptionRecord record) {
    final detailLines = <String>[
      'Tipo: ${_consumptionTypeLabel(record.type)}',
      'Horario: ${DateFormat('HH:mm').format(record.createdAt)}',
      if (record.calories > 0)
        'Calorias: ${_formatMetric(record.calories, suffix: 'kcal')}',
      if (record.protein > 0)
        'Proteinas: ${_formatMetric(record.protein, suffix: 'g')}',
      if (record.carbohydrates > 0)
        'Carboidratos: ${_formatMetric(record.carbohydrates, suffix: 'g')}',
      if (record.sugars > 0)
        'Acucares: ${_formatMetric(record.sugars, suffix: 'g')}',
      if (record.totalFat > 0)
        'Gorduras totais: ${_formatMetric(record.totalFat, suffix: 'g')}',
      if (record.sodium > 0)
        'Sodio: ${_formatMetric(record.sodium, suffix: 'mg')}',
      if (record.salt > 0) 'Sal: ${_formatMetric(record.salt, suffix: 'g')}',
    ];

    return AiChatCard(
      type: record.type == 'water' ? AiCardType.water : AiCardType.consumption,
      title:
          '${_formatQuantity(record.quantity, record.unit)} - ${record.name}',
      subtitle: _consumptionTypeLabel(record.type),
      details: detailLines,
      metadata: {if (record.productId != null) 'productId': record.productId!},
    );
  }

  AiChatCard _buildProductCard(
    Product product, {
    Map<String, String> metadata = const {},
    List<AiCardAction>? actions,
  }) {
    return AiChatCard(
      type: AiCardType.product,
      title: product.name,
      subtitle: product.brand == null || product.brand!.isEmpty
          ? product.category ?? 'Produto'
          : '${product.brand} - ${product.category ?? 'Produto'}',
      details: [
        'Porcao: ${_formatMetric(product.servingSize, suffix: product.servingUnit)}',
        'Calorias: ${_formatMetric(product.calories, suffix: 'kcal')}',
        'Proteinas: ${_formatMetric(product.protein, suffix: 'g')}',
        'Carboidratos: ${_formatMetric(product.carbohydrates, suffix: 'g')}',
        'Acucares: ${_formatMetric(product.sugars, suffix: 'g')}',
        'Gorduras totais: ${_formatMetric(product.totalFat, suffix: 'g')}',
        'Sodio: ${_formatMetric(product.sodium, suffix: 'mg')}',
      ],
      metadata: {
        'productId': product.id,
        'quantity': metadata['quantity'] ?? '1',
        'unit': metadata['unit'] ?? 'porcao',
      },
      actions:
          actions ??
          const [
            AiCardAction(
              id: 'consume_matched_product',
              label: 'Consumir',
              isPrimary: true,
            ),
            AiCardAction(id: 'nav:/products', label: 'Editar'),
          ],
    );
  }

  String _routineTypeFor(String title, List<int> weekdays) {
    final normalized = _normalize(title);
    if (normalized.contains('treino')) {
      return 'Treino';
    }
    if (normalized.contains('agua') ||
        normalized.contains('acordar') ||
        normalized.contains('dormir') ||
        weekdays.length > 1) {
      return 'Habito';
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
    if (normalized.contains('dormir') || normalized.contains('acordar')) {
      return 15;
    }
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

  List<int> _parseWeekdays(String? raw) {
    if (raw == null || raw.trim().isEmpty) {
      return const [];
    }
    return raw.split(',').map(int.tryParse).whereType<int>().toSet().toList()
      ..sort();
  }

  String _routineRecurrenceLabel(AiParsedIntent intent, List<int> weekdays) {
    final timeLabel = intent.timeMinutes == null
        ? ''
        : ' as ${AppDateUtils.clockFromMinutes(intent.timeMinutes!)}';
    final recurrence = intent.metadata['recurrence'];
    if (recurrence == 'daily' || weekdays.length == 7) {
      return 'todos os dias$timeLabel';
    }
    if (weekdays.isNotEmpty) {
      return 'em ${_weekdayLabel(weekdays)}$timeLabel';
    }
    if (intent.scheduledDate != null) {
      final date = intent.timeMinutes == null
          ? intent.scheduledDate!
          : _combineDateAndTime(intent.scheduledDate!, intent.timeMinutes!);
      return 'em ${_date.format(date)}';
    }
    if (timeLabel.isNotEmpty) {
      return timeLabel.trimLeft();
    }
    return 'na rotina';
  }

  String _weekdayLabel(List<int> weekdays) {
    const names = {
      DateTime.monday: 'segunda',
      DateTime.tuesday: 'terca',
      DateTime.wednesday: 'quarta',
      DateTime.thursday: 'quinta',
      DateTime.friday: 'sexta',
      DateTime.saturday: 'sabado',
      DateTime.sunday: 'domingo',
    };
    return weekdays
        .map((day) => names[day] ?? '')
        .where((day) => day.isNotEmpty)
        .join(', ');
  }

  String _consumptionTypeLabel(String type) {
    switch (type) {
      case 'water':
        return 'Agua';
      case 'food':
        return 'Alimento';
      case 'drink':
        return 'Bebida';
      case 'product':
        return 'Produto';
      default:
        return 'Consumo';
    }
  }

  String _formatQuantity(double quantity, String unit) {
    final value = quantity % 1 == 0
        ? quantity.toInt().toString()
        : quantity.toStringAsFixed(1);
    // Unidades textuais precisam de espaço (ex: "2 unidades", "1 porção")
    // Unidades métricas ficam junto (ex: "250ml", "100g")
    final textUnits = ['unidade', 'porcao', 'porcoes', 'porcão', 'porcões',
        'scoop', 'scoops', 'ovo', 'ovos'];
    final isTextUnit = textUnits.any((u) => unit.toLowerCase().startsWith(u));
    if (isTextUnit) {
      // Pluralizar se necessário
      final qty = quantity.toInt();
      String plural = unit.toLowerCase();
      if (qty != 1) {
        if (plural == 'unidade') {
          plural = 'unidades';
        } else if (plural == 'porcao') {
          plural = 'porcoes';
        } else if (plural == 'scoop') {
          plural = 'scoops';
        } else if (plural == 'ovo') {
          plural = 'ovos';
        }
      }
      return '$value $plural';
    }
    return '$value$unit';
  }

  String _formatMetric(double value, {required String suffix}) {
    final token = value % 1 == 0
        ? value.toInt().toString()
        : value.toStringAsFixed(1);
    return '$token $suffix';
  }

  String _normalize(String value) {
    return value
        .toLowerCase()
        .replaceAll('a', 'a')
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
