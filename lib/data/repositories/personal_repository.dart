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

  Future<void> addExpense(
    double amount,
    String categoryId, {
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
    String categoryId, {
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

  Future<void> addTask(String title) async {
    await _db
        .into(_db.tasks)
        .insert(
          TasksCompanion.insert(
            id: _uuid.v4(),
            title: title,
            createdAt: DateTime.now(),
          ),
        );
  }

  Future<void> addRoutineEvent({
    required String title,
    required String type,
    required int weekday,
    required int startMinutes,
    required int endMinutes,
    String? description,
    bool notify = false,
    bool variable = false,
  }) async {
    await _db
        .into(_db.routineEvents)
        .insert(
          RoutineEventsCompanion.insert(
            id: _uuid.v4(),
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
  }) async {
    await _db
        .into(_db.foodLogs)
        .insert(
          FoodLogsCompanion.insert(
            id: _uuid.v4(),
            name: name,
            quantity: Value(quantity),
            calories: Value(calories),
            loggedAt: DateTime.now(),
          ),
        );
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
}
