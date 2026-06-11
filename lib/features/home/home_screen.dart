import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../app/theme.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/date_utils.dart';
import '../../core/widgets/async_state_view.dart';
import '../../core/widgets/metric_tile.dart';
import '../../core/widgets/section_card.dart';
import '../../data/repositories/dashboard_snapshot.dart';
import '../../data/repositories/providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboard = ref.watch(dashboardProvider);
    return Scaffold(
      body: SafeArea(
        child: AsyncStateView(
          value: dashboard,
          builder: (data) => RefreshIndicator(
            onRefresh: () async => ref.invalidate(dashboardProvider),
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
              children: [
                _Header(snapshot: data),
                const SizedBox(height: 16),
                _MissionCard(snapshot: data),
                const SizedBox(height: 14),
                _QuickActions(snapshot: data),
                const SizedBox(height: 14),
                _TodayMetrics(snapshot: data),
                const SizedBox(height: 14),
                _NextMoves(snapshot: data),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.snapshot});

  final DashboardSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    final hour = DateTime.now().hour;
    final greeting = hour < 12 ? 'Bom dia' : hour < 18 ? 'Boa tarde' : 'Boa noite';
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$greeting, ${AppConstants.userName}.',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900)),
              const SizedBox(height: 4),
              Text(
                DateFormat("EEEE, d 'de' MMMM", 'pt_BR').format(DateTime.now()),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70),
              ),
            ],
          ),
        ),
        CircleAvatar(
          backgroundColor: AppTheme.primary.withValues(alpha: 0.14),
          child: const Icon(Icons.bolt_rounded, color: AppTheme.primary),
        ),
      ],
    );
  }
}

class _MissionCard extends ConsumerWidget {
  const _MissionCard({required this.snapshot});

  final DashboardSnapshot snapshot;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mission = snapshot.mission;
    return SectionCard(
      onTap: () => context.push('/mission'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.flag_rounded, color: AppTheme.primary),
              const SizedBox(width: 8),
              Text('Missao de hoje', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
              const Spacer(),
              if (mission?.status != 'completed')
                TextButton(
                  onPressed: mission == null
                      ? null
                      : () async {
                          await ref.read(personalRepositoryProvider).completeMission(mission);
                          ref.invalidate(dashboardProvider);
                        },
                  child: const Text('Concluir'),
                ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            mission?.title ?? 'Crie uma missao simples para guiar o dia.',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: snapshot.levelProgress,
            minHeight: 8,
            borderRadius: BorderRadius.circular(999),
            backgroundColor: AppTheme.surfaceSoft,
          ),
          const SizedBox(height: 8),
          Text('Nivel ${snapshot.level} - ${snapshot.totalXp} XP acumulados',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white70)),
        ],
      ),
    );
  }
}

class _QuickActions extends ConsumerWidget {
  const _QuickActions({required this.snapshot});

  final DashboardSnapshot snapshot;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actions = [
      (Icons.payments_rounded, 'Gasto', () => _showExpenseDialog(context, ref)),
      (Icons.restaurant_rounded, 'Alimento', () => _showFoodDialog(context, ref)),
      (Icons.water_drop_rounded, '+250ml', () => _logWater(ref, 250)),
      (Icons.fitness_center_rounded, 'Treino', () => context.push('/immersive')),
      (Icons.mood_rounded, 'Humor', () => context.push('/diary')),
      (Icons.task_alt_rounded, 'Tarefa', () => _showTaskDialog(context, ref)),
      (Icons.flag_rounded, 'Missao', () => context.push('/mission')),
      (Icons.lightbulb_rounded, 'Ideia', () => _showProjectDialog(context, ref)),
    ];

    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Acoes rapidas', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
          const SizedBox(height: 12),
          GridView.builder(
            itemCount: actions.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.92,
            ),
            itemBuilder: (context, index) {
              final action = actions[index];
              return InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: action.$3,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.surfaceSoft,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppTheme.border),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(action.$1, color: AppTheme.primary),
                      const SizedBox(height: 8),
                      Text(action.$2, textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> _logWater(WidgetRef ref, int amount) async {
    await ref.read(personalRepositoryProvider).logWater(amount);
    ref.invalidate(dashboardProvider);
  }
}

class _TodayMetrics extends StatelessWidget {
  const _TodayMetrics({required this.snapshot});

