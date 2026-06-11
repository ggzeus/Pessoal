import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme.dart';
import '../../core/constants/app_constants.dart';
import '../training/workout_plan.dart';
import 'ai_controller.dart';
import 'ai_models.dart';
import 'widgets/ai_input.dart';
import 'widgets/chat_interface.dart';

class AiPage extends ConsumerStatefulWidget {
  const AiPage({super.key});

  @override
  ConsumerState<AiPage> createState() => _AiPageState();
}

class _AiPageState extends ConsumerState<AiPage> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(aiControllerProvider, (previous, next) {
      final previousCount = previous?.asData?.value.messages.length ?? 0;
      final nextCount = next.asData?.value.messages.length ?? 0;
      if (nextCount > previousCount) {
        WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
      }
    });

    final chat = ref.watch(aiControllerProvider);

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF091018), Color(0xFF0C1520), Color(0xFF111C2A)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const _Header(),
              Expanded(
                child: chat.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (_, _) => const Center(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Text(
                        'Nao foi possivel carregar a central da IA agora.',
                      ),
                    ),
                  ),
                  data: (state) => Column(
                    children: [
                      if (state.messages.length <= 1)
                        _QuickSuggestions(onSuggestionTap: _sendSuggestion),
                      Expanded(
                        child: ChatInterface(
                          messages: state.messages,
                          isSending: state.isSending,
                          scrollController: _scrollController,
                          onCardAction: _handleCardAction,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AiInput(
                controller: _controller,
                isSending: chat.asData?.value.isSending ?? false,
                onSend: _handleSend,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleSend() async {
    final message = _controller.text.trim();
    if (message.isEmpty) {
      return;
    }
    _controller.clear();
    await ref.read(aiControllerProvider.notifier).sendMessage(message);
  }

  Future<void> _sendSuggestion(String text) async {
    await ref.read(aiControllerProvider.notifier).sendMessage(text);
  }

  Future<void> _handleCardAction(AiChatCard card, AiCardAction action) async {
    if (action.id.startsWith('nav:')) {
      context.go(action.id.replaceFirst('nav:', ''));
      return;
    }

    if (action.id == 'open_immersive') {
      final duration =
          int.tryParse(card.metadata['durationMinutes'] ?? '') ?? 30;
      final plan = WorkoutPlan(
        name: card.metadata['planName'] ?? card.title,
        objective:
            card.metadata['planObjective'] ??
            card.subtitle ??
            'Treino iniciado pela IA.',
        exercises: const [],
        durationMinutes: duration,
      );
      context.push('/immersive', extra: plan);
      return;
    }

    await ref
        .read(aiControllerProvider.notifier)
        .handleCardAction(card, action);
  }

  void _scrollToBottom() {
    if (!_scrollController.hasClients) {
      return;
    }
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'IA',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 4),
                Text(
                  'Sua central inteligente • ${AppConstants.userName}',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.white70),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: AppTheme.primary.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(
                color: AppTheme.primary.withValues(alpha: 0.25),
              ),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.circle, size: 10, color: AppTheme.primary),
                SizedBox(width: 8),
                Text('Online'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickSuggestions extends StatelessWidget {
  const _QuickSuggestions({required this.onSuggestionTap});

  final ValueChanged<String> onSuggestionTap;

  @override
  Widget build(BuildContext context) {
    final suggestions = [
      'Adicionar algo à rotina',
      'Iniciar treino',
      'Ver tarefas de hoje',
      'Registrar gasto',
      'Ver histórico',
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final suggestion in suggestions)
              ActionChip(
                label: Text(suggestion),
                onPressed: () => onSuggestionTap(suggestion),
              ),
          ],
        ),
      ),
    );
  }
}
