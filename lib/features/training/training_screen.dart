import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/widgets/async_state_view.dart';
import '../../core/widgets/section_card.dart';
import '../../data/local/database/app_database.dart';
import '../../data/repositories/providers.dart';
import 'exercise_demo.dart';
import 'workout_plan.dart';

class TrainingScreen extends ConsumerStatefulWidget {
  const TrainingScreen({super.key});

  @override
  ConsumerState<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends ConsumerState<TrainingScreen> {
  final _searchController = TextEditingController();
  final _selectedExerciseIds = <String>{};
  String _category = _allCategoriesLabel;
  int _minimumMinutes = 0;
  int _people = 0;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dashboard = ref.watch(dashboardProvider);
    final exercises = ref.watch(exercisesProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Treino')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          AsyncStateView(
            value: dashboard,
            builder: (data) => SectionCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.pendingWorkout?.name ?? 'Treino rapido 45 minutos',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    data.pendingWorkout?.objective ??
                        'Aquecimento, tecnica, fisico e mobilidade.',
                  ),
                  const SizedBox(height: 14),
                  FilledButton.icon(
                    onPressed: () => context.push('/immersive'),
                    icon: const Icon(Icons.play_arrow_rounded),
                    label: const Text('Iniciar modo imersivo'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),
          AsyncStateView(
            value: exercises,
            builder: (items) {
              final categories = [
                _allCategoriesLabel,
                ...items.map((item) => item.category).toSet().toList()..sort(),
              ];
              final filtered = _filterExercises(items);
              final selected = items
                  .where((item) => _selectedExerciseIds.contains(item.id))
                  .toList();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Biblioteca do repertorio',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '${items.length} treinos carregados de futebol, karate, calistenia, corrida e mais.',
                        ),
                        const SizedBox(height: 14),
                        TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            labelText: 'Pesquisar treino',
                            prefixIcon: const Icon(Icons.search_rounded),
                            suffixIcon: IconButton(
                              tooltip: 'Limpar busca',
                              onPressed: () =>
                                  setState(_searchController.clear),
                              icon: const Icon(Icons.close_rounded),
                            ),
                          ),
                          onChanged: (_) => setState(() {}),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                initialValue: _category,
                                decoration: const InputDecoration(
                                  labelText: 'Categoria',
                                ),
                                items: categories
                                    .map(
                                      (item) => DropdownMenuItem(
                                        value: item,
                                        child: Text(item),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) => setState(
                                  () =>
                                      _category = value ?? _allCategoriesLabel,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextFormField(
                                initialValue: _minimumMinutes == 0
                                    ? ''
                                    : '$_minimumMinutes',
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                decoration: const InputDecoration(
                                  labelText: 'Tempo minimo',
                                ),
                                onChanged: (value) => setState(
                                  () => _minimumMinutes =
                                      int.tryParse(value) ?? 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        DropdownButtonFormField<int>(
                          initialValue: _people,
                          decoration: const InputDecoration(
                            labelText: 'Quantidade de pessoas',
                          ),
                          items: const [
                            DropdownMenuItem(value: 0, child: Text('Qualquer')),
                            DropdownMenuItem(value: 1, child: Text('Solo')),
                            DropdownMenuItem(
                              value: 2,
                              child: Text('2 pessoas'),
                            ),
                            DropdownMenuItem(value: 3, child: Text('Grupo')),
                          ],
                          onChanged: (value) =>
                              setState(() => _people = value ?? 0),
                        ),
                        if (_category == _runningCategory) ...[
                          const SizedBox(height: 12),
                          const _HealthRequirementNote(),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (selected.isNotEmpty)
                    SectionCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Treino personalizado',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '${selected.length} exercicios - ${_totalMinutes(selected)} min estimados',
                          ),
                          const SizedBox(height: 12),
                          FilledButton.icon(
                            onPressed: () => context.push(
                              '/immersive',
                              extra: WorkoutPlan.fromExercises(selected),
                            ),
                            icon: const Icon(Icons.fitness_center_rounded),
                            label: const Text('Montar no modo imersivo'),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 12),
                  Text(
                    '${filtered.length} resultados',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 10),
                  for (final item in filtered)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: _ExerciseCard(
                        exercise: item,
                        selected: _selectedExerciseIds.contains(item.id),
                        onTap: () => _showExerciseDetails(context, item),
                        onToggle: () {
                          setState(() {
                            if (!_selectedExerciseIds.add(item.id)) {
                              _selectedExerciseIds.remove(item.id);
                            }
                          });
                        },
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  List<Exercise> _filterExercises(List<Exercise> items) {
    final query = _searchController.text.trim().toLowerCase();
    return items.where((item) {
      final matchesQuery =
          query.isEmpty ||
          item.name.toLowerCase().contains(query) ||
          item.category.toLowerCase().contains(query) ||
          (item.objective ?? '').toLowerCase().contains(query);
      final matchesCategory =
          _category == _allCategoriesLabel || item.category == _category;
      final matchesMinutes = item.averageMinutes >= _minimumMinutes;
      final matchesPeople = _people == 0 || _supportsPeopleCount(item, _people);
      return matchesQuery && matchesCategory && matchesMinutes && matchesPeople;
    }).toList();
  }
}

class _ExerciseCard extends StatelessWidget {
  const _ExerciseCard({
    required this.exercise,
    required this.selected,
    required this.onTap,
    required this.onToggle,
  });

  final Exercise exercise;
  final bool selected;
  final VoidCallback onTap;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(_categoryIcon(exercise.category)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exercise.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '${exercise.category} - ${exercise.level} - ${exercise.averageMinutes} min',
                ),
                if ((exercise.objective ?? '').trim().isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Text(exercise.objective!),
                ],
              ],
            ),
          ),
          IconButton.filledTonal(
            tooltip: selected ? 'Remover do treino' : 'Adicionar ao treino',
            onPressed: onToggle,
            icon: Icon(selected ? Icons.check_rounded : Icons.add_rounded),
          ),
        ],
      ),
    );
  }
}

