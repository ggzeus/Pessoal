import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../core/widgets/async_state_view.dart';
import '../../core/widgets/section_card.dart';
import '../../data/repositories/providers.dart';

class WeeklyReviewScreen extends ConsumerWidget {
  const WeeklyReviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboard = ref.watch(dashboardProvider);
    final money = NumberFormat.currency(locale: 'pt_BR', symbol: r'R$');
    return Scaffold(
      appBar: AppBar(title: const Text('Revisao semanal')),
      body: AsyncStateView(
        value: dashboard,
        builder: (data) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SectionCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Resumo da semana', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900)),
                  const SizedBox(height: 12),
                  Text('Missao de hoje: ${data.mission?.status == 'completed' ? 'concluida' : 'em andamento'}'),
                  Text('Agua registrada hoje: ${data.waterMl}ml'),
                  Text('Sobra mensal atual: ${money.format(data.monthBalance)}'),
                  Text('Tarefas abertas: ${data.openTasks.length}'),
                  const SizedBox(height: 12),
                  const Text('Sugestao: revisar sono, gastos pequenos e escolher 3 prioridades para a proxima semana.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
