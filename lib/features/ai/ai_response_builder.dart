import 'ai_models.dart';

class AiResponseBuilder {
  const AiResponseBuilder._();

  static AiExecutionResult buildUnknownSuggestion({
    required String responseText,
    required AiModule module,
    List<AiChatCard> cards = const [],
  }) {
    return AiExecutionResult(
      responseText: responseText,
      actionType: AiIntentType.unknown,
      module: module,
      cards: cards,
    );
  }

  static AiExecutionResult buildWaterClarification({
    required double quantity,
    required String unit,
  }) {
    return AiExecutionResult(
      responseText:
          'Voce quer registrar ${_formatQuantity(quantity, unit)} de agua?',
      actionType: AiIntentType.unknown,
      module: AiModule.hydration,
      cards: [
        AiChatCard(
          type: AiCardType.confirmation,
          title: _formatQuantity(quantity, unit),
          subtitle: 'Escolha o tipo de consumo',
          metadata: {'quantity': quantity.toString(), 'unit': unit},
          actions: const [
            AiCardAction(
              id: 'confirm_water_consumption',
              label: 'Sim, agua',
              isPrimary: true,
            ),
            AiCardAction(id: 'register_other_drink', label: 'Outra bebida'),
            AiCardAction(id: 'cancel_pending', label: 'Cancelar'),
          ],
        ),
      ],
    );
  }

  static String _formatQuantity(double quantity, String unit) {
    final text = quantity % 1 == 0
        ? quantity.toInt().toString()
        : quantity.toStringAsFixed(1);
    return '$text$unit';
  }
}
