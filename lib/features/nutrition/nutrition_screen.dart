import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widgets/async_state_view.dart';
import '../../core/widgets/metric_tile.dart';
import '../../core/widgets/section_card.dart';
import '../../data/repositories/providers.dart';

class NutritionScreen extends ConsumerWidget {
  const NutritionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboard = ref.watch(dashboardProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Alimentacao e agua')),
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
                MetricTile(label: 'Agua hoje', value: '${data.waterMl}ml', icon: Icons.water_drop_rounded),
                const MetricTile(label: 'Meta segura', value: 'Equilibrio', icon: Icons.health_and_safety_rounded),
              ],
            ),
            const SizedBox(height: 14),
            FilledButton.icon(
              onPressed: () async {
                await ref.read(personalRepositoryProvider).logWater(250);
                ref.invalidate(dashboardProvider);
              },
              icon: const Icon(Icons.water_drop_rounded),
              label: const Text('Registrar +250ml'),
            ),
            const SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: () => _showFoodDialog(context, ref),
              icon: const Icon(Icons.restaurant_rounded),
              label: const Text('Registrar alimento'),
            ),
            const SizedBox(height: 14),
            const SectionCard(
              child: Text(
                'O foco aqui e energia e consciencia alimentar. O app nao usa metas agressivas nem incentiva culpa alimentar.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _showFoodDialog(BuildContext context, WidgetRef ref) async {
  final name = TextEditingController();
  final calories = TextEditingController();
  final saved = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Alimento rapido'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(controller: name, decoration: const InputDecoration(labelText: 'Nome')),
          const SizedBox(height: 12),
          TextField(controller: calories, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Calorias')),
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancelar')),
        FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Salvar')),
      ],
    ),
  );
  if (saved == true && name.text.trim().isNotEmpty) {
    await ref.read(personalRepositoryProvider).addFoodLog(
          name: name.text.trim(),
          calories: double.tryParse(calories.text.replaceAll(',', '.')) ?? 0,
        );
    ref.invalidate(dashboardProvider);
  }
}
