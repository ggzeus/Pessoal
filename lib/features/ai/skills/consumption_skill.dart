import '../ai_models.dart';
import 'ai_skill.dart';

class ConsumptionSkill extends AiSkill {
  const ConsumptionSkill();

  @override
  String get id => 'consumption';

  @override
  String get name => 'ConsumptionSkill';

  @override
  String get description =>
      'Registra agua, alimentos, bebidas e produtos consumidos.';

  @override
  List<AiIntentType> get intents => const [
    AiIntentType.registerWaterConsumption,
    AiIntentType.registerFoodConsumption,
    AiIntentType.registerDrinkConsumption,
    AiIntentType.registerProductConsumption,
    AiIntentType.showDailyConsumption,
    AiIntentType.showWaterIntake,
    AiIntentType.showNutritionSummary,
    AiIntentType.showCaloriesToday,
    AiIntentType.showNutrientToday,
    AiIntentType.listTodayConsumption,
  ];

  @override
  List<String> get examples => const [
    'bebi 250ml de agua',
    'comi 2 ovos',
    'tomei whey',
  ];

  @override
  List<String> get requiredEntities => const [];

  @override
  List<String> get optionalEntities => const ['name', 'quantity', 'unit'];

  @override
  Future<AiExecutionResult> execute(
    AiSkillRuntime runtime,
    AiParsedIntent intent,
  ) {
    return runtime.actions.execute(intent);
  }
}
