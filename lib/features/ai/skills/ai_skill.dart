import '../../../data/repositories/personal_repository.dart';
import '../ai_actions.dart';
import '../ai_models.dart';
import '../ai_parser.dart';
import '../services/consumption_service.dart';
import '../services/product_service.dart';
import '../services/routine_service.dart';

class AiSkillRuntime {
  const AiSkillRuntime({
    required this.repository,
    required this.parser,
    required this.actions,
    required this.productService,
    required this.consumptionService,
    required this.routineService,
  });

  final PersonalRepository repository;
  final AiParser parser;
  final AiActions actions;
  final ProductService productService;
  final ConsumptionService consumptionService;
  final RoutineService routineService;
}

abstract class AiSkill {
  const AiSkill();

  String get id;

  String get name;

  String get description;

  List<AiIntentType> get intents;

  List<String> get examples;

  List<String> get requiredEntities;

  List<String> get optionalEntities;

  bool canHandle(AiParsedIntent intent) => intents.contains(intent.type);

  Future<AiExecutionResult> execute(
    AiSkillRuntime runtime,
    AiParsedIntent intent,
  );

  Future<AiExecutionResult?> continueConversation(
    AiSkillRuntime runtime,
    AiConversationState state,
    String message,
  ) async {
    return null;
  }
}
