import '../local/database/app_database.dart';

class DashboardSnapshot {
  const DashboardSnapshot({
    required this.mission,
    required this.nextRoutineEvent,
    required this.openTasks,
    required this.totalXp,
    required this.level,
    required this.levelProgress,
    required this.waterMl,
    required this.monthIncome,
    required this.monthExpense,
    required this.fixedExpenseTotal,
    required this.pendingWorkout,
    required this.studySuggestion,
    required this.projects,
    required this.habits,
  });

  final DailyMission? mission;
  final RoutineEvent? nextRoutineEvent;
  final List<Task> openTasks;
  final int totalXp;
  final int level;
  final double levelProgress;
  final int waterMl;
  final double monthIncome;
  final double monthExpense;
  final double fixedExpenseTotal;
  final Workout? pendingWorkout;
  final StudyUnit? studySuggestion;
  final List<Project> projects;
  final List<Habit> habits;

  double get monthBalance => monthIncome - monthExpense - fixedExpenseTotal;
}