  final DashboardSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    final money = NumberFormat.currency(locale: 'pt_BR', symbol: r'R$');
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.45,
      children: [
        MetricTile(label: 'Agua hoje', value: '${snapshot.waterMl}ml', icon: Icons.water_drop_rounded),
        MetricTile(label: 'Sobra mensal', value: money.format(snapshot.monthBalance), icon: Icons.savings_rounded),
        MetricTile(label: 'Treino', value: snapshot.pendingWorkout?.name ?? 'Pendente', icon: Icons.fitness_center_rounded),
        MetricTile(label: 'Estudo', value: snapshot.studySuggestion?.title ?? 'Sem foco', icon: Icons.menu_book_rounded),
      ],
    );
  }
}

class _NextMoves extends ConsumerWidget {
  const _NextMoves({required this.snapshot});

  final DashboardSnapshot snapshot;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final event = snapshot.nextRoutineEvent;
    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Proximo movimento', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
          const SizedBox(height: 12),
          if (event != null)
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.schedule_rounded),
              title: Text(event.title),
              subtitle: Text('${AppDateUtils.clockFromMinutes(event.startMinutes)} - ${event.type}'),
            )
          else
            const Text('Nenhuma atividade para hoje.'),
          const Divider(height: 24),
          Text('Tarefas abertas', style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800)),
          const SizedBox(height: 8),
          for (final task in snapshot.openTasks)
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              value: false,
              title: Text(task.title),
              onChanged: (_) async {
                await ref.read(personalRepositoryProvider).completeTask(task);
                ref.invalidate(dashboardProvider);
              },
            ),
          if (snapshot.openTasks.isEmpty)
            const Text('Sem tarefas abertas. Crie uma tarefa rapida quando surgir algo.'),
        ],
      ),
    );
  }
}

Future<void> _showExpenseDialog(BuildContext context, WidgetRef ref) async {
  final amount = TextEditingController();
  final description = TextEditingController();
  final categories = await ref.read(personalRepositoryProvider).loadFinanceCategories();
  var selectedCategory = categories.firstOrNull?.id;
  if (!context.mounted) return;

  final saved = await showDialog<bool>(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => AlertDialog(
        title: const Text('Gasto rapido'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: amount, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Valor')),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              initialValue: selectedCategory,
              items: categories
                  .map((category) => DropdownMenuItem(value: category.id, child: Text(category.name)))
                  .toList(),
              onChanged: (value) => setState(() => selectedCategory = value),
              decoration: const InputDecoration(labelText: 'Categoria'),
            ),
            const SizedBox(height: 12),
            TextField(controller: description, decoration: const InputDecoration(labelText: 'Descricao opcional')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancelar')),
          FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Salvar')),
        ],
      ),
    ),
  );

  if (saved == true && selectedCategory != null) {
    final value = double.tryParse(amount.text.replaceAll(',', '.'));
    if (value != null) {
      await ref.read(personalRepositoryProvider).addExpense(value, selectedCategory!, description: description.text);
      ref.invalidate(dashboardProvider);
      ref.invalidate(fixedExpensesProvider);
    }
  }
}

Future<void> _showFoodDialog(BuildContext context, WidgetRef ref) async {
  final name = TextEditingController();
  final calories = TextEditingController();
  final saved = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Registrar alimento'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(controller: name, decoration: const InputDecoration(labelText: 'Alimento')),
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

Future<void> _showTaskDialog(BuildContext context, WidgetRef ref) async {
  final title = TextEditingController();
  final saved = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Criar tarefa rapida'),
      content: TextField(controller: title, decoration: const InputDecoration(labelText: 'O que precisa ser feito?')),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancelar')),
        FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Salvar')),
      ],
    ),
  );
  if (saved == true && title.text.trim().isNotEmpty) {
    await ref.read(personalRepositoryProvider).addTask(title.text.trim());
    ref.invalidate(dashboardProvider);
  }
}

Future<void> _showProjectDialog(BuildContext context, WidgetRef ref) async {
  final name = TextEditingController();
  final nextTask = TextEditingController();
  final saved = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Ideia de projeto'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(controller: name, decoration: const InputDecoration(labelText: 'Projeto')),
          const SizedBox(height: 12),
          TextField(controller: nextTask, decoration: const InputDecoration(labelText: 'Proxima acao')),
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancelar')),
        FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Salvar')),
      ],
    ),
  );
  if (saved == true && name.text.trim().isNotEmpty) {
    await ref.read(personalRepositoryProvider).addProject(name.text.trim(), nextTask.text.trim());
    ref.invalidate(dashboardProvider);
    ref.invalidate(projectsProvider);
  }
}
