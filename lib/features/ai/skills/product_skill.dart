import '../../../data/local/database/app_database.dart';
import '../ai_models.dart';
import '../services/product_service.dart';
import 'ai_skill.dart';

class ProductSkill extends AiSkill {
  const ProductSkill();

  @override
  String get id => 'product';

  @override
  String get name => 'ProductSkill';

  @override
  String get description =>
      'Cadastra, edita, lista e interpreta produtos com dados nutricionais.';

  @override
  List<AiIntentType> get intents => const [
    AiIntentType.createProduct,
    AiIntentType.updateProduct,
    AiIntentType.listProducts,
    AiIntentType.findProduct,
    AiIntentType.deleteProduct,
    AiIntentType.addProductNutrition,
  ];

  @override
  List<String> get examples => const [
    'cadastrar produto',
    'cadastrar produto halls',
    'halls, 11kcal, 13g de acucar',
    'cadastrar produto whey 120kcal 24g proteina',
  ];

  @override
  List<String> get requiredEntities => const ['name'];

  @override
  List<String> get optionalEntities => const [
    'brand',
    'category',
    'servingSize',
    'servingUnit',
    'calories',
    'protein',
    'carbohydrates',
    'sugars',
    'totalFat',
    'saturatedFat',
    'transFat',
    'fiber',
    'sodium',
    'salt',
    'cholesterol',
    'potassium',
  ];

  @override
  Future<AiExecutionResult> execute(
    AiSkillRuntime runtime,
    AiParsedIntent intent,
  ) async {
    switch (intent.type) {
      case AiIntentType.listProducts:
        return runtime.actions.execute(intent);
      case AiIntentType.findProduct:
        return _findProduct(runtime, intent);
      case AiIntentType.deleteProduct:
        return runtime.actions.execute(intent);
      case AiIntentType.createProduct:
      case AiIntentType.updateProduct:
      case AiIntentType.addProductNutrition:
        return _startOrAdvanceCreate(runtime, intent);
      default:
        return runtime.actions.execute(intent);
    }
  }

  @override
  Future<AiExecutionResult?> continueConversation(
    AiSkillRuntime runtime,
    AiConversationState state,
    String message,
  ) async {
    final normalized = runtime.parser.normalize(message);
    if (normalized == 'cancelar' || normalized == '/cancelar') {
      return const AiExecutionResult(
        responseText: 'Tudo bem, cancelei o fluxo de produto.',
        actionType: AiIntentType.cancelAction,
        module: AiModule.products,
        clearConversationState: true,
        clearPendingProductDraft: true,
      );
    }

    final currentDraft = _draftFromState(state);

    if (state.step == 'awaiting_duplicate_resolution') {
      if (normalized.contains('atualizar')) {
        return _saveDraft(
          runtime,
          currentDraft,
          existingProductId: state.collectedData['existingProductId']
              ?.toString(),
          createNew: false,
        );
      }
      if (normalized.contains('criar novo') || normalized.contains('novo')) {
        return _saveDraft(runtime, currentDraft, createNew: true);
      }
    }

    if (_isContinueMessage(normalized)) {
      if (!currentDraft.hasName) {
        return _askForName(currentDraft);
      }
      return AiExecutionResult(
        responseText:
            'Perfeito. Me envie os dados que faltam, como porcao, calorias, proteinas, carboidratos, acucar, gorduras, fibras, sodio ou sal. Quando quiser, tambem pode dizer "salvar assim".',
        actionType: AiIntentType.createProduct,
        module: AiModule.products,
        conversationState: _stateFromDraft(
          currentDraft,
          step: 'collecting_product_data',
          waitingFor: 'product_nutrition',
          missingFields: const [],
          expectingAdditionalData: true,
        ),
        cards: const [
          AiChatCard(
            type: AiCardType.product,
            title: 'Completar produto',
            subtitle: 'Voce pode enviar os nutrientes em partes.',
            actions: [
              AiCardAction(
                id: 'save_product_draft',
                label: 'Salvar assim',
                isPrimary: true,
              ),
              AiCardAction(id: 'cancel_pending', label: 'Cancelar'),
            ],
          ),
        ],
      );
    }

    if (_isSaveMessage(normalized)) {
      return _saveDraft(runtime, currentDraft);
    }

    if (_isSkipMessage(normalized)) {
      if (currentDraft.hasName) {
        return _buildSaveOrCompleteResult(
          currentDraft,
          step: 'confirm_partial_product',
        );
      }
      return _askForName(currentDraft);
    }

    final parsedDraft = runtime.productService.parseDraftFromMessage(
      message,
      fallbackName: currentDraft.name,
    );
    final mergedDraft = currentDraft.merge(parsedDraft);

    if (!mergedDraft.hasName) {
      return _askForName(mergedDraft);
    }

    if (mergedDraft.hasAnyNutrition) {
      return _buildSaveOrCompleteResult(
        mergedDraft,
        step: 'confirm_partial_product',
      );
    }

    return AiExecutionResult(
      responseText:
          'Beleza. Produto ${mergedDraft.name}. Se quiser, me diga calorias, acucar, proteinas, carboidratos, gorduras, sodio, porcao ou diga "salvar assim".',
      actionType: AiIntentType.createProduct,
      module: AiModule.products,
      conversationState: _stateFromDraft(
        mergedDraft,
        step: 'collecting_product_data',
        waitingFor: 'product_nutrition',
        missingFields: const [],
      ),
      cards: const [
        AiChatCard(
          type: AiCardType.confirmation,
          title: 'Produto em andamento',
          subtitle: 'Voce pode completar os dados ou salvar assim.',
          actions: [
            AiCardAction(
              id: 'save_product_draft',
              label: 'Salvar assim',
              isPrimary: true,
            ),
            AiCardAction(id: 'cancel_pending', label: 'Cancelar'),
          ],
        ),
      ],
    );
  }

