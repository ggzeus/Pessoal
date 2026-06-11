import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../app/theme.dart';
import '../ai_models.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.message,
    required this.onActionTap,
  });

  final AiChatMessage message;
  final void Function(AiChatCard card, AiCardAction action) onActionTap;

  @override
  Widget build(BuildContext context) {
    final isUser = message.sender == AiMessageSender.user;
    final bubbleColor = isUser
        ? const Color(0xFF174F44)
        : const Color(0xFF182333);
    final radius = BorderRadius.only(
      topLeft: const Radius.circular(18),
      topRight: const Radius.circular(18),
      bottomLeft: Radius.circular(isUser ? 18 : 6),
      bottomRight: Radius.circular(isUser ? 6 : 18),
    );

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 0.84,
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.fromLTRB(14, 12, 14, 8),
          decoration: BoxDecoration(
            color: bubbleColor,
            borderRadius: radius,
            border: Border.all(
              color: isUser ? const Color(0xFF2B7D69) : AppTheme.border,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.text,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(height: 1.35),
              ),
              if (message.cards.isNotEmpty) ...[
                const SizedBox(height: 12),
                for (final card in message.cards)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: _AiCardView(
                      card: card,
                      onActionTap: (action) => onActionTap(card, action),
                    ),
                  ),
              ],
              const SizedBox(height: 6),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  DateFormat('HH:mm').format(message.createdAt),
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall?.copyWith(color: Colors.white54),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AiCardView extends StatelessWidget {
  const _AiCardView({required this.card, required this.onActionTap});

  final AiChatCard card;
  final ValueChanged<AiCardAction> onActionTap;

  @override
  Widget build(BuildContext context) {
    final accent = switch (card.type) {
      AiCardType.routine => const Color(0xFF7C8CFF),
      AiCardType.workout => const Color(0xFF55D6BE),
      AiCardType.finance => const Color(0xFFFFC857),
      AiCardType.confirmation => const Color(0xFFFF6B6B),
      AiCardType.note => const Color(0xFF8AA7FF),
      AiCardType.summary => const Color(0xFF8B9CB4),
      AiCardType.product => const Color(0xFF5EC2FF),
      AiCardType.consumption => const Color(0xFF8FE388),
      AiCardType.water => const Color(0xFF4FD7FF),
    };

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF111923),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: accent.withValues(alpha: 0.35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  card.title,
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
                ),
              ),
              if ((card.status ?? '').isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: accent.withValues(alpha: 0.16),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    card.status!,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: accent,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
            ],
          ),
          if ((card.subtitle ?? '').isNotEmpty) ...[
            const SizedBox(height: 6),
            Text(
              card.subtitle!,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.white70),
            ),
          ],
          if (card.details.isNotEmpty) ...[
            const SizedBox(height: 10),
            for (final detail in card.details)
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  detail,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.white70),
                ),
              ),
          ],
          if (card.actions.isNotEmpty) ...[
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final action in card.actions)
                  action.isPrimary
                      ? FilledButton.tonal(
                          onPressed: () => onActionTap(action),
                          child: Text(action.label),
                        )
                      : OutlinedButton(
                          onPressed: () => onActionTap(action),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: action.isDestructive
                                ? AppTheme.danger
                                : null,
                          ),
                          child: Text(action.label),
                        ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
