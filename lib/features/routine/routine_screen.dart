import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/utils/date_utils.dart';
import '../../core/widgets/async_state_view.dart';
import '../../core/widgets/section_card.dart';
import '../../data/local/database/app_database.dart';
import '../../data/repositories/providers.dart';

class RoutineScreen extends ConsumerStatefulWidget {
  const RoutineScreen({super.key});

  @override
  ConsumerState<RoutineScreen> createState() => _RoutineScreenState();
}

class _RoutineScreenState extends ConsumerState<RoutineScreen> {
  int _weekday = DateTime.now().weekday;

  @override
  Widget build(BuildContext context) {
    final routine = ref.watch(routineProvider(_weekday));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rotina semanal'),
        actions: [
          IconButton(
            tooltip: 'Adicionar evento',
            onPressed: () => _showRoutineDialog(context, ref, _weekday),
            icon: const Icon(Icons.add_rounded),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SegmentedButton<int>(
            segments: const [
              ButtonSegment(value: 1, label: Text('S')),
              ButtonSegment(value: 2, label: Text('T')),
              ButtonSegment(value: 3, label: Text('Q')),
              ButtonSegment(value: 4, label: Text('Q')),
              ButtonSegment(value: 5, label: Text('S')),
              ButtonSegment(value: 6, label: Text('S')),
              ButtonSegment(value: 7, label: Text('D')),
            ],
            selected: {_weekday},
            onSelectionChanged: (value) =>
                setState(() => _weekday = value.first),
          ),
          const SizedBox(height: 16),
          AsyncStateView(
            value: routine,
            builder: (events) => Column(
              children: [
                for (final event in events)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: SectionCard(
                      onTap: () => _showRoutineDialog(
                        context,
                        ref,
                        _weekday,
                        event: event,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Icon(Icons.schedule_rounded),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Text(
                                      event.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                    Chip(
                                      visualDensity: VisualDensity.compact,
                                      label: Text(_routineKindLabel(event)),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  '${AppDateUtils.clockFromMinutes(event.startMinutes)} - '
                                  '${AppDateUtils.clockFromMinutes(event.endMinutes)}  |  ${event.type}',
                                ),
                                if ((event.description ?? '')
                                    .trim()
                                    .isNotEmpty) ...[
                                  const SizedBox(height: 6),
                                  Text(event.description!),
                                ],
                              ],
                            ),
                          ),
                          PopupMenuButton<String>(
                            tooltip: 'Acoes do evento',
                            onSelected: (value) {
                              if (value == 'edit') {
                                _showRoutineDialog(
                                  context,
                                  ref,
                                  _weekday,
                                  event: event,
                                );
                                return;
                              }
                              if (value == 'delete') {
                                _deleteRoutineEvent(context, ref, event);
                              }
                            },
                            itemBuilder: (context) => const [
                              PopupMenuItem(
                                value: 'edit',
                                child: Text('Editar'),
                              ),
                              PopupMenuItem(
                                value: 'delete',
                                child: Text('Remover'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                if (events.isEmpty)
                  const SectionCard(
                    child: Text(
                      'Nenhum evento nesse dia. Toque em + para criar.',
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

const _routineEventTypes = [
  'Escola',
  'Trabalho',
  'Estudo',
  'Treino',
  'Alimentacao',
  'Sono',
  'Lazer',
  'Projeto pessoal',
  'Familia',
  'Compromisso',
  'Descanso',
  'Tarefa livre',
];

bool _isVariableRoutineEvent(RoutineEvent event) =>
    event.templateId == 'variable_weekly';

String _routineKindLabel(RoutineEvent event) =>
    _isVariableRoutineEvent(event) ? 'Variavel' : 'Fixo';

Future<void> _showRoutineDialog(
  BuildContext context,
  WidgetRef ref,
  int weekday, {
  RoutineEvent? event,
}) async {
  final isEditing = event != null;
  final title = TextEditingController(text: event?.title ?? '');
  final description = TextEditingController(text: event?.description ?? '');
  final start = TextEditingController(
    text: event == null
        ? '18:00'
        : AppDateUtils.clockFromMinutes(event.startMinutes),
  );
  final end = TextEditingController(
    text: event == null
        ? '18:45'
        : AppDateUtils.clockFromMinutes(event.endMinutes),
  );
  var selectedWeekday = event?.weekday ?? weekday;
  var type = _routineEventTypes.contains(event?.type) ? event!.type : 'Treino';
  var notify = event?.notify ?? false;
  var variable = event == null ? false : _isVariableRoutineEvent(event);
  final saved = await showDialog<bool>(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => AlertDialog(
        title: Text(isEditing ? 'Editar evento' : 'Novo evento'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: title,
              decoration: const InputDecoration(labelText: 'Titulo'),
            ),
            const SizedBox(height: 12),
            SegmentedButton<bool>(
              segments: const [
                ButtonSegment(value: false, label: Text('Fixo')),
                ButtonSegment(value: true, label: Text('Variavel')),
              ],
              selected: {variable},
              onSelectionChanged: (value) =>
                  setState(() => variable = value.first),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<int>(
              initialValue: selectedWeekday,
              decoration: const InputDecoration(labelText: 'Dia'),
              items: const [
                DropdownMenuItem(value: 1, child: Text('Segunda')),
                DropdownMenuItem(value: 2, child: Text('Terca')),
                DropdownMenuItem(value: 3, child: Text('Quarta')),
                DropdownMenuItem(value: 4, child: Text('Quinta')),
                DropdownMenuItem(value: 5, child: Text('Sexta')),
                DropdownMenuItem(value: 6, child: Text('Sabado')),
                DropdownMenuItem(value: 7, child: Text('Domingo')),
              ],
              onChanged: (value) =>
                  setState(() => selectedWeekday = value ?? selectedWeekday),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              initialValue: type,
              decoration: const InputDecoration(labelText: 'Tipo'),
              items: _routineEventTypes
                  .map(
                    (item) => DropdownMenuItem(value: item, child: Text(item)),
                  )
                  .toList(),
              onChanged: (value) => setState(() => type = value ?? type),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: start,
                    decoration: const InputDecoration(labelText: 'Inicio'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: end,
                    decoration: const InputDecoration(labelText: 'Fim'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              controller: description,
              minLines: 2,
              maxLines: 3,
              decoration: const InputDecoration(labelText: 'Descricao'),
            ),
            const SizedBox(height: 8),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              value: notify,
              title: const Text('Notificar'),
              onChanged: (value) => setState(() => notify = value),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Salvar'),
          ),
        ],
      ),
    ),
  );
  if (saved != true) return;
  if (!context.mounted) return;

  final parsedTitle = title.text.trim();
  if (parsedTitle.isEmpty) {
    _showRoutineError(context, 'Informe um titulo para o evento.');
    return;
  }

  late final int startMinutes;
  late final int endMinutes;
  try {
    startMinutes = AppDateUtils.minutesFromClock(start.text);
    endMinutes = AppDateUtils.minutesFromClock(end.text);
  } on FormatException {
    _showRoutineError(context, 'Use horarios no formato HH:MM.');
    return;
  }

  if (endMinutes <= startMinutes) {
    _showRoutineError(
      context,
      'O horario final precisa ser maior que o inicial.',
    );
    return;
  }

  final repository = ref.read(personalRepositoryProvider);
  if (event == null) {
    await repository.addRoutineEvent(
      title: parsedTitle,
      type: type,
      weekday: selectedWeekday,
      startMinutes: startMinutes,
      endMinutes: endMinutes,
      description: description.text.trim().isEmpty
          ? null
          : description.text.trim(),
      notify: notify,
      variable: variable,
    );
  } else {
    await repository.updateRoutineEvent(
      event: event,
      title: parsedTitle,
      type: type,
      weekday: selectedWeekday,
      startMinutes: startMinutes,
      endMinutes: endMinutes,
      description: description.text.trim().isEmpty
          ? null
          : description.text.trim(),
      notify: notify,
      variable: variable,
    );
  }
  ref.invalidate(routineProvider(weekday));
  ref.invalidate(routineProvider(selectedWeekday));
  ref.invalidate(dashboardProvider);
}

Future<void> _deleteRoutineEvent(
  BuildContext context,
  WidgetRef ref,
  RoutineEvent event,
) async {
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Remover evento'),
      content: Text('Remover "${event.title}" do cronograma semanal?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Cancelar'),
        ),
        FilledButton.tonal(
          onPressed: () => Navigator.pop(context, true),
          child: const Text('Remover'),
        ),
      ],
    ),
  );
  if (confirmed != true) return;
  if (!context.mounted) return;

  await ref.read(personalRepositoryProvider).deleteRoutineEvent(event);
  ref.invalidate(routineProvider(event.weekday));
  ref.invalidate(dashboardProvider);
}

void _showRoutineError(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
