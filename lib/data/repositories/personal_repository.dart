import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../core/utils/date_utils.dart';
import '../local/database/app_database.dart';
import '../local/seed/seed_service.dart';
import 'dashboard_snapshot.dart';

class PersonalRepository {
  PersonalRepository(this._db, this._seedService);

  final AppDatabase _db;
  final SeedService _seedService;
  final _uuid = const Uuid();

  Future<void> ensureReady() => _seedService.ensureSeeded();

  Future<DashboardSnapshot> loadDashboard() async {
    await ensureReady();
    final now = DateTime.now();
    final todayStart = AppDateUtils.startOfDay(now);
    final todayEnd = AppDateUtils.endOfDay(now);
    final monthStart = AppDateUtils.startOfMonth(now);
    final nextMonth = AppDateUtils.startOfNextMonth(now);

    final missions =
        await (_db.select(_db.dailyMissions)
              ..where((m) => m.date.isBetweenValues(todayStart, todayEnd))
              ..orderBy([(m) => OrderingTerm.desc(m.createdAt)])
              ..limit(1))
            .get();
    final mission = missions.firstOrNull;

    final allEvents =
        await (_db.select(_db.routineEvents)
              ..where((r) => r.weekday.equals(now.weekday))
              ..orderBy([(r) => OrderingTerm.asc(r.startMinutes)]))
            .get();
    final currentMinute = now.hour * 60 + now.minute;
    final nextEvent =
        allEvents
            .where((event) => event.startMinutes >= currentMinute)
            .firstOrNull ??
        allEvents.firstOrNull;

    final tasks =
        await (_db.select(_db.tasks)
              ..where((t) => t.status.equals('open'))
              ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])
              ..limit(5))
            .get();

    final xp = await _db.select(_db.xpLogs).get();
    final totalXp = xp.fold<int>(0, (total, log) => total + log.amount);
    final level = (totalXp ~/ 500) + 1;
    final levelProgress = (totalXp % 500) / 500;

    final waterLogs = await (_db.select(
      _db.waterLogs,
    )..where((w) => w.loggedAt.isBetweenValues(todayStart, todayEnd))).get();
    final waterMl = waterLogs.fold<int>(
      0,
      (total, log) => total + log.amountMl,
    );

    final transactions =
        await (_db.select(_db.financeTransactions)..where(
              (f) =>
                  f.date.isBiggerOrEqualValue(monthStart) &
                  f.date.isSmallerThanValue(nextMonth),
            ))
            .get();
    final income = transactions
        .where((item) => item.type == 'income')
        .fold<double>(0, (total, item) => total + item.amount);
    final expense = transactions
        .where((item) => item.type == 'expense')
        .fold<double>(0, (total, item) => total + item.amount);

    final fixed = await (_db.select(
      _db.fixedExpenses,
    )..where((f) => f.active.equals(true))).get();
    final fixedTotal = fixed.fold<double>(
      0,
      (total, item) => total + item.amount,
    );

    final workouts =
        await (_db.select(_db.workouts)
              ..where((w) => w.status.equals('template'))
              ..limit(1))
            .get();

    final studies =
        await (_db.select(_db.studyUnits)
              ..orderBy([
                (s) => OrderingTerm.asc(s.mastery),
                (s) => OrderingTerm.desc(s.estimatedMinutes),
              ])
              ..limit(1))
            .get();

    final projects =
        await (_db.select(_db.projects)
              ..orderBy([(p) => OrderingTerm.desc(p.updatedAt)])
              ..limit(3))
            .get();

    final habits =
        await (_db.select(_db.habits)
              ..orderBy([(h) => OrderingTerm.asc(h.createdAt)])
              ..limit(5))
            .get();

    return DashboardSnapshot(
      mission: mission,
      nextRoutineEvent: nextEvent,
      openTasks: tasks,
      totalXp: totalXp,
      level: level,
      levelProgress: levelProgress,
      waterMl: waterMl,
      monthIncome: income,
      monthExpense: expense,
      fixedExpenseTotal: fixedTotal,
      pendingWorkout: workouts.firstOrNull,
      studySuggestion: studies.firstOrNull,
      projects: projects,
      habits: habits,
    );
  }

  Future<List<RoutineEvent>> loadRoutineForWeekday(int weekday) async {
    await ensureReady();
    return (_db.select(_db.routineEvents)
          ..where((r) => r.weekday.equals(weekday))
          ..orderBy([(r) => OrderingTerm.asc(r.startMinutes)]))
        .get();
  }

  Future<RoutineEvent?> loadRoutineEventById(String id) async {
    await ensureReady();
    return (_db.select(
      _db.routineEvents,
    )..where((event) => event.id.equals(id))).getSingleOrNull();
  }

  Future<List<RoutineEventLog>> loadRoutineLogsForDate(DateTime date) async {
    await ensureReady();
    final start = AppDateUtils.startOfDay(date);
    final end = AppDateUtils.endOfDay(date);
    return (_db.select(_db.routineEventLogs)
          ..where((log) => log.date.isBetweenValues(start, end))
          ..orderBy([(log) => OrderingTerm.desc(log.createdAt)]))
        .get();
  }

  Future<List<FinanceCategory>> loadFinanceCategories() async {
    await ensureReady();
    return (_db.select(
      _db.financeCategories,
    )..orderBy([(c) => OrderingTerm.asc(c.name)])).get();
  }

  Future<List<FixedExpense>> loadFixedExpenses() async {
    await ensureReady();
    return (_db.select(
      _db.fixedExpenses,
    )..orderBy([(f) => OrderingTerm.asc(f.dueDay)])).get();
  }

  Future<List<Food>> loadFoods() async {
    await ensureReady();
    return (_db.select(
      _db.foods,
    )..orderBy([(f) => OrderingTerm.asc(f.name)])).get();
  }

  Future<List<Product>> loadProducts() async {
    await ensureReady();
    return (_db.select(_db.products)
          ..orderBy([
            (product) => OrderingTerm.asc(product.name),
            (product) => OrderingTerm.asc(product.brand),
          ]))
        .get();
  }

  Future<Product?> loadProductById(String id) async {
    await ensureReady();
    return (_db.select(
      _db.products,
    )..where((product) => product.id.equals(id))).getSingleOrNull();
  }

  Future<List<Product>> findProductsByQuery(String query) async {
    await ensureReady();
    final normalized = query.trim().toLowerCase();
    if (normalized.isEmpty) {
      return const [];
    }

    final products = await loadProducts();
    return products.where((product) {
      final haystack = '${product.name} ${product.brand ?? ''} ${product.category ?? ''}'
          .toLowerCase();
      return haystack.contains(normalized);
    }).toList();
  }

  Future<List<StudyUnit>> loadStudyUnits() async {
    await ensureReady();
    return (_db.select(_db.studyUnits)..limit(30)).get();
  }

  Future<List<Exercise>> loadExercises() async {
    await ensureReady();
    return (_db.select(_db.exercises)..orderBy([
          (e) => OrderingTerm.asc(e.category),
          (e) => OrderingTerm.asc(e.name),
        ]))
        .get();
  }

  Future<List<Project>> loadProjects() async {
    await ensureReady();
    return (_db.select(
      _db.projects,
    )..orderBy([(p) => OrderingTerm.desc(p.updatedAt)])).get();
  }

  Future<List<Task>> loadTasks({bool onlyOpen = true, int? limit}) async {
    await ensureReady();
    final query = _db.select(_db.tasks)
      ..orderBy([
        (task) => OrderingTerm.asc(task.dueDate),
        (task) => OrderingTerm.desc(task.createdAt),
      ]);
    if (onlyOpen) {
      query.where((task) => task.status.equals('open'));
    }
    if (limit != null) {
      query.limit(limit);
    }
    return query.get();
  }

  Future<List<Task>> loadTasksForDate(DateTime date) async {
    await ensureReady();
    final start = AppDateUtils.startOfDay(date);
    final end = AppDateUtils.endOfDay(date);
    return (_db.select(_db.tasks)
          ..where(
            (task) =>
                task.status.equals('open') &
                task.dueDate.isBetweenValues(start, end),
          )
          ..orderBy([
            (task) => OrderingTerm.asc(task.dueDate),
            (task) => OrderingTerm.desc(task.createdAt),
          ]))
        .get();
  }

  Future<Task?> loadTaskById(String id) async {
    await ensureReady();
    return (_db.select(
      _db.tasks,
    )..where((task) => task.id.equals(id))).getSingleOrNull();
  }

  Future<List<Habit>> loadHabits() async {
    await ensureReady();
    return (_db.select(
      _db.habits,
    )..orderBy([(h) => OrderingTerm.asc(h.name)])).get();
  }

  Future<List<DiaryEntry>> loadDiaryEntries() async {
    await ensureReady();
    return (_db.select(
      _db.diaryEntries,
    )..orderBy([(d) => OrderingTerm.desc(d.date)])).get();
  }

  Future<List<WaterLog>> loadWaterLogsForDate(DateTime date) async {
    await ensureReady();
    final start = AppDateUtils.startOfDay(date);
    final end = AppDateUtils.endOfDay(date);
    return (_db.select(_db.waterLogs)
          ..where((log) => log.loggedAt.isBetweenValues(start, end))
          ..orderBy([(log) => OrderingTerm.desc(log.loggedAt)]))
        .get();
  }

  Future<List<ConsumptionRecord>> loadConsumptionRecordsForDate(
    DateTime date,
  ) async {
    await ensureReady();
    final start = AppDateUtils.startOfDay(date);
    final end = AppDateUtils.endOfDay(date);
    return (_db.select(_db.consumptionRecords)
          ..where((record) => record.createdAt.isBetweenValues(start, end))
          ..orderBy([(record) => OrderingTerm.desc(record.createdAt)]))
        .get();
  }

  Future<void> addXp(int amount, String source, {String? note}) async {
    await _db
        .into(_db.xpLogs)
        .insert(
          XpLogsCompanion.insert(
            id: _uuid.v4(),
            amount: amount,
            source: source,
            note: Value(note),
            createdAt: DateTime.now(),
          ),
        );
  }

  Future<void> logWater(int amountMl) async {
    await _db
        .into(_db.waterLogs)
        .insert(
          WaterLogsCompanion.insert(
            id: _uuid.v4(),
            amountMl: amountMl,
            loggedAt: DateTime.now(),
          ),
        );
    await addXp(5, 'water', note: 'Agua registrada: ${amountMl}ml');
  }

  Future<ConsumptionRecord> addWaterConsumption(int amountMl) async {
    await logWater(amountMl);
    return addConsumptionRecord(
      type: 'water',
      name: 'Agua',
      quantity: amountMl.toDouble(),
      unit: 'ml',
    );
  }

  Future<void> addExpense(
    double amount,
    String? categoryId, {
    String? description,
  }) async {
    await _db
        .into(_db.financeTransactions)
        .insert(
          FinanceTransactionsCompanion.insert(
            id: _uuid.v4(),
            amount: amount,
            type: 'expense',
            categoryId: Value(categoryId),
            description: Value(description),
            date: DateTime.now(),
            createdAt: DateTime.now(),
          ),
        );
  }

  Future<void> addIncome(
    double amount,
    String? categoryId, {
    String? description,
  }) async {
    await _db
        .into(_db.financeTransactions)
        .insert(
          FinanceTransactionsCompanion.insert(
            id: _uuid.v4(),
            amount: amount,
            type: 'income',
            categoryId: Value(categoryId),
            description: Value(description),
            date: DateTime.now(),
            createdAt: DateTime.now(),
          ),
        );
  }

  Future<List<FinanceTransaction>> loadFinanceTransactions({int? limit}) async {
    await ensureReady();
    final query = _db.select(_db.financeTransactions)
      ..orderBy([
        (f) => OrderingTerm.desc(f.date),
        (f) => OrderingTerm.desc(f.createdAt),
      ]);
    if (limit != null) {
      query.limit(limit);
    }
    return query.get();
  }

  Future<void> clearFinanceTransactions() async {
    await ensureReady();
    await _db.delete(_db.financeTransactions).go();
  }

  Future<void> addFixedExpense(
    String name,
    double amount,
    String? categoryId,
    int dueDay,
  ) async {
    await _db
        .into(_db.fixedExpenses)
        .insert(
          FixedExpensesCompanion.insert(
            id: _uuid.v4(),
            name: name,
            amount: amount,
            categoryId: Value(categoryId),
            dueDay: dueDay,
            createdAt: DateTime.now(),
          ),
        );
  }

  Future<Task> addTask(String title, {DateTime? dueDate}) async {
    final id = _uuid.v4();
    await _db
        .into(_db.tasks)
        .insert(
          TasksCompanion.insert(
            id: id,
            title: title,
            dueDate: Value(dueDate),
            createdAt: DateTime.now(),
          ),
        );
    return (_db.select(
      _db.tasks,
    )..where((task) => task.id.equals(id))).getSingle();
  }

  Future<RoutineEvent> addRoutineEvent({
    required String title,
    required String type,
    required int weekday,
    required int startMinutes,
    required int endMinutes,
    String? description,
    bool notify = false,
    bool variable = false,
  }) async {
    final id = _uuid.v4();
    await _db
        .into(_db.routineEvents)
        .insert(
          RoutineEventsCompanion.insert(
            id: id,
            templateId: Value(variable ? 'variable_weekly' : 'fixed_weekly'),
            title: title,
            type: type,
            weekday: weekday,
            startMinutes: startMinutes,
            endMinutes: endMinutes,
            areaTags: Value(type),
            notify: Value(notify),
            description: Value(description),
            createdAt: DateTime.now(),
          ),
        );
    return (_db.select(
      _db.routineEvents,
    )..where((event) => event.id.equals(id))).getSingle();
  }

  Future<void> updateRoutineEvent({
    required RoutineEvent event,
    required String title,
    required String type,
    required int weekday,
    required int startMinutes,
    required int endMinutes,
    String? description,
    bool notify = false,
    bool variable = false,
  }) async {
    await (_db.update(
      _db.routineEvents,
    )..where((r) => r.id.equals(event.id))).write(
      RoutineEventsCompanion(
        templateId: Value(variable ? 'variable_weekly' : 'fixed_weekly'),
        title: Value(title),
        type: Value(type),
        weekday: Value(weekday),
        startMinutes: Value(startMinutes),
        endMinutes: Value(endMinutes),
        areaTags: Value(type),
        notify: Value(notify),
        description: Value(description),
      ),
    );
  }

  Future<void> deleteRoutineEvent(RoutineEvent event) async {
    await (_db.delete(
      _db.routineEvents,
    )..where((r) => r.id.equals(event.id))).go();
  }

  Future<void> clearRoutineForWeekday(int weekday) async {
    await ensureReady();
    await (_db.delete(
      _db.routineEvents,
    )..where((event) => event.weekday.equals(weekday))).go();
  }

  Future<void> createOrReplaceTodayMission(
    String title,
    String description,
  ) async {
    final today = AppDateUtils.startOfDay(DateTime.now());
    await _db
        .into(_db.dailyMissions)
        .insert(
          DailyMissionsCompanion.insert(
            id: _uuid.v4(),
            date: today,
            title: title,
            description: Value(description),
            status: const Value('accepted'),
            createdAt: DateTime.now(),
          ),
        );
  }

  Future<void> completeTask(Task task) async {
    await (_db.update(_db.tasks)..where((t) => t.id.equals(task.id))).write(
      TasksCompanion(
        status: const Value('done'),
        completedAt: Value(DateTime.now()),
      ),
    );
    await addXp(task.xpReward, 'task', note: task.title);
  }

  Future<void> completeRoutineEventForDate(
    RoutineEvent event,
    DateTime date,
  ) async {
    final start = AppDateUtils.startOfDay(date);
    final end = AppDateUtils.endOfDay(date);
    final existing =
        await (_db.select(_db.routineEventLogs)
              ..where(
                (log) =>
                    log.routineEventId.equals(event.id) &
                    log.date.isBetweenValues(start, end),
              )
              ..limit(1))
            .getSingleOrNull();

    if (existing != null) {
      return;
    }

    await _db
        .into(_db.routineEventLogs)
        .insert(
          RoutineEventLogsCompanion.insert(
            id: _uuid.v4(),
            routineEventId: event.id,
            date: start,
            status: 'done',
            createdAt: DateTime.now(),
          ),
        );
    await addXp(10, 'routine', note: event.title);
  }

  Future<void> completeMission(DailyMission mission) async {
    await (_db.update(
      _db.dailyMissions,
    )..where((m) => m.id.equals(mission.id))).write(
      DailyMissionsCompanion(
        status: const Value('completed'),
        completedAt: Value(DateTime.now()),
      ),
    );
    await addXp(mission.xpReward, 'mission', note: mission.title);
  }

  Future<void> addFoodLog({
    required String name,
    required double calories,
    double quantity = 1,
    double protein = 0,
    double sugar = 0,
    double salt = 0,
    double fat = 0,
    double carbs = 0,
  }) async {
    await _db
        .into(_db.foodLogs)
        .insert(
          FoodLogsCompanion.insert(
            id: _uuid.v4(),
            name: name,
            quantity: Value(quantity),
            calories: Value(calories),
            sugar: Value(sugar),
            salt: Value(salt),
            protein: Value(protein),
            fat: Value(fat),
            carbs: Value(carbs),
            loggedAt: DateTime.now(),
          ),
        );
  }

  Future<ConsumptionRecord> addConsumptionRecord({
    required String type,
    required String name,
    String? productId,
    required double quantity,
    required String unit,
    double calories = 0,
    double protein = 0,
    double carbohydrates = 0,
    double sugars = 0,
    double totalFat = 0,
    double saturatedFat = 0,
    double transFat = 0,
    double fiber = 0,
    double sodium = 0,
    double salt = 0,
    DateTime? createdAt,
  }) async {
    await ensureReady();
    final id = _uuid.v4();
    final timestamp = createdAt ?? DateTime.now();
    await _db.into(_db.consumptionRecords).insert(
          ConsumptionRecordsCompanion.insert(
            id: id,
            type: type,
            name: name,
            productId: Value(productId),
            quantity: quantity,
            unit: unit,
            calories: Value(calories),
            protein: Value(protein),
            carbohydrates: Value(carbohydrates),
            sugars: Value(sugars),
            totalFat: Value(totalFat),
            saturatedFat: Value(saturatedFat),
            transFat: Value(transFat),
            fiber: Value(fiber),
            sodium: Value(sodium),
            salt: Value(salt),
            createdAt: timestamp,
          ),
        );
    return (_db.select(
      _db.consumptionRecords,
    )..where((record) => record.id.equals(id))).getSingle();
  }

  Future<Product> createProduct({
    required String name,
    String? brand,
    String? category,
    String? barcode,
    String? imagePath,
    required double servingSize,
    required String servingUnit,
    double calories = 0,
    double protein = 0,
    double carbohydrates = 0,
    double sugars = 0,
    double totalFat = 0,
    double saturatedFat = 0,
    double transFat = 0,
    double fiber = 0,
    double sodium = 0,
    double salt = 0,
    double? cholesterol,
    double? potassium,
    String? ingredients,
    String? notes,
    double? price,
    String? purchaseLocation,
    DateTime? expiryDate,
  }) async {
    await ensureReady();
    final id = _uuid.v4();
    final now = DateTime.now();
    await _db.into(_db.products).insert(
          ProductsCompanion.insert(
            id: id,
            name: name,
            brand: Value(brand),
            category: Value(category),
            barcode: Value(barcode),
            imagePath: Value(imagePath),
            servingSize: servingSize,
            servingUnit: servingUnit,
            calories: Value(calories),
            protein: Value(protein),
            carbohydrates: Value(carbohydrates),
            sugars: Value(sugars),
            totalFat: Value(totalFat),
            saturatedFat: Value(saturatedFat),
            transFat: Value(transFat),
            fiber: Value(fiber),
            sodium: Value(sodium),
            salt: Value(salt),
            cholesterol: Value(cholesterol),
            potassium: Value(potassium),
            ingredients: Value(ingredients),
            notes: Value(notes),
            price: Value(price),
            purchaseLocation: Value(purchaseLocation),
            expiryDate: Value(expiryDate),
            createdAt: now,
            updatedAt: now,
          ),
        );
    return (_db.select(
      _db.products,
    )..where((product) => product.id.equals(id))).getSingle();
  }

  Future<void> updateProduct({
    required Product product,
    required String name,
    String? brand,
    String? category,
    String? barcode,
    String? imagePath,
    required double servingSize,
    required String servingUnit,
    double calories = 0,
    double protein = 0,
    double carbohydrates = 0,
    double sugars = 0,
    double totalFat = 0,
    double saturatedFat = 0,
    double transFat = 0,
    double fiber = 0,
    double sodium = 0,
    double salt = 0,
    double? cholesterol,
    double? potassium,
    String? ingredients,
    String? notes,
    double? price,
    String? purchaseLocation,
    DateTime? expiryDate,
  }) async {
    await ensureReady();
    await (_db.update(_db.products)..where((item) => item.id.equals(product.id)))
        .write(
      ProductsCompanion(
        name: Value(name),
        brand: Value(brand),
        category: Value(category),
        barcode: Value(barcode),
        imagePath: Value(imagePath),
        servingSize: Value(servingSize),
        servingUnit: Value(servingUnit),
        calories: Value(calories),
        protein: Value(protein),
        carbohydrates: Value(carbohydrates),
        sugars: Value(sugars),
        totalFat: Value(totalFat),
        saturatedFat: Value(saturatedFat),
        transFat: Value(transFat),
        fiber: Value(fiber),
        sodium: Value(sodium),
        salt: Value(salt),
        cholesterol: Value(cholesterol),
        potassium: Value(potassium),
        ingredients: Value(ingredients),
        notes: Value(notes),
        price: Value(price),
        purchaseLocation: Value(purchaseLocation),
        expiryDate: Value(expiryDate),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> deleteProduct(Product product) async {
    await ensureReady();
    await (_db.delete(_db.products)..where((item) => item.id.equals(product.id)))
        .go();
  }

  Future<void> addProject(String name, String nextTask) async {
    await _db
        .into(_db.projects)
        .insert(
          ProjectsCompanion.insert(
            id: _uuid.v4(),
            name: name,
            nextTask: Value(nextTask),
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
        );
  }

  Future<void> addDiaryEntry({
    required int mood,
    required int energy,
    required String victory,
    required String learning,
  }) async {
    await _db
        .into(_db.diaryEntries)
        .insert(
          DiaryEntriesCompanion.insert(
            id: _uuid.v4(),
            date: AppDateUtils.startOfDay(DateTime.now()),
            mood: Value(mood),
            energy: Value(energy),
            victory: Value(victory),
            learning: Value(learning),
            createdAt: DateTime.now(),
          ),
        );
  }

  Future<void> markHabitDone(Habit habit) async {
    await _db
        .into(_db.habitLogs)
        .insert(
          HabitLogsCompanion.insert(
            id: _uuid.v4(),
            habitId: habit.id,
            date: AppDateUtils.startOfDay(DateTime.now()),
            createdAt: DateTime.now(),
          ),
        );
    await addXp(habit.xpReward, 'habit', note: habit.name);
  }

  Future<WorkoutSession> startWorkout(Workout workout) async {
    final session = WorkoutSessionsCompanion.insert(
      id: _uuid.v4(),
      workoutId: Value(workout.id),
      startedAt: DateTime.now(),
    );
    await _db.into(_db.workoutSessions).insert(session);
    return (_db.select(
      _db.workoutSessions,
    )..where((s) => s.id.equals(session.id.value))).getSingle();
  }

  Future<List<Workout>> loadWorkouts() async {
    await ensureReady();
    return (_db.select(_db.workouts)..orderBy([
          (workout) => OrderingTerm.asc(workout.durationMinutes),
          (workout) => OrderingTerm.asc(workout.name),
        ]))
        .get();
  }

  Future<Workout?> findWorkoutByQuery(String query) async {
    final normalizedQuery = query.trim().toLowerCase();
    if (normalizedQuery.isEmpty) {
      return null;
    }

    final workouts = await loadWorkouts();
    for (final workout in workouts) {
      final haystack =
          '${workout.name} ${workout.type} ${workout.objective ?? ''}'
              .toLowerCase();
      if (haystack.contains(normalizedQuery)) {
        return workout;
      }
    }
    return null;
  }

  Future<Workout?> loadWorkoutById(String id) async {
    await ensureReady();
    return (_db.select(
      _db.workouts,
    )..where((workout) => workout.id.equals(id))).getSingleOrNull();
  }

  Future<Workout> createAdHocWorkout({
    required String name,
    required String objective,
    int durationMinutes = 45,
  }) async {
    final id = _uuid.v4();
    await _db
        .into(_db.workouts)
        .insert(
          WorkoutsCompanion.insert(
            id: id,
            name: name,
            type: 'IA',
            durationMinutes: durationMinutes,
            intensity: const Value('Media'),
            objective: Value(objective),
            status: const Value('ai_generated'),
            createdAt: DateTime.now(),
          ),
        );
    return (_db.select(
      _db.workouts,
    )..where((workout) => workout.id.equals(id))).getSingle();
  }

  Future<void> addAiHistoryEntry({
    required String userMessage,
    required String aiResponse,
    required String actionType,
    required String module,
    String? metadataJson,
  }) async {
    await ensureReady();
    await _db
        .into(_db.aiHistoryEntries)
        .insert(
          AiHistoryEntriesCompanion.insert(
            id: _uuid.v4(),
            userMessage: userMessage,
            aiResponse: aiResponse,
            actionType: actionType,
            module: module,
            metadataJson: Value(metadataJson),
            createdAt: DateTime.now(),
          ),
        );
  }

  Future<List<AiHistoryEntry>> loadAiHistoryEntries({int limit = 30}) async {
    await ensureReady();
    return (_db.select(_db.aiHistoryEntries)
          ..orderBy([(entry) => OrderingTerm.desc(entry.createdAt)])
          ..limit(limit))
        .get();
  }

  Future<void> clearAiHistory() async {
    await ensureReady();
    await _db.delete(_db.aiHistoryEntries).go();
  }

  Future<AiNote> addAiNote(String content) async {
    await ensureReady();
    final id = _uuid.v4();
    await _db
        .into(_db.aiNotes)
        .insert(
          AiNotesCompanion.insert(
            id: id,
            content: content,
            createdAt: DateTime.now(),
          ),
        );
    return (_db.select(
      _db.aiNotes,
    )..where((note) => note.id.equals(id))).getSingle();
  }

  Future<List<AiNote>> loadAiNotes({int limit = 30}) async {
    await ensureReady();
    final query = _db.select(_db.aiNotes)
      ..orderBy([(note) => OrderingTerm.desc(note.createdAt)]);
    query.limit(limit);
    return query.get();
  }
}
