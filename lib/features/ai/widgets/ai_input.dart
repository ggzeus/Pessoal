import 'package:flutter/material.dart';

class AiInput extends StatelessWidget {
  const AiInput({
    super.key,
    required this.controller,
    required this.isSending,
    required this.onSend,
  });

  final TextEditingController controller;
  final bool isSending;
  final Future<void> Function() onSend;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            onPressed: null,
            tooltip: 'Microfone em breve',
            icon: const Icon(Icons.mic_none_rounded),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: TextField(
              controller: controller,
              minLines: 1,
              maxLines: 4,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => onSend(),
              decoration: const InputDecoration(
                hintText: 'Digite algo como: coloca treino amanhã às 18h',
              ),
            ),
          ),
          const SizedBox(width: 10),
          IconButton.filled(
            onPressed: isSending ? null : onSend,
            tooltip: 'Enviar',
            icon: isSending
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.send_rounded),
          ),
        ],
      ),
    );
  }
}
