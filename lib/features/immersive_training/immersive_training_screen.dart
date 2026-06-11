import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/theme.dart';
import '../../core/widgets/async_state_view.dart';
import '../../core/widgets/section_card.dart';
import '../../data/local/database/app_database.dart';
import '../../data/repositories/providers.dart';
import '../training/exercise_demo.dart';
import '../training/workout_plan.dart';

class ImmersiveTrainingScreen extends ConsumerStatefulWidget {
  const ImmersiveTrainingScreen({super.key, this.plan});

  final WorkoutPlan? plan;

  @override
  ConsumerState<ImmersiveTrainingScreen> createState() =>
      _ImmersiveTrainingScreenState();
}

class _ImmersiveTrainingScreenState
    extends ConsumerState<ImmersiveTrainingScreen> {
  Timer? _timer;
  int _seconds = 60;
  int _stepIndex = 0;
  bool _running = false;

  List<Exercise> get _exercises => widget.plan?.exercises ?? const [];

  Exercise? get _currentExercise {
    if (_exercises.isEmpty) return null;
    return _exercises[_stepIndex.clamp(0, _exercises.length - 1)];
  }

  @override
  void initState() {
    super.initState();
    _seconds = _durationFor(_currentExercise);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _toggle() {
    if (_running) {
      _timer?.cancel();
      setState(() => _running = false);
      return;
    }
    setState(() => _running = true);
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_seconds <= 1) {
        _advanceStep();
      } else {
        setState(() => _seconds--);
      }
    });
  }

  void _advanceStep() {
    if (_stepIndex + 1 >= _exercises.length) {
      _timer?.cancel();
      setState(() {
        _running = false;
        _seconds = 0;
      });
      return;
    }

    setState(() {
      _stepIndex++;
      _seconds = _durationFor(_currentExercise);
    });
  }

  @override
  Widget build(BuildContext context) {
    final dashboard = ref.watch(dashboardProvider);
    final current = _currentExercise;
    final plan = widget.plan;
    return Scaffold(
      appBar: AppBar(title: const Text('Modo imersivo')),
      body: AsyncStateView(
        value: dashboard,
        builder: (data) {
          final title =
              plan?.name ?? data.pendingWorkout?.name ?? 'Treino completo';
          final objective =
              plan?.objective ??
              data.pendingWorkout?.objective ??
              'Sessao guiada com foco total.';
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              SectionCard(
                padding: const EdgeInsets.all(22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(height: 8),
                    Text(objective),
                    const SizedBox(height: 16),
                    Text(
                      'Exercicio atual',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      current?.name ?? 'Prancha',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    if (current != null) ...[
                      const SizedBox(height: 16),
                      ExerciseDemonstrationSection(
                        exercise: current,
                        compact: true,
                      ),
                    ],
                    const SizedBox(height: 16),
                    Center(
                      child: Container(
                        width: 180,
                        height: 180,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppTheme.primary.withValues(alpha: 0.12),
                          border: Border.all(
                            color: AppTheme.primary.withValues(alpha: 0.5),
                            width: 2,
                          ),
                        ),
                        child: Text(
                          _clock(_seconds),
                          style: Theme.of(context).textTheme.displaySmall
                              ?.copyWith(fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(_statusLine(current)),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: FilledButton.icon(
                            onPressed: _toggle,
                            icon: Icon(
                              _running
                                  ? Icons.pause_rounded
                                  : Icons.play_arrow_rounded,
                            ),
                            label: Text(_running ? 'Pausar' : 'Iniciar'),
                          ),
                        ),
                        const SizedBox(width: 10),
                        IconButton.filledTonal(
                          tooltip: 'Proximo exercicio',
                          onPressed: _advanceStep,
                          icon: const Icon(Icons.skip_next_rounded),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              if (current != null)
                SectionCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Instrucao',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(height: 8),
                      Text(detailedExerciseGuide(current)),
                    ],
                  ),
                ),
              if (_exercises.length > 1) ...[
                const SizedBox(height: 12),
                SectionCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sequencia',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(height: 8),
                      for (final entry in _exercises.indexed)
                        ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(
                            entry.$1 == _stepIndex
                                ? Icons.radio_button_checked_rounded
                                : Icons.radio_button_off_rounded,
                          ),
                          title: Text(entry.$2.name),
                          subtitle: Text(
                            '${entry.$2.category} - ${entry.$2.averageMinutes} min',
                          ),
                        ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 12),
              const SectionCard(
                child: Text(
                  'Seguranca: use progressao baixa, controle corporal e interrompa se houver dor, tontura ou desconforto forte.',
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

int _durationFor(Exercise? exercise) {
  if (exercise == null) return 60;
  return exercise.averageMinutes.clamp(1, 60).toInt() * 60;
}

String _clock(int seconds) {
  final safeSeconds = seconds < 0 ? 0 : seconds;
  return '${(safeSeconds ~/ 60).toString().padLeft(2, '0')}:${(safeSeconds % 60).toString().padLeft(2, '0')}';
}

String _statusLine(Exercise? exercise) {
  if (exercise == null) {
    return 'Series: 3  |  Descanso: 45s  |  Proximo: mobilidade de quadril';
  }
  return '${exercise.category}  |  ${exercise.level}  |  descanso sugerido: 45s';
}

// ignore: unused_element
String _immersiveDemonstrationFor(Exercise exercise) {
  return switch (exercise.category) {
    'Corrida e resistencia' =>
      'Aqueca, mantenha postura alta e registre tempo, distancia e ritmo pelo Health quando HealthKit ou Health Connect estiver ativo.',
    'Karate' =>
      'Execute primeiro devagar, confira base, guarda, quadril e retorno. Aumente ritmo sem perder alinhamento.',
    'Futebol' =>
      'Prepare bola, cones ou alvo. Faça repeticoes curtas, controle o toque e aumente velocidade apenas com dominio.',
    'Forca' =>
      'Controle a descida, estabilize tronco e finalize cada repeticao antes de acelerar.',
    _ =>
      'Comece em ritmo baixo, confira postura e mantenha controle durante todo o bloco.',
  };
}
