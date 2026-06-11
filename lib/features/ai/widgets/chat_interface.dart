import 'package:flutter/material.dart';

import '../ai_models.dart';
import 'message_bubble.dart';

class ChatInterface extends StatelessWidget {
  const ChatInterface({
    super.key,
    required this.messages,
    required this.isSending,
    required this.scrollController,
    required this.onCardAction,
  });

  final List<AiChatMessage> messages;
  final bool isSending;
  final ScrollController scrollController;
  final void Function(AiChatCard card, AiCardAction action) onCardAction;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
      itemCount: messages.length + (isSending ? 1 : 0),
      itemBuilder: (context, index) {
        if (isSending && index == messages.length) {
          return const _TypingBubble();
        }
        return MessageBubble(
          message: messages[index],
          onActionTap: onCardAction,
        );
      },
    );
  }
}

class _TypingBubble extends StatelessWidget {
  const _TypingBubble();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: 84,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFF182333),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFF263244)),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_Dot(), _Dot(), _Dot()],
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: const BoxDecoration(
        color: Colors.white60,
        shape: BoxShape.circle,
      ),
    );
  }
}
