import '../ai_models.dart';
import 'ai_skill.dart';

class HistorySkill extends AiSkill {
  const HistorySkill();

  @override
  String get id => 'history';

  @override
  String get name => 'HistorySkill';

  @override
  String get description => 'Mostra historico geral e historico recente da IA.';

  @override
  List<AiIntentType> get intents => const [
    AiIntentType.listHistory,
    AiIntentType.listAiHistory,
    AiIntentType.clearHistory,
  ];

  @override
  List<String> get examples => const ['me mostra meu historico', '/historico'];

  @override
  List<String> get requiredEntities => const [];

  @override
  List<String> get optionalEntities => const ['module'];

  @override
  Future<AiExecutionResult> execute(
    AiSkillRuntime runtime,
    AiParsedIntent intent,
  ) {
    return runtime.actions.execute(intent);
  }
}
