import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/theme.dart';
import '../../core/widgets/async_state_view.dart';
import '../../core/widgets/metric_tile.dart';
import '../../core/widgets/section_card.dart';
import '../../data/repositories/providers.dart';

class ProgressScreen extends ConsumerWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboard = ref.watch(dashboardProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Progresso')),
      body: AsyncStateView(
        value: dashboard,
        builder: (data) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SectionCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nivel ${data.level}', style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w900)),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: data.levelProgress,
                    minHeight: 10,
                    borderRadius: BorderRadius.circular(999),
                    backgroundColor: AppTheme.surfaceSoft,
                  ),
                  const SizedBox(height: 8),
                  Text('${data.totalXp} XP acumulados'),
                ],
              ),
            ),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.45,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: const [
                MetricTile(label: 'Agua', value: '+5 XP', icon: Icons.water_drop_rounded),
                MetricTile(label: 'Missao', value: '+30 XP', icon: Icons.flag_rounded),
                MetricTile(label: 'Treino', value: '+20 XP', icon: Icons.fitness_center_rounded),
                MetricTile(label: 'Revisao', value: '+25 XP', icon: Icons.calendar_month_rounded),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
