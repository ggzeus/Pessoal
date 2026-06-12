import '../ai_models.dart';
import 'ai_skill.dart';

class TaskSkill extends AiSkill {
  const TaskSkill();

  @override
  String get id => 'task';

  @override
  String get name => 'TaskSkill';

  @override
  String get description =>
      'Cria tarefas simples, anotacoes e conclui pendencias.';

  @override
  List<AiIntentType> get intents => const [
    AiIntentType.createTask,
    AiIntentType.listTasks,
    AiIntentType.completeTask,
    AiIntentType.createNote,
  ];

  @override
  List<String> get examples => const [
    'adicionar tarefa estudar matematica hoje 20h',
    'anota isso',
  ];

  @override
  List<String> get requiredEntities => const ['title'];

  @override
  List<String> get optionalEntities => const ['date', 'time', 'description'];

  @override
  Future<AiExecutionResult> execute(
    AiSkillRuntime runtime,
    AiParsedIntent intent,
  ) {
    return runtime.actions.execute(intent);
  }
}
