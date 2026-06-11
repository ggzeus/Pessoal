import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../core/widgets/async_state_view.dart';
import '../../core/widgets/metric_tile.dart';
import '../../core/widgets/section_card.dart';
import '../../data/repositories/providers.dart';

class FinanceScreen extends ConsumerWidget {
  const FinanceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboard = ref.watch(dashboardProvider);
    final fixed = ref.watch(fixedExpensesProvider);
    final money = NumberFormat.currency(locale: 'pt_BR', symbol: r'R$');
    return Scaffold(
      appBar: AppBar(title: const Text('Financas')),
      body: AsyncStateView(
        value: dashboard,
        builder: (data) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.45,
              children: [
                MetricTile(label: 'Entradas', value: money.format(data.monthIncome), icon: Icons.south_west_rounded),
                MetricTile(label: 'Saidas', value: money.format(data.monthExpense), icon: Icons.north_east_rounded),
                MetricTile(label: 'Fixos', value: money.format(data.fixedExpenseTotal), icon: Icons.event_repeat_rounded),
                MetricTile(label: 'Sobra', value: money.format(data.monthBalance), icon: Icons.savings_rounded),
              ],
            ),
            const SizedBox(height: 14),
            FilledButton.icon(
              onPressed: () => _showFinanceDialog(context, ref, expense: true),
              icon: const Icon(Icons.payments_rounded),
              label: const Text('Registrar gasto rapido'),
            ),
            const SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: () => _showFixedDialog(context, ref),
              icon: const Icon(Icons.add_card_rounded),
              label: const Text('Cadastrar gasto fixo'),
            ),
            const SizedBox(height: 14),
            SectionCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Gastos fixos', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
                  const SizedBox(height: 8),
                  AsyncStateView(
                    value: fixed,
                    builder: (items) => Column(
                      children: [
                        for (final item in items)
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(item.name),
                            subtitle: Text('Vence dia ${item.dueDay}'),
                            trailing: Text(money.format(item.amount)),
                          ),
                        if (items.isEmpty) const Text('Nenhum gasto fixo cadastrado.'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _showFinanceDialog(BuildContext context, WidgetRef ref, {required bool expense}) async {
  final categories = await ref.read(personalRepositoryProvider).loadFinanceCategories();
  final amount = TextEditingController();
  var categoryId = categories.firstOrNull?.id;
  if (!context.mounted) return;
  final saved = await showDialog<bool>(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => AlertDialog(
        title: Text(expense ? 'Gasto rapido' : 'Entrada'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: amount, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Valor')),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              initialValue: categoryId,
              decoration: const InputDecoration(labelText: 'Categoria'),
              items: categories.map((c) => DropdownMenuItem(value: c.id, child: Text(c.name))).toList(),
              onChanged: (value) => setState(() => categoryId = value),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancelar')),
          FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Salvar')),
        ],
      ),
    ),
  );
  final parsed = double.tryParse(amount.text.replaceAll(',', '.'));
  if (saved == true && parsed != null && categoryId != null) {
    if (expense) {
      await ref.read(personalRepositoryProvider).addExpense(parsed, categoryId!);
    } else {
      await ref.read(personalRepositoryProvider).addIncome(parsed, categoryId!);
    }
    ref.invalidate(dashboardProvider);
  }
}

Future<void> _showFixedDialog(BuildContext context, WidgetRef ref) async {
  final categories = await ref.read(personalRepositoryProvider).loadFinanceCategories();
  final name = TextEditingController();
  final amount = TextEditingController();
  final dueDay = TextEditingController(text: '10');
  var categoryId = categories.firstOrNull?.id;
  if (!context.mounted) return;
  final saved = await showDialog<bool>(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => AlertDialog(
        title: const Text('Gasto fixo'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: name, decoration: const InputDecoration(labelText: 'Nome')),
            const SizedBox(height: 12),
            TextField(controller: amount, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Valor')),
            const SizedBox(height: 12),
            TextField(controller: dueDay, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Dia vencimento')),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              initialValue: categoryId,
              items: categories.map((c) => DropdownMenuItem(value: c.id, child: Text(c.name))).toList(),
              onChanged: (value) => setState(() => categoryId = value),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancelar')),
          FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Salvar')),
        ],
      ),
    ),
  );
  final parsed = double.tryParse(amount.text.replaceAll(',', '.'));
  if (saved == true && parsed != null) {
    await ref.read(personalRepositoryProvider).addFixedExpense(
          name.text.trim(),
          parsed,
          categoryId,
          int.tryParse(dueDay.text) ?? 1,
        );
    ref.invalidate(fixedExpensesProvider);
    ref.invalidate(dashboardProvider);
  }
}
