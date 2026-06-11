import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widgets/async_state_view.dart';
import '../../core/widgets/section_card.dart';
import '../../data/repositories/providers.dart';

class DiaryScreen extends ConsumerWidget {
  const DiaryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entries = ref.watch(diaryProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diario de evolucao'),
        actions: [
          IconButton(onPressed: () => _showDiaryDialog(context, ref), icon: const Icon(Icons.add_rounded)),
        ],
      ),
      body: AsyncStateView(
        value: entries,
        builder: (items) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SectionCard(
              child: Text('Perguntas-chave: o que fiz bem, o que posso melhorar e qual foi a maior vitoria do dia?'),
            ),
            const SizedBox(height: 12),
            for (final entry in items)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: SectionCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Humor ${entry.mood ?? '-'} | Energia ${entry.energy ?? '-'}',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
                      const SizedBox(height: 8),
                      Text('Vitoria: ${entry.victory ?? 'Nao informado'}'),
                      const SizedBox(height: 4),
                      Text('Aprendizado: ${entry.learning ?? 'Nao informado'}'),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

Future<void> _showDiaryDialog(BuildContext context, WidgetRef ref) async {
  final victory = TextEditingController();
  final learning = TextEditingController();
  var mood = 3.0;
  var energy = 3.0;
  final saved = await showDialog<bool>(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => AlertDialog(
        title: const Text('Revisao rapida'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Humor: ${mood.round()}'),
            Slider(value: mood, min: 1, max: 5, divisions: 4, onChanged: (v) => setState(() => mood = v)),
            Text('Energia: ${energy.round()}'),
            Slider(value: energy, min: 1, max: 5, divisions: 4, onChanged: (v) => setState(() => energy = v)),
            TextField(controller: victory, decoration: const InputDecoration(labelText: 'Vitoria do dia')),
            const SizedBox(height: 12),
            TextField(controller: learning, decoration: const InputDecoration(labelText: 'Aprendizado')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancelar')),
          FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Salvar')),
        ],
      ),
    ),
  );
  if (saved == true) {
    await ref.read(personalRepositoryProvider).addDiaryEntry(
          mood: mood.round(),
          energy: energy.round(),
          victory: victory.text.trim(),
          learning: learning.text.trim(),
        );
    ref.invalidate(diaryProvider);
  }
}
