import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widgets/async_state_view.dart';
import '../../core/widgets/section_card.dart';
import '../../data/repositories/providers.dart';

class MissionScreen extends ConsumerWidget {
  const MissionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboard = ref.watch(dashboardProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Missao do Dia')),
      body: AsyncStateView(
        value: dashboard,
        builder: (data) {
          final mission = data.mission;
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              SectionCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(mission?.title ?? 'Nenhuma missao definida',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900)),
                    const SizedBox(height: 10),
                    Text(mission?.description ?? 'Crie uma missao possivel para hoje.'),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: FilledButton.icon(
                            onPressed: mission == null
                                ? null
                                : () async {
                                    await ref.read(personalRepositoryProvider).completeMission(mission);
                                    ref.invalidate(dashboardProvider);
                                  },
                            icon: const Icon(Icons.check_rounded),
                            label: const Text('Concluir +XP'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              FilledButton.icon(
                onPressed: () => _showMissionDialog(context, ref),
                icon: const Icon(Icons.edit_rounded),
                label: const Text('Criar missao manual'),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () async {
                  await ref.read(personalRepositoryProvider).createOrReplaceTodayMission(
                        'Registrar gastos, beber agua e fazer um bloco de foco',
                        'Missao automatica simples baseada nos pilares do MVP.',
                      );
                  ref.invalidate(dashboardProvider);
                },
                icon: const Icon(Icons.auto_awesome_rounded),
                label: const Text('Gerar missao simples'),
              ),
            ],
          );
        },
      ),
    );
  }
}

Future<void> _showMissionDialog(BuildContext context, WidgetRef ref) async {
  final title = TextEditingController();
  final description = TextEditingController();
  final saved = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Missao manual'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(controller: title, decoration: const InputDecoration(labelText: 'Missao')),
          const SizedBox(height: 12),
          TextField(controller: description, decoration: const InputDecoration(labelText: 'Detalhe opcional')),
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancelar')),
        FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Salvar')),
      ],
    ),
  );
  if (saved == true && title.text.trim().isNotEmpty) {
    await ref.read(personalRepositoryProvider).createOrReplaceTodayMission(title.text.trim(), description.text.trim());
    ref.invalidate(dashboardProvider);
  }
}
