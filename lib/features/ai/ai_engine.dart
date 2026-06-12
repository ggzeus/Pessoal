import '../../data/repositories/personal_repository.dart';
import 'ai_actions.dart';
import 'ai_context_manager.dart';
import 'ai_intent_classifier.dart';
import 'ai_models.dart';
import 'ai_parser.dart';
import 'ai_response_builder.dart';
import 'ai_skill_registry.dart';
import 'services/consumption_service.dart';
import 'services/nutrition_calculator.dart';
import 'services/product_service.dart';
import 'services/routine_service.dart';
import 'skills/ai_skill.dart';

class AiEngine {
  AiEngine({
    required PersonalRepository repository,
    required AiParser parser,
    required AiActions actions,
    required AiContextManager contextManager,
    AiSkillRegistry? registry,
    AiIntentClassifier? classifier,
  }) : _actions = actions,
       _contextManager = contextManager,
       _registry = registry ?? AiSkillRegistry(),
       _classifier =
           classifier ?? AiIntentClassifier(parser, ProductService(repository)),
       _runtime = AiSkillRuntime(
         repository: repository,
         parser: parser,
         actions: actions,
         productService: ProductService(repository),
         consumptionService: ConsumptionService(
           repository,
           NutritionCalculator(),
         ),
         routineService: RoutineService(repository),
       );

  final AiActions _actions;
  final AiContextManager _contextManager;
  final AiSkillRegistry _registry;
  final AiIntentClassifier _classifier;
  final AiSkillRuntime _runtime;

  Future<AiConversationState?> loadConversationState() {
    return _contextManager.loadConversationState();
  }

  Future<AiExecutionResult> processMessage(
    String message, {
    AiConversationState? conversationState,
  }) async {
    final activeState =
        conversationState ?? await _contextManager.loadConversationState();

    if (activeState != null) {
      final activeSkill = _registry.findById(activeState.activeSkill);
      final continued = await activeSkill?.continueConversation(
        _runtime,
        activeState,
        message,
      );
      if (continued != null) {
        await _syncConversationState(continued);
        return continued;
      }
    }

    final interpretation = await _classifier.classify(
      message,
      conversationState: activeState,
    );
    return executeIntent(interpretation, conversationState: activeState);
  }

  Future<AiExecutionResult> executeIntent(
    AiParsedIntent interpretation, {
    AiConversationState? conversationState,
  }) async {
    final _ = conversationState;
    if (interpretation.type == AiIntentType.unknown &&
        interpretation.metadata['suggestion'] == 'water_or_drink') {
      final quantity = double.tryParse(
        interpretation.metadata['quantity'] ?? '',
      );
      final unit = interpretation.metadata['unit'] ?? 'ml';
      if (quantity != null) {
        final response = AiResponseBuilder.buildWaterClarification(
          quantity: quantity,
          unit: unit,
        );
        await _syncConversationState(response);
        return response;
      }
    }

    final skill =
        (interpretation.skillId == null
            ? null
            : _registry.findById(interpretation.skillId!)) ??
        _registry.findForIntent(interpretation);

    final result = skill == null
        ? await _actions.execute(interpretation)
        : await skill.execute(_runtime, interpretation);
    await _syncConversationState(result);
    return result;
  }

  Future<void> _syncConversationState(AiExecutionResult result) async {
    if (result.clearConversationState) {
      await _contextManager.clearConversationState();
      return;
    }
    if (result.conversationState != null) {
      await _contextManager.saveConversationState(result.conversationState!);
      return;
    }
  }
}
