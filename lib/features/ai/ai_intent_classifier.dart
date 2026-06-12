import 'ai_models.dart';
import 'ai_parser.dart';
import 'services/product_service.dart';

class AiIntentClassifier {
  AiIntentClassifier(this._parser, this._productService);

  final AiParser _parser;
  final ProductService _productService;

  Future<AiParsedIntent> classify(
    String message, {
    AiConversationState? conversationState,
  }) async {
    final normalized = _parser.normalize(message);

    if (_isSaveMessage(normalized)) {
      return AiParsedIntent(
        type: AiIntentType.savePendingAction,
        module: AiModule.assistant,
        originalMessage: message,
        confidence: 1,
      );
    }

    if (_isCancelMessage(normalized)) {
      return AiParsedIntent(
        type: AiIntentType.cancelAction,
        module: AiModule.assistant,
        originalMessage: message,
        confidence: 1,
      );
    }

    if (conversationState?.activeSkill == 'product') {
      final existingName = conversationState?.collectedData['name']?.toString();
      final draft = _productService.parseDraftFromMessage(
        message,
        fallbackName: existingName,
      );
      if (draft.hasAnyData || _isFlowControlMessage(normalized)) {
        return AiParsedIntent(
          type: AiIntentType.createProduct,
          module: AiModule.products,
          originalMessage: message,
          title: draft.name ?? existingName,
          skillId: 'product',
          confidence: 0.95,
          entities: draft.toJson(),
          missingFields: draft.missingPrimaryFields(),
          shouldContinueFlow: true,
        );
      }
    }

    if (normalized.contains('como cadastro produto')) {
      return AiParsedIntent(
        type: AiIntentType.explainCommands,
        module: AiModule.assistant,
        originalMessage: message,
        skillId: 'app_help',
        confidence: 0.95,
        entities: const {'topic': 'product'},
      );
    }

    if (normalized.contains('como registro agua')) {
      return AiParsedIntent(
        type: AiIntentType.explainCommands,
        module: AiModule.assistant,
        originalMessage: message,
        skillId: 'app_help',
        confidence: 0.95,
        entities: const {'topic': 'water'},
      );
    }

    final base = _parser.parseNatural(message);
    if (base.type != AiIntentType.unknown) {
      if (base.type == AiIntentType.createProduct) {
        final draft = _productService.parseDraftFromMessage(
          message,
          fallbackName: base.title,
        );
        return base.copyWith(
          skillId: 'product',
          confidence: draft.hasAnyNutrition ? 0.92 : 0.82,
          entities: draft.toJson(),
          missingFields: draft.missingPrimaryFields(),
        );
      }

      if (base.type == AiIntentType.registerProductConsumption ||
          base.type == AiIntentType.registerWaterConsumption ||
          base.type == AiIntentType.registerDrinkConsumption) {
        return base.copyWith(skillId: 'consumption', confidence: 0.88);
      }

      // Para registerFoodConsumption, tenta encontrar o produto no banco primeiro
      if (base.type == AiIntentType.registerFoodConsumption) {
        return base.copyWith(skillId: 'consumption', confidence: 0.75);
      }

      if (base.type == AiIntentType.createRoutineItem ||
          base.type == AiIntentType.listRoutine) {
        return base.copyWith(skillId: 'routine', confidence: 0.9);
      }

      if (base.type == AiIntentType.startWorkout ||
          base.type == AiIntentType.listWorkout) {
        return base.copyWith(skillId: 'workout', confidence: 0.9);
      }

      if (base.type == AiIntentType.createFinanceRecord ||
          base.type == AiIntentType.listFinance) {
        return base.copyWith(skillId: 'finance', confidence: 0.9);
      }

      if (base.type == AiIntentType.createTask ||
          base.type == AiIntentType.createNote) {
        return base.copyWith(skillId: 'task', confidence: 0.85);
      }

      if (base.type == AiIntentType.listHistory) {
        return base.copyWith(skillId: 'history', confidence: 0.9);
      }

      if (base.type == AiIntentType.help) {
        return base.copyWith(skillId: 'app_help', confidence: 0.95);
      }

      if (base.type == AiIntentType.showCaloriesToday ||
          base.type == AiIntentType.showNutrientToday ||
          base.type == AiIntentType.listTodayConsumption) {
        return base.copyWith(skillId: 'consumption', confidence: 0.95);
      }

      return base.copyWith(confidence: 0.8);
    }

    final productDraft = _productService.parseDraftFromMessage(message);
    if (productDraft.hasName && productDraft.hasAnyNutrition) {
      return AiParsedIntent(
        type: AiIntentType.createProduct,
        module: AiModule.products,
        originalMessage: message,
        title: productDraft.name,
        skillId: 'product',
        confidence: 0.65,
        entities: productDraft.toJson(),
        missingFields: productDraft.missingPrimaryFields(),
        shouldAskConfirmation: true,
      );
    }

    if (normalized.contains('bebi')) {
      final quantity = _parser.extractQuantity(message);
      if (quantity != null) {
        return AiParsedIntent(
          type: AiIntentType.unknown,
          module: AiModule.hydration,
          originalMessage: message,
          quantity: quantity.quantity,
          unit: quantity.unit,
          confidence: 0.6,
          metadata: {
            'suggestion': 'water_or_drink',
            'quantity': quantity.quantity.toString(),
            'unit': quantity.unit,
          },
        );
      }
    }

    return base.copyWith(confidence: 0.3);
  }

  bool _isSaveMessage(String normalized) {
    return normalized == 'salvar' ||
        normalized == '/salvar' ||
        normalized == 'salvar assim';
  }

  bool _isCancelMessage(String normalized) {
    return normalized == 'cancelar' || normalized == '/cancelar';
  }

  bool _isFlowControlMessage(String normalized) {
    return _isSaveMessage(normalized) ||
        _isCancelMessage(normalized) ||
        normalized == 'continuar' ||
        normalized == 'pular' ||
        normalized == 'nao sei' ||
        normalized == 'editar' ||
        normalized == 'corrigir';
  }
}
