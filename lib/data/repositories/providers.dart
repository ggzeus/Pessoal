import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../local/database/app_database.dart';
import '../local/seed/seed_service.dart';
import 'dashboard_snapshot.dart';
import 'personal_repository.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();
  ref.onDispose(database.close);
  return database;
});

final seedServiceProvider = Provider<SeedService>((ref) {
  return SeedService(ref.watch(appDatabaseProvider));
});

final personalRepositoryProvider = Provider<PersonalRepository>((ref) {
  return PersonalRepository(ref.watch(appDatabaseProvider), ref.watch(seedServiceProvider));
});

final appReadyProvider = FutureProvider<void>((ref) async {
  await ref.watch(personalRepositoryProvider).ensureReady();
});

final dashboardProvider = FutureProvider<DashboardSnapshot>((ref) async {
  return ref.watch(personalRepositoryProvider).loadDashboard();
});

final financeCategoriesProvider = FutureProvider((ref) {
  return ref.watch(personalRepositoryProvider).loadFinanceCategories();
});

final fixedExpensesProvider = FutureProvider((ref) {
  return ref.watch(personalRepositoryProvider).loadFixedExpenses();
});

final foodsProvider = FutureProvider((ref) {
  return ref.watch(personalRepositoryProvider).loadFoods();
});

final studyUnitsProvider = FutureProvider((ref) {
  return ref.watch(personalRepositoryProvider).loadStudyUnits();
});

final exercisesProvider = FutureProvider((ref) {
  return ref.watch(personalRepositoryProvider).loadExercises();
});

final projectsProvider = FutureProvider((ref) {
  return ref.watch(personalRepositoryProvider).loadProjects();
});

final habitsProvider = FutureProvider((ref) {
  return ref.watch(personalRepositoryProvider).loadHabits();
});

final diaryProvider = FutureProvider((ref) {
  return ref.watch(personalRepositoryProvider).loadDiaryEntries();
});

final routineProvider = FutureProvider.family((ref, int weekday) {
  return ref.watch(personalRepositoryProvider).loadRoutineForWeekday(weekday);
});
