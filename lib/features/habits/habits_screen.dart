import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widgets/async_state_view.dart';
import '../../core/widgets/section_card.dart';
import '../../data/repositories/providers.dart';

class HabitsScreen extends ConsumerWidget {
  const HabitsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habits = ref.watch(habitsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Habitos')),
      body: AsyncStateView(
        value: habits,
        builder: (items) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            for (final habit in items)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: SectionCard(
                  child: CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    value: false,
                    title: Text(habit.name),
                    subtitle: Text('${habit.lifeArea ?? 'Area'} - ${habit.metric ?? 'feito'}'),
                    onChanged: (_) async {
                      await ref.read(personalRepositoryProvider).markHabitDone(habit);
                      ref.invalidate(habitsProvider);
                      ref.invalidate(dashboardProvider);
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