  Future<AiExecutionResult> _startOrAdvanceCreate(
    AiSkillRuntime runtime,
    AiParsedIntent intent,
  ) async {
    final draftFromIntent = runtime.productService.parseDraftFromMessage(
      intent.originalMessage,
      fallbackName: intent.title,
    );
    final draft = draftFromIntent.merge(_draftFromEntities(intent.entities));

    if (!draft.hasAnyData || !draft.hasName) {
      return _askForName(draft);
    }

    if (intent.shouldAskConfirmation) {
      return _buildAmbiguousProductResult(draft);
    }

    if (draft.hasAnyNutrition && intent.confidence >= 0.8) {
      return _saveDraft(runtime, draft);
    }

    if (draft.hasAnyNutrition) {
      return _buildSaveOrCompleteResult(draft, step: 'confirm_partial_product');
    }

    return AiExecutionResult(
      responseText:
          'Produto ${draft.name} iniciado. Me informe calorias, acucar, proteinas, carboidratos, gorduras, sodio e porcao quando quiser.',
      actionType: AiIntentType.createProduct,
      module: AiModule.products,
      conversationState: _stateFromDraft(
        draft,
        step: 'collecting_product_data',
        waitingFor: 'product_nutrition',
        missingFields: const [],
      ),
      cards: const [
        AiChatCard(
          type: AiCardType.product,
          title: 'Cadastro de produto',
          subtitle: 'Envie os dados por partes ou diga "salvar assim".',
          actions: [AiCardAction(id: 'cancel_pending', label: 'Cancelar')],
        ),
      ],
    );
  }

  Future<AiExecutionResult> _findProduct(
    AiSkillRuntime runtime,
    AiParsedIntent intent,
  ) async {
    final query = intent.title ?? intent.query ?? intent.originalMessage;
    final matches = await runtime.productService.searchProducts(query);
    if (matches.isEmpty) {
      return const AiExecutionResult(
        responseText: 'Nao encontrei esse produto cadastrado.',
        actionType: AiIntentType.findProduct,
        module: AiModule.products,
      );
    }

    return AiExecutionResult(
      responseText: 'Encontrei estes produtos.',
      actionType: AiIntentType.findProduct,
      module: AiModule.products,
      cards: [
        for (final product in matches.take(4))
          AiChatCard(
            type: AiCardType.product,
            title: product.name,
            subtitle: product.brand ?? product.category ?? 'Produto',
            details: [
              'Calorias: ${_formatNumber(product.calories)} kcal',
              'Acucares: ${_formatNumber(product.sugars)} g',
            ],
            metadata: {'productId': product.id},
            actions: const [
              AiCardAction(
                id: 'consume_matched_product',
                label: 'Consumir',
                isPrimary: true,
              ),
              AiCardAction(id: 'nav:/products', label: 'Editar'),
            ],
          ),
      ],
    );
  }

