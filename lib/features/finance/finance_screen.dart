import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../app/theme.dart';
import '../../data/repositories/providers.dart';
import 'chat/finance_chat_controller.dart';
import 'chat/finance_chat_models.dart';

class FinanceScreen extends ConsumerStatefulWidget {
  const FinanceScreen({super.key});

  @override
  ConsumerState<FinanceScreen> createState() => _FinanceScreenState();
}

class _FinanceScreenState extends ConsumerState<FinanceScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(financeChatControllerProvider, (previous, next) {
      final previousCount = previous?.asData?.value.messages.length ?? 0;
      final nextCount = next.asData?.value.messages.length ?? 0;
      if (nextCount > previousCount) {
        WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
      }
    });

    final chatState = ref.watch(financeChatControllerProvider);
    final dashboard = ref.watch(dashboardProvider);
    final fixedExpenses = ref.watch(fixedExpensesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Financas')),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0A1018), Color(0xFF0D1622), Color(0xFF101C2A)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _FinanceHeader(
                dashboard: dashboard,
                fixedExpenses: fixedExpenses,
                onQuickExpense: () =>
                    _showFinanceDialog(context, ref, expense: true),
                onQuickIncome: () =>
                    _showFinanceDialog(context, ref, expense: false),
                onAddFixed: () => _showFixedDialog(context, ref),
                overview: chatState.asData?.value.overview,
              ),
              Expanded(
                child: chatState.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, _) => Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text(
                        'Nao foi possivel carregar o chat financeiro agora.',
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  data: (state) => _ChatTimeline(
                    state: state,
                    scrollController: _scrollController,
                  ),
                ),
              ),
              _QuickCommandBar(onCommandTap: _handleQuickCommand),
              _Composer(
                controller: _messageController,
                isSending: chatState.asData?.value.isSending ?? false,
                onSend: _handleSend,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleSend() async {
    final message = _messageController.text.trim();
    if (message.isEmpty) return;
    _messageController.clear();
    await ref.read(financeChatControllerProvider.notifier).sendMessage(message);
  }

  Future<void> _handleQuickCommand(String command) async {
    await ref.read(financeChatControllerProvider.notifier).sendMessage(command);
  }

  void _scrollToBottom() {
    if (!_scrollController.hasClients) return;
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
    );
  }
}

class _FinanceHeader extends StatelessWidget {
  const _FinanceHeader({
    required this.dashboard,
    required this.fixedExpenses,
    required this.onQuickExpense,
    required this.onQuickIncome,
    required this.onAddFixed,
    required this.overview,
  });

  final AsyncValue<dynamic> dashboard;
  final AsyncValue<dynamic> fixedExpenses;
  final VoidCallback onQuickExpense;
  final VoidCallback onQuickIncome;
  final VoidCallback onAddFixed;
  final FinanceOverview? overview;

