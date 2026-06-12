import '../ai_models.dart';
import 'ai_skill.dart';

class RoutineSkill extends AiSkill {
  const RoutineSkill();

  @override
  String get id => 'routine';

  @override
  String get name => 'RoutineSkill';

  @override
  String get description =>
      'Cria rotina, habitos, lembretes recorrentes e conclui itens.';

  @override
  List<AiIntentType> get intents => const [
    AiIntentType.createRoutineItem,
    AiIntentType.updateRoutineItem,
    AiIntentType.listRoutine,
    AiIntentType.completeRoutineItem,
    AiIntentType.deleteRoutineItem,
    AiIntentType.clearRoutine,
  ];

  @override
  List<String> get examples => const [
    'adicione acordar as 06:00 em todos dias da semana',
    'me lembra de estudar todos os dias as 20h',
    'me mostra minha rotina',
  ];

  @override
  List<String> get requiredEntities => const ['title'];

  @override
  List<String> get optionalEntities => const [
    'time',
    'date',
    'recurrence',
    'daysOfWeek',
  ];

  @override
  Future<AiExecutionResult> execute(
    AiSkillRuntime runtime,
    AiParsedIntent intent,
  ) {
    return runtime.actions.execute(intent);
  }
}