  Future<AiExecutionResult> _saveDraft(
    AiSkillRuntime runtime,
    ProductDraftData draft, {
    String? existingProductId,
    bool createNew = false,
  }) async {
    if (!draft.hasName) {
      return _askForName(draft);
    }

    Product? existing;
    if (!createNew) {
      existing = existingProductId == null
          ? await runtime.productService.findExactProduct(draft.name!)
          : await runtime.repository.loadProductById(existingProductId);
    }

    if (existing != null && existingProductId == null && !createNew) {
      return AiExecutionResult(
        responseText:
            'Ja existe um produto chamado ${draft.name}. Voce quer atualizar ele ou criar outro?',
        actionType: AiIntentType.updateProduct,
        module: AiModule.products,
        conversationState: _stateFromDraft(
          draft,
          step: 'awaiting_duplicate_resolution',
          waitingFor: 'duplicate_resolution',
          missingFields: const [],
          extraData: {'existingProductId': existing.id},
        ),
        cards: const [
          AiChatCard(
            type: AiCardType.confirmation,
            title: 'Produto ja existente',
            subtitle: 'Escolha o que deseja fazer.',
            actions: [
              AiCardAction(
                id: 'update_existing_pending_product',
                label: 'Atualizar',
                isPrimary: true,
              ),
              AiCardAction(
                id: 'create_new_pending_product',
                label: 'Criar novo',
              ),
              AiCardAction(id: 'cancel_pending', label: 'Cancelar'),
            ],
          ),
        ],
      );
    }

    final saved = await runtime.productService.createOrUpdateFromDraft(
      draft,
      existing: existing,
    );
    return AiExecutionResult(
      responseText: 'Produto cadastrado: ${saved.name}.',
      actionType: existing == null
          ? AiIntentType.createProduct
          : AiIntentType.updateProduct,
      module: AiModule.products,
      clearConversationState: true,
      clearPendingProductDraft: true,
      cards: [
        AiChatCard(
          type: AiCardType.product,
          title: saved.name,
          subtitle: saved.brand ?? saved.category ?? 'Produto',
          details: [
            'Porcao: ${_formatNumber(saved.servingSize)}${saved.servingUnit}',
            if (saved.calories > 0)
              'Calorias: ${_formatNumber(saved.calories)} kcal',
            if (saved.protein > 0)
              'Proteinas: ${_formatNumber(saved.protein)} g',
            if (saved.carbohydrates > 0)
              'Carboidratos: ${_formatNumber(saved.carbohydrates)} g',
            if (saved.sugars > 0) 'Acucares: ${_formatNumber(saved.sugars)} g',
            if (saved.sodium > 0) 'Sodio: ${_formatNumber(saved.sodium)} mg',
          ],
          metadata: {'productId': saved.id},
          actions: const [
            AiCardAction(
              id: 'consume_matched_product',
              label: 'Consumir',
              isPrimary: true,
            ),
            AiCardAction(id: 'nav:/products', label: 'Editar'),
          ],
        ),
      ],
    );
  }

  AiExecutionResult _askForName(ProductDraftData draft) {
    return AiExecutionResult(
      responseText:
          'Claro. Me diga o nome do produto e, se souber, os dados nutricionais.',
      actionType: AiIntentType.createProduct,
      module: AiModule.products,
      conversationState: _stateFromDraft(
        draft,
        step: 'collecting_product_data',
        waitingFor: 'product_name',
        missingFields: const ['name'],
      ),
      cards: const [
        AiChatCard(
          type: AiCardType.confirmation,
          title: 'Cadastro de produto',
          subtitle: 'Envie o nome e, se quiser, calorias ou nutrientes.',
          actions: [AiCardAction(id: 'cancel_pending', label: 'Cancelar')],
        ),
      ],
    );
  }

