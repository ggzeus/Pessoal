import '../../data/local/database/app_database.dart';

class WorkoutPlan {
  const WorkoutPlan({
    required this.name,
    required this.objective,
    required this.exercises,
    required this.durationMinutes,
  });

  final String name;
  final String objective;
  final List<Exercise> exercises;
  final int durationMinutes;

  factory WorkoutPlan.fromExercises(List<Exercise> exercises) {
    final categories = exercises
        .map((item) => item.category)
        .toSet()
        .join(' + ');
    final duration = exercises.fold<int>(
      0,
      (total, item) => total + item.averageMinutes,
    );
    return WorkoutPlan(
      name: categories.isEmpty
          ? 'Treino personalizado'
          : 'Treino personalizado: $categories',
      objective:
          'Sessao montada manualmente com ${exercises.length} exercicios do repertorio.',
      exercises: exercises,
      durationMinutes: duration,
    );
  }
}