class _HealthRequirementNote extends StatelessWidget {
  const _HealthRequirementNote();

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.health_and_safety_rounded, size: 20),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            'Corridas ficam disponiveis no repertorio, mas metricas como distancia, ritmo e velocidade dependem de HealthKit ou Health Connect.',
          ),
        ),
      ],
    );
  }
}

Future<void> _showExerciseDetails(BuildContext context, Exercise exercise) {
  return showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    isScrollControlled: true,
    builder: (context) => DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.72,
      maxChildSize: 0.92,
      minChildSize: 0.42,
      builder: (context, scrollController) => ListView(
        controller: scrollController,
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
        children: [
          Text(
            exercise.name,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Chip(label: Text(exercise.category)),
              Chip(label: Text(exercise.level)),
              Chip(label: Text('${exercise.averageMinutes} min')),
              if (exercise.category == _runningCategory)
                const Chip(label: Text('Requer Health')),
            ],
          ),
          const SizedBox(height: 16),
          ExerciseDemonstrationSection(exercise: exercise),
          const SizedBox(height: 16),
          _DetailBlock(
            title: 'Objetivo',
            body: exercise.objective ?? 'Treino tecnico do repertorio.',
          ),
          if ((exercise.metrics ?? '').trim().isNotEmpty)
            _DetailBlock(title: 'Metricas', body: exercise.metrics!),
          _DetailBlock(
            title: 'Seguranca',
            body:
                exercise.precautions ??
                'Aqueça antes, mantenha tecnica limpa e pare em caso de dor.',
          ),
        ],
      ),
    ),
  );
}

class _DetailBlock extends StatelessWidget {
  const _DetailBlock({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 6),
          Text(body),
        ],
      ),
    );
  }
}

const _allCategoriesLabel = 'Todas';
const _runningCategory = 'Corrida e resistencia';

int _totalMinutes(List<Exercise> exercises) {
  return exercises.fold<int>(0, (total, item) => total + item.averageMinutes);
}

bool _supportsPeopleCount(Exercise exercise, int people) {
  final text =
      '${exercise.category} ${exercise.name} ${exercise.description ?? ''}'
          .toLowerCase();
  if (people == 1) {
    return !text.contains('duelo') &&
        !text.contains('jogo reduzido') &&
        exercise.category != 'Volei';
  }
  if (people == 2) {
    return text.contains('duelo') ||
        text.contains('passe') ||
        text.contains('rondo');
  }
  return exercise.category == 'Futebol' || exercise.category == 'Volei';
}

IconData _categoryIcon(String category) {
  return switch (category) {
    'Futebol' => Icons.sports_soccer_rounded,
    'Karate' => Icons.sports_martial_arts_rounded,
    'Corrida e resistencia' => Icons.directions_run_rounded,
    'Forca' => Icons.fitness_center_rounded,
    'Mobilidade' => Icons.self_improvement_rounded,
    'Volei' => Icons.sports_volleyball_rounded,
    'Parkour seguro' => Icons.landscape_rounded,
    _ => Icons.sports_gymnastics_rounded,
  };
}