  AiExecutionResult _buildSaveOrCompleteResult(
    ProductDraftData draft, {
    required String step,
  }) {
    return AiExecutionResult(
      responseText:
          'Entendi. ${_safeSummary(draft)}. Quer salvar assim ou completar os outros dados?',
      actionType: AiIntentType.createProduct,
      module: AiModule.products,
      conversationState: _stateFromDraft(
        draft,
        step: step,
        waitingFor: 'product_confirmation',
        missingFields: const [],
        expectingConfirmation: true,
        expectingAdditionalData: true,
      ),
      cards: const [
        AiChatCard(
          type: AiCardType.confirmation,
          title: 'Produto em andamento',
          subtitle: 'Voce pode salvar com dados parciais ou completar agora.',
          actions: [
            AiCardAction(
              id: 'save_product_draft',
              label: 'Salvar assim',
              isPrimary: true,
            ),
            AiCardAction(
              id: 'complete_product_draft',
              label: 'Completar dados',
            ),
            AiCardAction(id: 'cancel_pending', label: 'Cancelar'),
          ],
        ),
      ],
    );
  }

  AiExecutionResult _buildAmbiguousProductResult(ProductDraftData draft) {
    final quantity = draft.servingSize ?? 1;
    final unit = draft.servingUnit ?? 'unidade';
    return AiExecutionResult(
      responseText:
          'Entendi ${_safeSummary(draft)}. Voce quer cadastrar isso como produto ou registrar consumo?',
      actionType: AiIntentType.createProduct,
      module: AiModule.products,
      cards: [
        AiChatCard(
          type: AiCardType.confirmation,
          title: draft.name ?? 'Produto',
          subtitle: 'Escolha o que deseja fazer.',
          metadata: {
            'productName': draft.name ?? '',
            'quantity': quantity.toString(),
            'unit': unit,
          },
          actions: const [
            AiCardAction(
              id: 'create_ambiguous_product',
              label: 'Cadastrar produto',
              isPrimary: true,
            ),
            AiCardAction(
              id: 'register_ambiguous_product',
              label: 'Registrar consumo',
            ),
            AiCardAction(id: 'cancel_pending', label: 'Cancelar'),
          ],
        ),
      ],
    );
  }

  AiConversationState _stateFromDraft(
    ProductDraftData draft, {
    required String step,
    required String waitingFor,
    required List<String> missingFields,
    bool expectingConfirmation = false,
    bool expectingAdditionalData = false,
    Map<String, Object?> extraData = const {},
  }) {
    return AiConversationState(
      activeSkill: id,
      pendingIntent: AiIntentType.createProduct,
      step: step,
      collectedData: {...draft.toJson(), ...extraData},
      missingFields: missingFields,
      waitingFor: waitingFor,
      lastAssistantMessage: null,
      createdAt: DateTime.now(),
      expectingConfirmation: expectingConfirmation,
      expectingAdditionalData: expectingAdditionalData,
    );
  }

  ProductDraftData _draftFromEntities(Map<String, Object?> entities) {
    if (entities.isEmpty) {
      return const ProductDraftData();
    }
    return ProductDraftData.fromJson(entities);
  }

  ProductDraftData _draftFromState(AiConversationState state) {
    return ProductDraftData.fromJson(state.collectedData);
  }

  bool _isSaveMessage(String normalized) {
    return normalized == 'salvar' ||
        normalized == '/salvar' ||
        normalized == 'salvar assim' ||
        normalized == 'save';
  }

  bool _isContinueMessage(String normalized) {
    return normalized == 'continuar' || normalized == 'completar dados';
  }

  bool _isSkipMessage(String normalized) {
    return normalized == 'nao sei' || normalized == 'pular';
  }

  String _safeSummary(ProductDraftData draft) {
    final summary = [
      if (draft.name != null) 'Produto ${draft.name}',
      if (draft.calories != null) 'com ${_formatNumber(draft.calories!)} kcal',
      if (draft.sugars != null) 'e ${_formatNumber(draft.sugars!)}g de acucar',
      if (draft.protein != null)
        'e ${_formatNumber(draft.protein!)}g de proteina',
      if (draft.carbohydrates != null)
        'e ${_formatNumber(draft.carbohydrates!)}g de carboidratos',
    ].join(' ');
    return summary.trim();
  }

  String _formatNumber(double value) {
    return value % 1 == 0 ? value.toInt().toString() : value.toStringAsFixed(1);
  }
}