  @override
  Widget build(BuildContext context) {
    final money = NumberFormat.currency(locale: 'pt_BR', symbol: r'R$');

    return Container(
      margin: const EdgeInsets.fromLTRB(12, 8, 12, 10),
      decoration: BoxDecoration(
        color: const Color(0xCC141D2A),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppTheme.border),
        boxShadow: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          title: Text(
            'Chat financeiro',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              overview == null
                  ? 'Carregando saldo atual...'
                  : 'Saldo atual: ${money.format(overview!.balance)}',
            ),
          ),
          children: [
            Row(
              children: [
                Expanded(
                  child: _MetricPill(
                    label: 'Entradas',
                    value: dashboard.when(
                      data: (data) => money.format(data.monthIncome),
                      loading: () => '...',
                      error: (_, _) => '--',
                    ),
                    color: const Color(0xFF53D1A8),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _MetricPill(
                    label: 'Saidas',
                    value: dashboard.when(
                      data: (data) => money.format(data.monthExpense),
                      loading: () => '...',
                      error: (_, _) => '--',
                    ),
                    color: const Color(0xFFFF8A70),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _MetricPill(
                    label: 'Fixos',
                    value: dashboard.when(
                      data: (data) => money.format(data.fixedExpenseTotal),
                      loading: () => '...',
                      error: (_, _) => '--',
                    ),
                    color: const Color(0xFF8AA7FF),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                FilledButton.tonalIcon(
                  onPressed: onQuickExpense,
                  icon: const Icon(Icons.south_west_rounded),
                  label: const Text('Gasto rapido'),
                ),
                FilledButton.tonalIcon(
                  onPressed: onQuickIncome,
                  icon: const Icon(Icons.north_east_rounded),
                  label: const Text('Entrada'),
                ),
                OutlinedButton.icon(
                  onPressed: onAddFixed,
                  icon: const Icon(Icons.event_repeat_rounded),
                  label: const Text('Gasto fixo'),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              'Gastos fixos',
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            fixedExpenses.when(
              data: (items) {
                if (items.isEmpty) {
                  return Text(
                    'Nenhum gasto fixo cadastrado.',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.white70),
                  );
                }
                return Column(
                  children: [
                    for (final item in items.take(4))
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                item.name,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            Text(
                              'Dia ${item.dueDay}',
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: Colors.white60),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              money.format(item.amount),
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                  ],
                );
              },
              loading: () => const LinearProgressIndicator(minHeight: 2),
              error: (_, _) =>
                  const Text('Nao foi possivel carregar os gastos fixos.'),
            ),
          ],
        ),
      ),
    );
  }
}

class _MetricPill extends StatelessWidget {
  const _MetricPill({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.28)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.labelMedium?.copyWith(color: Colors.white70),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}

class _ChatTimeline extends StatelessWidget {
  const _ChatTimeline({required this.state, required this.scrollController});

  final FinanceChatState state;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
      itemCount: state.messages.length + (state.isSending ? 1 : 0),
      itemBuilder: (context, index) {
        if (state.isSending && index == state.messages.length) {
          return const _TypingBubble();
        }

        final message = state.messages[index];
        return _ChatBubble(message: message);
      },
    );
  }
}

class _ChatBubble extends StatelessWidget {
  const _ChatBubble({required this.message});

  final FinanceChatMessage message;

  @override
  Widget build(BuildContext context) {
    final isUser = message.sender == FinanceChatSender.user;
    final bubbleColor = isUser
        ? const Color(0xFF174F44)
        : const Color(0xFF1A2433);
    final align = isUser ? Alignment.centerRight : Alignment.centerLeft;
    final radius = BorderRadius.only(
      topLeft: const Radius.circular(18),
      topRight: const Radius.circular(18),
      bottomLeft: Radius.circular(isUser ? 18 : 6),
      bottomRight: Radius.circular(isUser ? 6 : 18),
    );
    final time = DateFormat('HH:mm').format(message.createdAt);

    return Align(
      alignment: align,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 0.82,
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
              const SizedBox(height: 6),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  time,
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
          color: const Color(0xFF1A2433),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppTheme.border),
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

class _QuickCommandBar extends StatelessWidget {
  const _QuickCommandBar({required this.onCommandTap});

  final ValueChanged<String> onCommandTap;

  @override
  Widget build(BuildContext context) {
    final commands = [
      ('/saldo', Icons.account_balance_wallet_rounded),
      ('/historico', Icons.history_rounded),
      ('/help', Icons.help_outline_rounded),
      ('/limpar', Icons.delete_outline_rounded),
    ];

    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemBuilder: (context, index) {
          final item = commands[index];
          return ActionChip(
            avatar: Icon(item.$2, size: 16),
            label: Text(item.$1),
            onPressed: () => onCommandTap(item.$1),
          );
        },
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemCount: commands.length,
      ),
    );
  }
}

class _Composer extends StatelessWidget {
  const _Composer({
    required this.controller,
    required this.onSend,
    required this.isSending,
  });

  final TextEditingController controller;
  final Future<void> Function() onSend;
  final bool isSending;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              minLines: 1,
              maxLines: 4,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => onSend(),
              decoration: const InputDecoration(
                hintText: 'Ex.: gastei 35 no mercado',
              ),
            ),
          ),
          const SizedBox(width: 10),
          IconButton.filled(
            onPressed: isSending ? null : onSend,
            icon: isSending
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.send_rounded),
            tooltip: 'Enviar',
          ),
        ],
      ),
    );
  }
}

