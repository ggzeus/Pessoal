import '../ai_models.dart';
import 'ai_skill.dart';

class FinanceSkill extends AiSkill {
  const FinanceSkill();

  @override
  String get id => 'finance';

  @override
  String get name => 'FinanceSkill';

  @override
  String get description =>
      'Registra entradas, saidas, saldo e historico financeiro.';

  @override
  List<AiIntentType> get intents => const [
    AiIntentType.createFinanceRecord,
    AiIntentType.createFinanceIncome,
    AiIntentType.createFinanceExpense,
    AiIntentType.listFinance,
    AiIntentType.showBalance,
  ];

  @override
  List<String> get examples => const [
    'gastei 35 no mercado',
    'recebi 1500 do salario',
    'meu saldo',
  ];

  @override
  List<String> get requiredEntities => const ['amount'];

  @override
  List<String> get optionalEntities => const ['description', 'category'];

  @override
  Future<AiExecutionResult> execute(
    AiSkillRuntime runtime,
    AiParsedIntent intent,
  ) {
    return runtime.actions.execute(intent);
  }
}
