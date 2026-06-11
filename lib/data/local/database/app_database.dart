import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

class RoutineTemplates extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  IntColumn get weekday => integer()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class RoutineEvents extends Table {
  TextColumn get id => text()();
  TextColumn get templateId => text().nullable()();
  TextColumn get title => text()();
  TextColumn get type => text()();
  IntColumn get weekday => integer()();
  IntColumn get startMinutes => integer()();
  IntColumn get endMinutes => integer()();
  TextColumn get areaTags => text().withDefault(const Constant(''))();
  BoolColumn get notify => boolean().withDefault(const Constant(false))();
  TextColumn get description => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class RoutineOverrides extends Table {
  TextColumn get id => text()();
  TextColumn get routineEventId => text().nullable()();
  DateTimeColumn get date => dateTime()();
  TextColumn get scope => text().withDefault(const Constant('single_day'))();
  TextColumn get title => text().nullable()();
  IntColumn get startMinutes => integer().nullable()();
  IntColumn get endMinutes => integer().nullable()();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class RoutineEventLogs extends Table {
  TextColumn get id => text()();
  TextColumn get routineEventId => text()();
  DateTimeColumn get date => dateTime()();
  TextColumn get status => text()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class DailyMissions extends Table {
  TextColumn get id => text()();
  DateTimeColumn get date => dateTime()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  TextColumn get status => text().withDefault(const Constant('draft'))();
  IntColumn get xpReward => integer().withDefault(const Constant(30))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get completedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class MissionTasks extends Table {
  TextColumn get id => text()();
  TextColumn get missionId => text()();
  TextColumn get title => text()();
  BoolColumn get isDone => boolean().withDefault(const Constant(false))();
  IntColumn get xpReward => integer().withDefault(const Constant(5))();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class MissionLogs extends Table {
  TextColumn get id => text()();
  TextColumn get missionId => text()();
  TextColumn get action => text()();
  TextColumn get note => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class TaskCategories extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get lifeArea => text().nullable()();
  TextColumn get colorHex => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class Tasks extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get categoryId => text().nullable()();
  TextColumn get status => text().withDefault(const Constant('open'))();
  TextColumn get priority => text().withDefault(const Constant('normal'))();
  DateTimeColumn get dueDate => dateTime().nullable()();
  IntColumn get xpReward => integer().withDefault(const Constant(5))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get completedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class TaskLogs extends Table {
  TextColumn get id => text()();
  TextColumn get taskId => text()();
  TextColumn get action => text()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class Foods extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  RealColumn get calories => real().withDefault(const Constant(0))();
  RealColumn get sugar => real().withDefault(const Constant(0))();
  RealColumn get salt => real().withDefault(const Constant(0))();
  RealColumn get protein => real().withDefault(const Constant(0))();
  RealColumn get fat => real().withDefault(const Constant(0))();
  RealColumn get carbs => real().withDefault(const Constant(0))();
  TextColumn get category => text().nullable()();
  TextColumn get portion => text().nullable()();
  BoolColumn get favorite => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class FoodLogs extends Table {
  TextColumn get id => text()();
  TextColumn get foodId => text().nullable()();
  TextColumn get name => text()();
  RealColumn get quantity => real().withDefault(const Constant(1))();
  RealColumn get calories => real().withDefault(const Constant(0))();
  RealColumn get sugar => real().withDefault(const Constant(0))();
  RealColumn get salt => real().withDefault(const Constant(0))();
  RealColumn get protein => real().withDefault(const Constant(0))();
  RealColumn get fat => real().withDefault(const Constant(0))();
  RealColumn get carbs => real().withDefault(const Constant(0))();
  DateTimeColumn get loggedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class WaterLogs extends Table {
  TextColumn get id => text()();
  IntColumn get amountMl => integer()();
  DateTimeColumn get loggedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class NutritionGoals extends Table {
  TextColumn get id => text()();
  IntColumn get waterMl => integer().withDefault(const Constant(2000))();
  RealColumn get calories => real().nullable()();
  RealColumn get protein => real().nullable()();
  RealColumn get sugarLimit => real().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class Exercises extends Table {
  TextColumn get id => text()();
  TextColumn get category => text()();
  TextColumn get subcategory => text().nullable()();
  TextColumn get name => text()();
  TextColumn get objective => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get level => text().withDefault(const Constant('Base'))();
  IntColumn get averageMinutes => integer().withDefault(const Constant(10))();
  TextColumn get metrics => text().nullable()();
  TextColumn get precautions => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class Workouts extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get type => text()();
  IntColumn get durationMinutes => integer()();
  TextColumn get intensity => text().withDefault(const Constant('Media'))();
  TextColumn get objective => text().nullable()();
  TextColumn get templateJson => text().nullable()();
  TextColumn get status => text().withDefault(const Constant('pending'))();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class WorkoutSessions extends Table {
  TextColumn get id => text()();
  TextColumn get workoutId => text().nullable()();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get finishedAt => dateTime().nullable()();
  TextColumn get status => text().withDefault(const Constant('active'))();
  IntColumn get xpReward => integer().withDefault(const Constant(20))();

  @override
  Set<Column> get primaryKey => {id};
}

class WorkoutSessionSteps extends Table {
  TextColumn get id => text()();
  TextColumn get sessionId => text()();
  TextColumn get exerciseId => text().nullable()();
  TextColumn get title => text()();
  IntColumn get orderIndex => integer()();
  IntColumn get durationSeconds => integer().nullable()();
  IntColumn get repetitions => integer().nullable()();
  IntColumn get sets => integer().withDefault(const Constant(1))();
  IntColumn get restSeconds => integer().withDefault(const Constant(45))();
  TextColumn get status => text().withDefault(const Constant('pending'))();

  @override
  Set<Column> get primaryKey => {id};
}

class WorkoutLogs extends Table {
  TextColumn get id => text()();
  TextColumn get sessionId => text()();
  TextColumn get note => text().nullable()();
  IntColumn get fatigue => integer().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class StudySubjects extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get colorHex => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class StudyUnits extends Table {
  TextColumn get id => text()();
  TextColumn get subjectId => text()();
  TextColumn get title => text()();
  TextColumn get objective => text().nullable()();
  TextColumn get difficulty => text().withDefault(const Constant('Base'))();
  TextColumn get priority => text().withDefault(const Constant('Normal'))();
  IntColumn get estimatedMinutes => integer().withDefault(const Constant(30))();
  IntColumn get mastery => integer().withDefault(const Constant(0))();
  DateTimeColumn get examDate => dateTime().nullable()();
  DateTimeColumn get lastReviewAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class StudySessions extends Table {
  TextColumn get id => text()();
  TextColumn get unitId => text().nullable()();
  TextColumn get sessionType => text()();
  IntColumn get minutes => integer()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get finishedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class StudyReviews extends Table {
  TextColumn get id => text()();
  TextColumn get unitId => text()();
  DateTimeColumn get dueAt => dateTime()();
  DateTimeColumn get completedAt => dateTime().nullable()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class FinanceCategories extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get nature => text()();
  TextColumn get description => text().nullable()();
  BoolColumn get acceptsRecurrence => boolean().withDefault(const Constant(false))();
  TextColumn get alertRule => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class FinanceTransactions extends Table {
  TextColumn get id => text()();
  RealColumn get amount => real()();
  TextColumn get type => text()();
  TextColumn get categoryId => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get paymentMethod => text().nullable()();
  BoolColumn get fixed => boolean().withDefault(const Constant(false))();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class FixedExpenses extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  RealColumn get amount => real()();
  TextColumn get categoryId => text().nullable()();
  IntColumn get dueDay => integer()();
  TextColumn get recurrence => text().withDefault(const Constant('Mensal'))();
  BoolColumn get active => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class FinancialGoals extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  RealColumn get targetAmount => real()();
  RealColumn get currentAmount => real().withDefault(const Constant(0))();
  DateTimeColumn get deadline => dateTime().nullable()();
  TextColumn get category => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class ReceiptImages extends Table {
  TextColumn get id => text()();
  TextColumn get transactionId => text()();
  TextColumn get path => text()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class Projects extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get status => text().withDefault(const Constant('Em andamento'))();
  TextColumn get priority => text().withDefault(const Constant('Media'))();
  IntColumn get progress => integer().withDefault(const Constant(0))();
  TextColumn get nextTask => text().nullable()();
  TextColumn get area => text().withDefault(const Constant('Projetos'))();
  IntColumn get investedMinutes => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class ProjectTasks extends Table {
  TextColumn get id => text()();
  TextColumn get projectId => text()();
  TextColumn get title => text()();
  BoolColumn get isDone => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class ProjectNotes extends Table {
  TextColumn get id => text()();
  TextColumn get projectId => text()();
  TextColumn get note => text()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class ProjectTimeLogs extends Table {
  TextColumn get id => text()();
  TextColumn get projectId => text()();
  IntColumn get minutes => integer()();
  TextColumn get note => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class DiaryEntries extends Table {
  TextColumn get id => text()();
  DateTimeColumn get date => dateTime()();
  IntColumn get mood => integer().nullable()();
  IntColumn get energy => integer().nullable()();
  IntColumn get productivity => integer().nullable()();
  TextColumn get sleep => text().nullable()();
  TextColumn get nutrition => text().nullable()();
  TextColumn get training => text().nullable()();
  TextColumn get studies => text().nullable()();
  TextColumn get finances => text().nullable()();
  TextColumn get victory => text().nullable()();
  TextColumn get mistake => text().nullable()();
  TextColumn get learning => text().nullable()();
  TextColumn get freeNote => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class MoodLogs extends Table {
  TextColumn get id => text()();
  IntColumn get value => integer()();
  TextColumn get note => text().nullable()();
  DateTimeColumn get loggedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class EnergyLogs extends Table {
  TextColumn get id => text()();
  IntColumn get value => integer()();
  TextColumn get note => text().nullable()();
  DateTimeColumn get loggedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class Habits extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get lifeArea => text().nullable()();
  TextColumn get frequency => text().withDefault(const Constant('Diario'))();
  TextColumn get trigger => text().nullable()();
  TextColumn get action => text().nullable()();
  TextColumn get metric => text().nullable()();
  IntColumn get xpReward => integer().withDefault(const Constant(5))();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class HabitLogs extends Table {
  TextColumn get id => text()();
  TextColumn get habitId => text()();
  DateTimeColumn get date => dateTime()();
  BoolColumn get isDone => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class LifeAreas extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get colorHex => text().nullable()();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class LifeAreaScores extends Table {
  TextColumn get id => text()();
  TextColumn get lifeAreaId => text()();
  DateTimeColumn get weekStart => dateTime()();
  IntColumn get score => integer()();
  TextColumn get source => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class XpLogs extends Table {
  TextColumn get id => text()();
  IntColumn get amount => integer()();
  TextColumn get source => text()();
  TextColumn get note => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class Levels extends Table {
  TextColumn get id => text()();
  IntColumn get level => integer()();
  TextColumn get title => text()();
  IntColumn get requiredXp => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class Achievements extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get icon => text().nullable()();
  IntColumn get xpReward => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}

class AchievementUnlocks extends Table {
  TextColumn get id => text()();
  TextColumn get achievementId => text()();
  DateTimeColumn get unlockedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class AppSettings extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {key};
}

class UserPreferences extends Table {
  TextColumn get id => text()();
  TextColumn get key => text()();
  TextColumn get value => text()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(
  tables: [
    RoutineTemplates,
    RoutineEvents,
    RoutineOverrides,
    RoutineEventLogs,
    DailyMissions,
    MissionTasks,
    MissionLogs,
    Tasks,
    TaskCategories,
    TaskLogs,
    Foods,
    FoodLogs,
    WaterLogs,
    NutritionGoals,
    Exercises,
    Workouts,
    WorkoutSessions,
    WorkoutSessionSteps,
    WorkoutLogs,
    StudySubjects,
    StudyUnits,
    StudySessions,
    StudyReviews,
    FinanceCategories,
    FinanceTransactions,
    FixedExpenses,
    FinancialGoals,
    ReceiptImages,
    Projects,
    ProjectTasks,
    ProjectNotes,
    ProjectTimeLogs,
    DiaryEntries,
    MoodLogs,
    EnergyLogs,
    Habits,
    HabitLogs,
    LifeAreas,
    LifeAreaScores,
    XpLogs,
    Levels,
    Achievements,
    AchievementUnlocks,
    AppSettings,
    UserPreferences,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
      : super(
          executor ??
              driftDatabase(
                name: 'controle_pessoal',
                web: DriftWebOptions(
                  sqlite3Wasm: Uri.parse('sqlite3.wasm'),
                  driftWorker: Uri.parse('drift_worker.js'),
                ),
              ),
        );

  @override
  int get schemaVersion => 1;
}
