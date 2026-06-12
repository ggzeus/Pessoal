import '../ai_models.dart';
import 'ai_skill.dart';

class WorkoutSkill extends AiSkill {
  const WorkoutSkill();

  @override
  String get id => 'workout';

  @override
  String get name => 'WorkoutSkill';

  @override
  String get description =>
      'Inicia, lista e organiza treinos e sessoes do app.';

  @override
  List<AiIntentType> get intents => const [
    AiIntentType.startWorkout,
    AiIntentType.finishWorkout,
    AiIntentType.listWorkout,
    AiIntentType.registerExercise,
  ];

  @override
  List<String> get examples => const [
    'iniciar treino de peito',
    'comecar treino',
    'meus treinos',
  ];

  @override
  List<String> get requiredEntities => const [];

  @override
  List<String> get optionalEntities => const ['name'];

  @override
  Future<AiExecutionResult> execute(
    AiSkillRuntime runtime,
    AiParsedIntent intent,
  ) {
    return runtime.actions.execute(intent);
  }
}
