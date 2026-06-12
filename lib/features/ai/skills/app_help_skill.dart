import '../ai_models.dart';
import 'ai_skill.dart';

class AppHelpSkill extends AiSkill {
  const AppHelpSkill();

  @override
  String get id => 'app_help';

  @override
  String get name => 'AppHelpSkill';

  @override
  String get description =>
      'Explica o que a IA faz, os comandos e como usar os modulos.';

  @override
  List<AiIntentType> get intents => const [
    AiIntentType.help,
    AiIntentType.explainApp,
    AiIntentType.explainCommands,
  ];

  @override
  List<String> get examples => const [
    'o que voce consegue fazer',
    'como cadastro produto',
    'como registro agua',
  ];

  @override
  List<String> get requiredEntities => const [];

  @override
  List<String> get optionalEntities => const ['topic'];

  @override
  Future<AiExecutionResult> execute(
    AiSkillRuntime runtime,
    AiParsedIntent intent,
  ) {
    final topic = intent.entities['topic']?.toString();
    if (topic == 'product') {
      return Future.value(
        const AiExecutionResult(
          responseText:
              'Voce pode dizer "cadastrar produto Halls" ou mandar os dados direto, como "Halls, 11kcal, 13g acucar". Tambem funciona em varias mensagens.',
          actionType: AiIntentType.explainCommands,
          module: AiModule.assistant,
        ),
      );
    }
    if (topic == 'water') {
      return Future.value(
        const AiExecutionResult(
          responseText:
              'Para registrar agua, escreva algo como "bebi 250ml de agua" ou use /addagua 250ml.',
          actionType: AiIntentType.explainCommands,
          module: AiModule.assistant,
        ),
      );
    }
    return runtime.actions.execute(
      intent.copyWith(type: AiIntentType.help, module: AiModule.assistant),
    );
  }
}