Future<void> _showFinanceDialog(
  BuildContext context,
  WidgetRef ref, {
  required bool expense,
}) async {
  final allCategories = await ref
      .read(personalRepositoryProvider)
      .loadFinanceCategories();
  final categories = allCategories
      .where((category) => category.nature == (expense ? 'expense' : 'income'))
      .toList();
  final amount = TextEditingController();
  final description = TextEditingController();
  var categoryId = categories.firstOrNull?.id;

  if (!context.mounted) return;

  final saved = await showDialog<bool>(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => AlertDialog(
        title: Text(expense ? 'Nova saida' : 'Nova entrada'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: amount,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(labelText: 'Valor'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: description,
              decoration: const InputDecoration(labelText: 'Descricao'),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              initialValue: categoryId,
              decoration: const InputDecoration(labelText: 'Categoria'),
              items: categories
                  .map(
                    (category) => DropdownMenuItem(
                      value: category.id,
                      child: Text(category.name),
                    ),
                  )
                  .toList(),
              onChanged: (value) => setState(() => categoryId = value),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Salvar'),
          ),
        ],
      ),
    ),
  );

  final parsed = double.tryParse(
    amount.text.replaceAll('.', '').replaceAll(',', '.'),
  );
  if (saved == true && parsed != null) {
    if (expense) {
      await ref
          .read(personalRepositoryProvider)
          .addExpense(
            parsed,
            categoryId,
            description: description.text.trim().isEmpty
                ? null
                : description.text.trim(),
          );
    } else {
      await ref
          .read(personalRepositoryProvider)
          .addIncome(
            parsed,
            categoryId,
            description: description.text.trim().isEmpty
                ? null
                : description.text.trim(),
          );
    }
    ref.invalidate(dashboardProvider);
    ref.invalidate(financeChatControllerProvider);
  }
}

Future<void> _showFixedDialog(BuildContext context, WidgetRef ref) async {
  final categories = await ref
      .read(personalRepositoryProvider)
      .loadFinanceCategories();
  final expenseCategories = categories
      .where((category) => category.nature == 'expense')
      .toList();
  final name = TextEditingController();
  final amount = TextEditingController();
  final dueDay = TextEditingController(text: '10');
  var categoryId = expenseCategories.firstOrNull?.id;

  if (!context.mounted) return;

  final saved = await showDialog<bool>(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => AlertDialog(
        title: const Text('Gasto fixo'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: name,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: amount,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(labelText: 'Valor'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: dueDay,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Dia do vencimento'),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              initialValue: categoryId,
              items: expenseCategories
                  .map(
                    (category) => DropdownMenuItem(
                      value: category.id,
                      child: Text(category.name),
                    ),
                  )
                  .toList(),
              onChanged: (value) => setState(() => categoryId = value),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Salvar'),
          ),
        ],
      ),
    ),
  );

  final parsed = double.tryParse(
    amount.text.replaceAll('.', '').replaceAll(',', '.'),
  );
  if (saved == true && parsed != null) {
    await ref
        .read(personalRepositoryProvider)
        .addFixedExpense(
          name.text.trim(),
          parsed,
          categoryId,
          int.tryParse(dueDay.text) ?? 1,
        );
    ref.invalidate(fixedExpensesProvider);
    ref.invalidate(dashboardProvider);
  }
}
