import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widgets/async_state_view.dart';
import '../../core/widgets/section_card.dart';
import '../../data/repositories/providers.dart';

class ProjectsScreen extends ConsumerWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(projectsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projetos'),
        actions: [
          IconButton(onPressed: () => _showProjectDialog(context, ref), icon: const Icon(Icons.add_rounded)),
        ],
      ),
      body: AsyncStateView(
        value: projects,
        builder: (items) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            for (final project in items)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: SectionCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(project.name, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)),
                      const SizedBox(height: 6),
                      Text(project.nextTask ?? 'Defina uma proxima acao pequena.'),
                      const SizedBox(height: 10),
                      LinearProgressIndicator(value: project.progress / 100),
                    ],
                  ),
                ),
              ),
            if (items.isEmpty) const SectionCard(child: Text('Crie um projeto e uma proxima acao para destravar movimento.')),
          ],
        ),
      ),
    );
  }
}

Future<void> _showProjectDialog(BuildContext context, WidgetRef ref) async {
  final name = TextEditingController();
  final next = TextEditingController();
  final saved = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Novo projeto'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(controller: name, decoration: const InputDecoration(labelText: 'Nome')),
          const SizedBox(height: 12),
          TextField(controller: next, decoration: const InputDecoration(labelText: 'Proxima tarefa')),
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancelar')),
        FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Salvar')),
      ],
    ),
  );
  if (saved == true && name.text.trim().isNotEmpty) {
    await ref.read(personalRepositoryProvider).addProject(name.text.trim(), next.text.trim());
    ref.invalidate(projectsProvider);
    ref.invalidate(dashboardProvider);
  }
}
