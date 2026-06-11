import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widgets/async_state_view.dart';
import '../../core/widgets/section_card.dart';
import '../../data/repositories/providers.dart';

class StudiesScreen extends ConsumerWidget {
  const StudiesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final units = ref.watch(studyUnitsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Estudos')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SectionCard(
            child: Text('Sugestao: escolha um topico de prioridade alta e faca 25 minutos de foco + 5 de resumo ativo.'),
          ),
          const SizedBox(height: 14),
          AsyncStateView(
            value: units,
            builder: (items) => Column(
              children: [
                for (final item in items)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: SectionCard(
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(item.title),
                        subtitle: Text('${item.difficulty} - ${item.estimatedMinutes} min - dominio ${item.mastery}%'),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
