import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../app/theme.dart';
import '../../data/local/database/app_database.dart';

enum ExerciseDemoView { visual, guide }

enum ExerciseDemoAngle { top, side, front }

class ExerciseDemonstrationSection extends StatefulWidget {
  const ExerciseDemonstrationSection({
    super.key,
    required this.exercise,
    this.compact = false,
  });

  final Exercise exercise;
  final bool compact;

  @override
  State<ExerciseDemonstrationSection> createState() =>
      _ExerciseDemonstrationSectionState();
}

class _ExerciseDemonstrationSectionState
    extends State<ExerciseDemonstrationSection> {
  var _view = ExerciseDemoView.visual;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SegmentedButton<ExerciseDemoView>(
          segments: const [
            ButtonSegment(
              value: ExerciseDemoView.visual,
              icon: Icon(Icons.visibility_rounded),
              label: Text('Visual'),
            ),
            ButtonSegment(
              value: ExerciseDemoView.guide,
              icon: Icon(Icons.format_list_numbered_rounded),
              label: Text('Como fazer'),
            ),
          ],
          selected: {_view},
          onSelectionChanged: (value) => setState(() => _view = value.first),
        ),
        const SizedBox(height: 12),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 220),
          child: _view == ExerciseDemoView.visual
              ? ExerciseDemo(
                  key: ValueKey('visual-${widget.exercise.id}'),
                  exercise: widget.exercise,
                  compact: widget.compact,
                )
              : _GuidePanel(
                  key: ValueKey('guide-${widget.exercise.id}'),
                  exercise: widget.exercise,
                ),
        ),
      ],
    );
  }
}

class ExerciseDemo extends StatefulWidget {
  const ExerciseDemo({super.key, required this.exercise, this.compact = false});

  final Exercise exercise;
  final bool compact;

  @override
  State<ExerciseDemo> createState() => _ExerciseDemoState();
}

class _ExerciseDemoState extends State<ExerciseDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  var _angle = ExerciseDemoAngle.top;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final labels = _demoLabels(widget.exercise);
    return Column(
      children: [
        if (!widget.compact) ...[
          Align(
            alignment: Alignment.centerLeft,
            child: SegmentedButton<ExerciseDemoAngle>(
              segments: const [
                ButtonSegment(
                  value: ExerciseDemoAngle.top,
                  icon: Icon(Icons.map_rounded),
                  label: Text('Cima'),
                ),
                ButtonSegment(
                  value: ExerciseDemoAngle.side,
                  icon: Icon(Icons.view_sidebar_rounded),
                  label: Text('Lado'),
                ),
                ButtonSegment(
                  value: ExerciseDemoAngle.front,
                  icon: Icon(Icons.center_focus_strong_rounded),
                  label: Text('Frente'),
                ),
              ],
              selected: {_angle},
              onSelectionChanged: (value) => setState(() {
                _angle = value.first;
              }),
            ),
          ),
          const SizedBox(height: 12),
        ],
        Container(
          height: widget.compact ? 190 : 240,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppTheme.surfaceSoft,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: AppTheme.border),
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              Positioned.fill(
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, _) => CustomPaint(
                    painter: _ExerciseDemoPainter(
                      category: widget.exercise.category,
                      name: widget.exercise.name,
                      angle: widget.compact ? ExerciseDemoAngle.top : _angle,
                      progress: _controller.value,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 14,
                right: 14,
                bottom: 14,
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final label in labels)
                      _DemoPill(icon: label.icon, label: label.text),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _GuidePanel extends StatelessWidget {
  const _GuidePanel({super.key, required this.exercise});

  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppTheme.surfaceSoft,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppTheme.border),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          detailedExerciseGuide(exercise),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.42),
        ),
      ),
    );
  }
}

class _DemoPill extends StatelessWidget {
  const _DemoPill({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppTheme.background.withValues(alpha: 0.72),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 15, color: AppTheme.primary),
            const SizedBox(width: 6),
            Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }
}

class _DemoLabel {
  const _DemoLabel(this.icon, this.text);

  final IconData icon;
  final String text;
}

enum _FootballContext {
  cones,
  duel,
  smallGame,
  rondo,
  sequence,
  points,
  attackWaves,
  runWithBall,
  station,
  wallRebound,
  markedTarget,
  decisionZone,
}

class _FootballSpec {
  const _FootballSpec({
    required this.focus,
    required this.context,
    required this.focusLabel,
    required this.contextLabel,
    required this.coachingCue,
    required this.icon,
  });

  final String focus;
  final _FootballContext context;
  final String focusLabel;
  final String contextLabel;
  final String coachingCue;
  final IconData icon;
}

_FootballSpec _footballSpec(String rawName) {
  final name = rawName.toLowerCase();
  final parts = name.split(':');
  final focus = parts.first.trim();
  final contextText = parts.length > 1 ? parts.sublist(1).join(':').trim() : '';

  _FootballContext context;
  IconData icon;
  String contextLabel;
  String cue;
  if (contextText.contains('parede') || contextText.contains('rebote')) {
    context = _FootballContext.wallRebound;
    icon = Icons.vertical_split_rounded;
    contextLabel = 'parede/rebote';
    cue = 'passe e receba';
  } else if (contextText.contains('duelo')) {
    context = _FootballContext.duel;
    icon = Icons.sports_kabaddi_rounded;
    contextLabel = 'duelo';
    cue = 'vença o marcador';
  } else if (contextText.contains('jogo reduzido')) {
    context = _FootballContext.smallGame;
    icon = Icons.groups_rounded;
    contextLabel = 'jogo reduzido';
    cue = 'apoio e decisão';
  } else if (contextText.contains('rondo')) {
    context = _FootballContext.rondo;
    icon = Icons.sync_rounded;
    contextLabel = 'rondo';
    cue = 'passe rapido';
  } else if (contextText.contains('sequ')) {
    context = _FootballContext.sequence;
    icon = Icons.format_list_numbered_rounded;
    contextLabel = 'sequencia';
    cue = 'ordem limpa';
  } else if (contextText.contains('pontos')) {
    context = _FootballContext.points;
    icon = Icons.stars_rounded;
    contextLabel = 'pontos';
    cue = 'mire nos alvos';
  } else if (contextText.contains('ondas')) {
    context = _FootballContext.attackWaves;
    icon = Icons.double_arrow_rounded;
    contextLabel = 'ondas';
    cue = 'ataque em fluxo';
  } else if (contextText.contains('corrida com bola')) {
    context = _FootballContext.runWithBall;
    icon = Icons.directions_run_rounded;
    contextLabel = 'corrida com bola';
    cue = 'bola no passo';
  } else if (contextText.contains('esta')) {
    context = _FootballContext.station;
    icon = Icons.adjust_rounded;
    contextLabel = 'estacao';
    cue = 'repeticao solo';
  } else if (contextText.contains('alvo')) {
    context = _FootballContext.markedTarget;
    icon = Icons.gps_fixed_rounded;
    contextLabel = 'alvo';
    cue = 'precisao';
  } else if (contextText.contains('decis')) {
    context = _FootballContext.decisionZone;
    icon = Icons.call_split_rounded;
    contextLabel = 'decisao';
    cue = 'escolha rota';
  } else {
    context = _FootballContext.cones;
    icon = Icons.route_rounded;
    contextLabel = 'cones';
    cue = 'zig-zag curto';
  }

  return _FootballSpec(
    focus: focus,
    context: context,
    focusLabel: _compactLabel(focus),
    contextLabel: contextLabel,
    coachingCue: cue,
    icon: icon,
  );
}

String _compactLabel(String text) {
  final cleaned = text.replaceAll('resistencia', 'resist.');
  if (cleaned.length <= 18) return cleaned;
  return '${cleaned.substring(0, 16)}...';
}

List<_DemoLabel> _demoLabels(Exercise exercise) {
  final name = exercise.name.toLowerCase();
  final football = _footballSpec(name);
  if (exercise.category == 'Futebol') {
    return [
      _DemoLabel(Icons.sports_soccer_rounded, football.focusLabel),
      _DemoLabel(football.icon, football.contextLabel),
      _DemoLabel(Icons.route_rounded, football.coachingCue),
    ];
  }
  return switch (exercise.category) {
    'Karate' => [
      const _DemoLabel(Icons.sports_martial_arts_rounded, 'base firme'),
      _DemoLabel(
        name.contains('chute')
            ? Icons.arrow_upward_rounded
            : Icons.arrow_forward_rounded,
        name.contains('chute') ? 'linha do chute' : 'linha do golpe',
      ),
      const _DemoLabel(Icons.shield_rounded, 'guarda ativa'),
    ],
    'Corrida e resistencia' => [
      const _DemoLabel(Icons.directions_run_rounded, 'postura alta'),
      const _DemoLabel(Icons.timeline_rounded, 'ritmo constante'),
      const _DemoLabel(Icons.health_and_safety_rounded, 'Health para metricas'),
    ],
    'Forca' => [
      _DemoLabel(
        name.contains('agach')
            ? Icons.vertical_align_bottom_rounded
            : Icons.swap_vert_rounded,
        name.contains('agach') ? 'quadril para tras' : 'subida e descida',
      ),
      const _DemoLabel(Icons.accessibility_new_rounded, 'tronco estavel'),
      const _DemoLabel(Icons.repeat_rounded, 'repeticoes limpas'),
    ],
    'Mobilidade' => [
      const _DemoLabel(Icons.self_improvement_rounded, 'amplitude sem dor'),
      const _DemoLabel(Icons.air_rounded, 'respiracao'),
      const _DemoLabel(Icons.timer_rounded, 'segurar com controle'),
    ],
    'Volei' => [
      const _DemoLabel(Icons.sports_volleyball_rounded, 'contato alto'),
      const _DemoLabel(Icons.grid_3x3_rounded, 'rede/alvo'),
      const _DemoLabel(Icons.open_with_rounded, 'base baixa'),
    ],
    'Parkour seguro' => [
      const _DemoLabel(Icons.landscape_rounded, 'obstaculo baixo'),
      const _DemoLabel(
        Icons.keyboard_double_arrow_down_rounded,
        'aterrissagem suave',
      ),
      const _DemoLabel(Icons.stairs_rounded, 'progressao segura'),
    ],
    _ => [
      const _DemoLabel(Icons.visibility_rounded, 'observe a forma'),
      const _DemoLabel(Icons.repeat_rounded, 'repita devagar'),
      const _DemoLabel(Icons.speed_rounded, 'aumente aos poucos'),
    ],
  };
}

class _ExerciseDemoPainter extends CustomPainter {
  const _ExerciseDemoPainter({
    required this.category,
    required this.name,
    required this.angle,
    required this.progress,
  });

  final String category;
  final String name;
  final ExerciseDemoAngle angle;
  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    _drawBackground(canvas, size);
    _drawAngleLabel(canvas, angle);
    switch (category) {
      case 'Futebol':
        _drawFootball(canvas, size);
      case 'Karate':
        _drawKarate(canvas, size);
      case 'Corrida e resistencia':
        _drawRunning(canvas, size);
      case 'Forca':
        _drawStrength(canvas, size);
      case 'Mobilidade':
        _drawMobility(canvas, size);
      case 'Volei':
        _drawVolleyball(canvas, size);
      case 'Parkour seguro':
        _drawParkour(canvas, size);
      default:
        _drawGeneric(canvas, size);
    }
  }

  @override
  bool shouldRepaint(covariant _ExerciseDemoPainter oldDelegate) {
    return oldDelegate.category != category ||
        oldDelegate.name != name ||
        oldDelegate.angle != angle ||
        oldDelegate.progress != progress;
  }

  void _drawBackground(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final gradient = LinearGradient(
      colors: [AppTheme.surfaceSoft, AppTheme.surface, AppTheme.background],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
    canvas.drawRect(rect, Paint()..shader = gradient.createShader(rect));
    final gridPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.035)
      ..strokeWidth = 1;
    for (var x = 24.0; x < size.width; x += 36) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), gridPaint);
    }
    for (var y = 24.0; y < size.height; y += 36) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }
  }

  void _drawFootball(Canvas canvas, Size size) {
    final spec = _footballSpec(name);
    if (spec.context == _FootballContext.cones &&
        angle == ExerciseDemoAngle.side) {
      _drawFootballSide(canvas, size, spec);
      return;
    }
    if (spec.context == _FootballContext.cones &&
        angle == ExerciseDemoAngle.front) {
      _drawFootballFront(canvas, size, spec);
      return;
    }
    switch (spec.context) {
      case _FootballContext.wallRebound:
        _drawFootballWallRebound(canvas, size, spec);
      case _FootballContext.duel:
        _drawFootballDuel(canvas, size, spec);
      case _FootballContext.smallGame:
        _drawFootballSmallGame(canvas, size, spec);
      case _FootballContext.rondo:
        _drawFootballRondo(canvas, size, spec);
      case _FootballContext.sequence:
        _drawFootballSequence(canvas, size, spec);
      case _FootballContext.points:
        _drawFootballPoints(canvas, size, spec);
      case _FootballContext.attackWaves:
        _drawFootballAttackWaves(canvas, size, spec);
      case _FootballContext.runWithBall:
        _drawFootballRunWithBall(canvas, size, spec);
      case _FootballContext.station:
        _drawFootballStation(canvas, size, spec);
      case _FootballContext.markedTarget:
        _drawFootballMarkedTarget(canvas, size, spec);
      case _FootballContext.decisionZone:
        _drawFootballDecisionZone(canvas, size, spec);
      case _FootballContext.cones:
        _drawFootballCones(canvas, size, spec);
    }
  }

  void _drawFootballCones(Canvas canvas, Size size, _FootballSpec spec) {
    _footballField(canvas, size);

    final points = [
      Offset(size.width * 0.18, size.height * 0.56),
      Offset(size.width * 0.32, size.height * 0.38),
      Offset(size.width * 0.47, size.height * 0.56),
      Offset(size.width * 0.62, size.height * 0.38),
      Offset(size.width * 0.78, size.height * 0.56),
    ];
    _drawPath(canvas, points, AppTheme.primary);
    for (final point in points) {
      _drawCone(canvas, point);
    }
    _drawBall(canvas, _pointOnPath(points, progress));
    _drawFocusBadge(canvas, size, spec);
    _drawText(canvas, 'zig-zag', Offset(size.width * 0.46, size.height * 0.18));
  }

  void _drawFootballWallRebound(Canvas canvas, Size size, _FootballSpec spec) {
    final field = _footballField(canvas, size);
    final wallX = size.width * 0.82;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(wallX, field.top + 20, 12, field.height - 40),
        const Radius.circular(4),
      ),
      Paint()..color = AppTheme.warning.withValues(alpha: 0.85),
    );
    final start = Offset(size.width * 0.24, size.height * 0.52);
    final wallHit = Offset(wallX - 10, size.height * 0.36);
    final rebound = Offset(size.width * 0.35, size.height * 0.33);
    _drawPlayerDot(canvas, start.translate(-20, 26), AppTheme.primary);
    if (spec.focus.contains('contra')) {
      _drawPlayerDot(
        canvas,
        Offset(size.width * 0.46, size.height * 0.5),
        AppTheme.danger,
      );
      _drawText(
        canvas,
        spec.focusLabel,
        Offset(size.width * 0.38, size.height * 0.61),
      );
    }
    _drawPath(canvas, [start, wallHit, rebound], AppTheme.primary);
    _drawBall(canvas, _pointOnPath([start, wallHit, rebound], progress));
    _drawText(canvas, 'parede', Offset(wallX - 22, field.top + 4));
    _drawText(canvas, 'rebote', Offset(size.width * 0.52, size.height * 0.25));
  }

  void _drawFootballDuel(Canvas canvas, Size size, _FootballSpec spec) {
    _footballField(canvas, size);
    final attacker = Offset(size.width * 0.25, size.height * 0.5);
    final defender = Offset(size.width * 0.5, size.height * 0.48);
    final goal = Rect.fromLTWH(size.width * 0.78, size.height * 0.37, 34, 54);
    canvas.drawRect(
      goal,
      Paint()..color = Colors.white.withValues(alpha: 0.16),
    );
    _drawPlayerDot(canvas, attacker, AppTheme.primary);
    _drawPlayerDot(canvas, defender, AppTheme.danger);
    _drawPath(canvas, [
      attacker.translate(20, 0),
      Offset(size.width * 0.42, size.height * (0.38 + progress * 0.1)),
      Offset(size.width * 0.66, size.height * 0.52),
      Offset(size.width * 0.81, size.height * 0.44),
    ], AppTheme.primary);
    _drawBall(
      canvas,
      _pointOnPath([
        attacker.translate(20, 0),
        Offset(size.width * 0.42, size.height * 0.38),
        Offset(size.width * 0.66, size.height * 0.52),
        Offset(size.width * 0.81, size.height * 0.44),
      ], progress),
    );
    _drawText(
      canvas,
      'drible / protecao',
      Offset(size.width * 0.34, size.height * 0.22),
    );
  }

  void _drawFootballSmallGame(Canvas canvas, Size size, _FootballSpec spec) {
    final field = _footballField(canvas, size);
    final players = [
      (Offset(size.width * 0.28, size.height * 0.38), AppTheme.primary),
      (Offset(size.width * 0.34, size.height * 0.56), AppTheme.primary),
      (Offset(size.width * 0.58, size.height * 0.42), AppTheme.danger),
      (Offset(size.width * 0.64, size.height * 0.58), AppTheme.danger),
    ];
    for (final player in players) {
      _drawPlayerDot(canvas, player.$1, player.$2);
    }
    _drawMiniGoal(canvas, Offset(field.left + 8, size.height * 0.45), false);
    _drawMiniGoal(canvas, Offset(field.right - 8, size.height * 0.45), true);
    _drawPath(canvas, [
      players[0].$1,
      Offset(size.width * 0.48, size.height * 0.32),
      players[1].$1,
      Offset(size.width * 0.78, size.height * 0.48),
    ], AppTheme.primary);
    _drawBall(
      canvas,
      _pointOnPath([
        players[0].$1,
        players[1].$1,
        Offset(size.width * 0.78, size.height * 0.48),
      ], progress),
    );
    _drawText(
      canvas,
      'jogo reduzido',
      Offset(size.width * 0.39, field.top + 8),
    );
  }

  void _drawFootballRondo(Canvas canvas, Size size, _FootballSpec spec) {
    _footballField(canvas, size);
    final center = Offset(size.width * 0.5, size.height * 0.44);
    final radius = size.width * 0.23;
    final players = List.generate(5, (i) {
      final a = -math.pi / 2 + i * math.pi * 2 / 5;
      return Offset(
        center.dx + math.cos(a) * radius,
        center.dy + math.sin(a) * radius,
      );
    });
    for (final point in players) {
      _drawPlayerDot(canvas, point, AppTheme.primary);
    }
    _drawPlayerDot(canvas, center, AppTheme.danger);
    final from = players[(progress * players.length).floor() % players.length];
    final to =
        players[((progress * players.length).floor() + 1) % players.length];
    _drawArrow(canvas, from, to, AppTheme.primary);
    _drawBall(
      canvas,
      Offset(
        _lerp(from.dx, to.dx, (progress * players.length) % 1),
        _lerp(from.dy, to.dy, (progress * players.length) % 1),
      ),
    );
    _drawText(
      canvas,
      '1 defensor no meio',
      Offset(size.width * 0.34, size.height * 0.68),
    );
  }

  void _drawFootballSequence(Canvas canvas, Size size, _FootballSpec spec) {
    _footballField(canvas, size);
    final stations = [
      Offset(size.width * 0.22, size.height * 0.52),
      Offset(size.width * 0.4, size.height * 0.35),
      Offset(size.width * 0.58, size.height * 0.52),
      Offset(size.width * 0.76, size.height * 0.35),
    ];
    for (final entry in stations.indexed) {
      _drawCone(canvas, entry.$2);
      _drawText(canvas, '${entry.$1 + 1}', entry.$2.translate(-8, 18));
    }
    _drawPath(canvas, stations, AppTheme.primary);
    _drawBall(canvas, _pointOnPath(stations, progress));
    _drawText(
      canvas,
      'sequencia tecnica',
      Offset(size.width * 0.36, size.height * 0.19),
    );
  }

  void _drawFootballPoints(Canvas canvas, Size size, _FootballSpec spec) {
    _footballField(canvas, size);
    final targets = [
      (Offset(size.width * 0.3, size.height * 0.35), '1'),
      (Offset(size.width * 0.54, size.height * 0.48), '2'),
      (Offset(size.width * 0.75, size.height * 0.33), '3'),
    ];
    for (final target in targets) {
      _drawTarget(canvas, target.$1, 24, target.$2);
    }
    final start = Offset(size.width * 0.2, size.height * 0.6);
    final active =
        targets[(progress * targets.length).floor() % targets.length].$1;
    _drawPlayerDot(canvas, start, AppTheme.primary);
    _drawArrow(canvas, start, active, AppTheme.primary);
    _drawBall(
      canvas,
      Offset(
        _lerp(start.dx, active.dx, progress),
        _lerp(start.dy, active.dy, progress),
      ),
    );
    _drawText(
      canvas,
      'desafio por pontos',
      Offset(size.width * 0.33, size.height * 0.19),
    );
  }

  void _drawFootballAttackWaves(Canvas canvas, Size size, _FootballSpec spec) {
    final field = _footballField(canvas, size);
    _drawMiniGoal(canvas, Offset(field.right - 10, size.height * 0.43), true);
    for (var i = 0; i < 3; i++) {
      final start = Offset(
        size.width * (0.2 + i * 0.08),
        size.height * (0.32 + i * 0.12),
      );
      final end = Offset(size.width * 0.78, size.height * 0.44);
      _drawPlayerDot(canvas, start, AppTheme.primary);
      _drawArrow(
        canvas,
        start,
        end.translate(-i * 12, i * 8),
        AppTheme.primary.withValues(alpha: 0.72),
      );
    }
    _drawBall(
      canvas,
      Offset(
        size.width * (0.25 + progress * 0.52),
        size.height * (0.55 - progress * 0.12),
      ),
    );
    _drawText(
      canvas,
      'ondas de ataque',
      Offset(size.width * 0.36, size.height * 0.18),
    );
  }

  void _drawFootballRunWithBall(Canvas canvas, Size size, _FootballSpec spec) {
    _footballField(canvas, size);
    final laneY = size.height * 0.48;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.18, laneY - 34, size.width * 0.64, 68),
        const Radius.circular(14),
      ),
      Paint()..color = AppTheme.primary.withValues(alpha: 0.08),
    );
    final start = Offset(size.width * 0.22, laneY);
    final end = Offset(size.width * 0.8, laneY);
    _drawArrow(canvas, start, end, AppTheme.primary);
    _drawPlayerDot(
      canvas,
      Offset(_lerp(start.dx, end.dx, progress), laneY - 26),
      AppTheme.primary,
    );
    _drawBall(canvas, Offset(_lerp(start.dx, end.dx, progress), laneY + 18));
    _drawText(
      canvas,
      'corrida com bola',
      Offset(size.width * 0.36, size.height * 0.22),
    );
  }

  void _drawFootballStation(Canvas canvas, Size size, _FootballSpec spec) {
    _footballField(canvas, size);
    final station = Offset(size.width * 0.5, size.height * 0.45);
    _drawTarget(canvas, station, 44, 'estacao');
    _drawPlayerDot(
      canvas,
      Offset(size.width * 0.25, size.height * 0.58),
      AppTheme.primary,
    );
    _drawBall(
      canvas,
      Offset(
        size.width * (0.25 + progress * 0.25),
        size.height * (0.58 - progress * 0.13),
      ),
    );
    _drawText(
      canvas,
      'repeticao individual',
      Offset(size.width * 0.34, size.height * 0.2),
    );
  }

  void _drawFootballMarkedTarget(Canvas canvas, Size size, _FootballSpec spec) {
    _footballField(canvas, size);
    final target = Offset(size.width * 0.72, size.height * 0.42);
    _drawTarget(canvas, target, 40, 'alvo');
    final start = Offset(size.width * 0.25, size.height * 0.58);
    _drawPlayerDot(canvas, start, AppTheme.primary);
    _drawArrow(canvas, start, target, AppTheme.primary);
    _drawBall(
      canvas,
      Offset(
        _lerp(start.dx, target.dx, progress),
        _lerp(start.dy, target.dy, progress),
      ),
    );
    _drawText(
      canvas,
      'alvo marcado',
      Offset(size.width * 0.39, size.height * 0.2),
    );
  }

  void _drawFootballDecisionZone(Canvas canvas, Size size, _FootballSpec spec) {
    _footballField(canvas, size);
    final origin = Offset(size.width * 0.28, size.height * 0.52);
    final left = Offset(size.width * 0.68, size.height * 0.34);
    final right = Offset(size.width * 0.7, size.height * 0.58);
    _drawPlayerDot(canvas, origin, AppTheme.primary);
    _drawTarget(canvas, left, 24, 'A');
    _drawTarget(canvas, right, 24, 'B');
    _drawArrow(canvas, origin, left, AppTheme.secondary);
    _drawArrow(canvas, origin, right, AppTheme.primary);
    _drawBall(
      canvas,
      _pointOnPath([
        origin,
        progress < 0.5 ? left : right,
      ], progress < 0.5 ? progress * 2 : (progress - 0.5) * 2),
    );
    _drawText(
      canvas,
      'decida: A ou B',
      Offset(size.width * 0.38, size.height * 0.2),
    );
  }

  void _drawFootballSide(Canvas canvas, Size size, _FootballSpec spec) {
    if (spec.context == _FootballContext.wallRebound) {
      _drawFootballWallRebound(canvas, size, spec);
      return;
    }
    final ground = size.height * 0.64;
    _drawFloor(canvas, size, ground);
    final coneXs = [
      size.width * 0.22,
      size.width * 0.36,
      size.width * 0.5,
      size.width * 0.64,
      size.width * 0.78,
    ];
    for (final x in coneXs) {
      _drawCone(canvas, Offset(x, ground));
    }
    final x = _lerp(coneXs.first, coneXs.last, progress);
    final y = ground - 22 - math.sin(progress * math.pi * 4).abs() * 16;
    _drawBall(canvas, Offset(x, y));
    _drawArrow(
      canvas,
      Offset(size.width * 0.18, ground - 70),
      Offset(size.width * 0.82, ground - 70),
      AppTheme.primary,
    );
    _drawText(
      canvas,
      'meio metro entre cones',
      Offset(size.width * 0.36, ground - 112),
    );
  }

  Rect _footballField(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(26, 28, size.width - 52, size.height * 0.58);
    final field = RRect.fromRectAndRadius(rect, const Radius.circular(18));
    canvas.drawRRect(
      field,
      Paint()..color = const Color(0xFF123D35).withValues(alpha: 0.92),
    );
    final linePaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.36)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawRRect(field, linePaint);
    canvas.drawCircle(
      Offset(size.width * 0.52, size.height * 0.32),
      28,
      linePaint,
    );
    return rect;
  }

  void _drawPlayerDot(Canvas canvas, Offset center, Color color) {
    canvas.drawCircle(center, 13, Paint()..color = color);
    canvas.drawCircle(
      center,
      17,
      Paint()
        ..color = color.withValues(alpha: 0.18)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4,
    );
  }

  void _drawMiniGoal(Canvas canvas, Offset center, bool rightSide) {
    final rect = Rect.fromCenter(center: center, width: 14, height: 58);
    canvas.drawRect(
      rect,
      Paint()
        ..color = Colors.white.withValues(alpha: 0.22)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3,
    );
    final netX = rightSide ? rect.right : rect.left;
    canvas.drawLine(
      Offset(netX, rect.top),
      Offset(netX + (rightSide ? 8 : -8), rect.center.dy),
      Paint()
        ..color = Colors.white.withValues(alpha: 0.2)
        ..strokeWidth = 2,
    );
  }

  void _drawTarget(Canvas canvas, Offset center, double radius, String label) {
    for (var i = 0; i < 3; i++) {
      canvas.drawCircle(
        center,
        radius - i * radius * 0.28,
        Paint()
          ..color = (i.isEven ? AppTheme.warning : AppTheme.primary).withValues(
            alpha: 0.18,
          )
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3,
      );
    }
    _drawText(canvas, label, center.translate(-18, radius + 6));
  }

  void _drawFocusBadge(Canvas canvas, Size size, _FootballSpec spec) {
    _drawText(
      canvas,
      spec.focusLabel,
      Offset(size.width * 0.16, size.height * 0.68),
    );
  }

  void _drawFootballFront(Canvas canvas, Size size, _FootballSpec spec) {
    if (spec.context == _FootballContext.wallRebound) {
      _drawFootballWallRebound(canvas, size, spec);
      return;
    }
    final ground = size.height * 0.68;
    _drawFloor(canvas, size, ground);
    for (var i = 0; i < 5; i++) {
      final scale = 1.0 - i * 0.11;
      final y = ground - i * 28;
      final left = Offset(size.width * (0.34 + i * 0.018), y);
      final right = Offset(size.width * (0.66 - i * 0.018), y);
      _drawCone(canvas, left);
      _drawCone(canvas, right);
      canvas.drawLine(
        left.translate(14, -10),
        right.translate(-14, -10),
        Paint()
          ..color = Colors.white.withValues(alpha: 0.12)
          ..strokeWidth = 2 * scale,
      );
    }
    final laneX = size.width * (0.5 + math.sin(progress * math.pi * 4) * 0.11);
    final laneY = _lerp(ground - 6, ground - 116, progress);
    _drawBall(canvas, Offset(laneX, laneY));
    _drawText(
      canvas,
      'entre os cones',
      Offset(size.width * 0.34, ground - 152),
    );
  }

  void _drawKarate(Canvas canvas, Size size) {
    final lower = name.toLowerCase();
    if (lower.contains('dachi') || lower.contains('base')) {
      _drawKarateBase(canvas, size, lower);
      return;
    }
    if (lower.contains('geri')) {
      _drawKarateKick(canvas, size, lower);
      return;
    }
    if (lower.contains('uke') || lower.contains('barai')) {
      _drawKarateBlock(canvas, size, lower);
      return;
    }
    if (lower.contains('kihon') || lower.contains('kata')) {
      _drawKarateSequence(canvas, size, lower);
      return;
    }
    if (lower.contains('kumite') ||
        lower.contains('dist') ||
        lower.contains('entrada') ||
        lower.contains('saida')) {
      _drawKarateKumite(canvas, size, lower);
      return;
    }
    if (lower.contains('respira') || lower.contains('kiai')) {
      _drawBreathing(canvas, size);
      return;
    }
    final ground = size.height * 0.66;
    _drawFloor(canvas, size, ground);
    final base = Offset(size.width * 0.44, ground - 48);
    _drawPerson(
      canvas: canvas,
      head: base.translate(0, -42),
      body: base,
      leftHand: base.translate(-54, -24),
      rightHand: base.translate(70, -28),
      leftFoot: Offset(size.width * 0.27, ground),
      rightFoot: Offset(size.width * 0.64, ground),
    );
    _drawArrow(
      canvas,
      base.translate(34, -28),
      Offset(size.width * (0.74 + progress * 0.08), ground - 82),
      AppTheme.warning,
    );
    _drawText(canvas, 'golpe', Offset(size.width * 0.72, ground - 112));
  }

  void _drawRunning(Canvas canvas, Size size) {
    final lower = name.toLowerCase();
    if (lower.contains('subida')) {
      _drawHillRun(canvas, size);
      return;
    }
    if (lower.contains('intervalado')) {
      _drawIntervalRun(canvas, size, lower);
      return;
    }
    if (lower.contains('skipping') || lower.contains('dribbling')) {
      _drawRunningDrill(canvas, size, lower);
      return;
    }
    if (lower.contains('strides')) {
      _drawStrideRun(canvas, size);
      return;
    }
    if (lower.contains('progressiva')) {
      _drawProgressiveRun(canvas, size);
      return;
    }
    if (lower.contains('fartlek')) {
      _drawFartlekRun(canvas, size);
      return;
    }
    if (lower.contains('teste')) {
      _drawPaceTest(canvas, size);
      return;
    }
    final trackPaint = Paint()
      ..color = AppTheme.secondary.withValues(alpha: 0.18)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 18
      ..strokeCap = StrokeCap.round;
    for (var i = 0; i < 3; i++) {
      final inset = 38.0 + i * 22;
      canvas.drawArc(
        Rect.fromLTWH(
          inset,
          32 + i * 8,
          size.width - inset * 2,
          size.height * 0.72,
        ),
        3.2,
        2.45,
        false,
        trackPaint..strokeWidth = 12,
      );
    }
    final center = Offset(size.width * 0.52, size.height * 0.42);
    final stride = math.sin(progress * math.pi * 2) * 12;
    _drawPerson(
      canvas: canvas,
      head: center.translate(0, -40),
      body: center,
      leftHand: center.translate(-38, -12),
      rightHand: center.translate(42, -20),
      leftFoot: center.translate(-46 + stride, 52),
      rightFoot: center.translate(54 - stride, 42),
    );
    _drawArrow(
      canvas,
      center.translate(-80, 64),
      center.translate(92, 20),
      AppTheme.primary,
    );
  }

  void _drawKarateBase(Canvas canvas, Size size, String lower) {
    final ground = size.height * 0.68;
    _drawFloor(canvas, size, ground);
    final wide = lower.contains('kiba');
    final back = lower.contains('kokutsu');
    final body = Offset(size.width * 0.5, ground - 82);
    _drawPerson(
      canvas: canvas,
      head: body.translate(0, -58),
      body: body,
      leftHand: body.translate(-42, -20),
      rightHand: body.translate(42, -20),
      leftFoot: Offset(
        size.width *
            (wide
                ? 0.28
                : back
                ? 0.34
                : 0.25),
        ground,
      ),
      rightFoot: Offset(
        size.width *
            (wide
                ? 0.72
                : back
                ? 0.62
                : 0.7),
        ground - (back ? 16 : 0),
      ),
    );
    _drawText(
      canvas,
      wide
          ? 'kiba: base aberta'
          : back
          ? 'kokutsu: peso atras'
          : 'zenkutsu: peso a frente',
      Offset(size.width * 0.26, ground - 146),
    );
  }

  void _drawKarateKick(Canvas canvas, Size size, String lower) {
    final ground = size.height * 0.68;
    _drawFloor(canvas, size, ground);
    final base = Offset(size.width * 0.42, ground - 72);
    final target = lower.contains('mawashi')
        ? Offset(size.width * 0.78, ground - 100)
        : lower.contains('yoko')
        ? Offset(size.width * 0.82, ground - 72)
        : Offset(size.width * 0.68, ground - 120);
    _drawPerson(
      canvas: canvas,
      head: base.translate(0, -58),
      body: base,
      leftHand: base.translate(-42, -24),
      rightHand: base.translate(36, -30),
      leftFoot: base.translate(-36, 72),
      rightFoot: Offset(
        _lerp(base.dx + 22, target.dx, progress),
        _lerp(base.dy + 42, target.dy, progress),
      ),
    );
    _drawTarget(canvas, target, 22, 'alvo');
    _drawArrow(canvas, base.translate(28, 26), target, AppTheme.warning);
    _drawText(
      canvas,
      lower.contains('mawashi')
          ? 'chute circular'
          : lower.contains('yoko')
          ? 'chute lateral'
          : 'chute frontal',
      Offset(size.width * 0.48, ground - 152),
    );
  }

  void _drawKarateBlock(Canvas canvas, Size size, String lower) {
    final ground = size.height * 0.68;
    _drawFloor(canvas, size, ground);
    final base = Offset(size.width * 0.46, ground - 72);
    final hand = lower.contains('age')
        ? base.translate(30, -92)
        : lower.contains('gedan')
        ? base.translate(44, 10)
        : base.translate(62, -28);
    _drawPerson(
      canvas: canvas,
      head: base.translate(0, -58),
      body: base,
      leftHand: base.translate(-42, -24),
      rightHand: hand,
      leftFoot: base.translate(-42, 72),
      rightFoot: base.translate(48, 72),
    );
    _drawArrow(canvas, base.translate(20, -20), hand, AppTheme.warning);
    _drawText(
      canvas,
      lower.contains('age')
          ? 'defesa alta'
          : lower.contains('gedan')
          ? 'defesa baixa'
          : 'defesa media',
      Offset(size.width * 0.5, ground - 144),
    );
  }

  void _drawKarateSequence(Canvas canvas, Size size, String lower) {
    final y = size.height * 0.45;
    final points = [
      Offset(size.width * 0.22, y),
      Offset(size.width * 0.42, y - 32),
      Offset(size.width * 0.62, y + 18),
      Offset(size.width * 0.8, y - 20),
    ];
    for (final entry in points.indexed) {
      _drawTarget(canvas, entry.$2, 22, '${entry.$1 + 1}');
    }
    _drawPath(canvas, points, AppTheme.primary);
    _drawText(
      canvas,
      lower.contains('kata') ? 'blocos do kata' : 'kihon em ordem',
      Offset(size.width * 0.34, size.height * 0.68),
    );
  }

  void _drawKarateKumite(Canvas canvas, Size size, String lower) {
    final ground = size.height * 0.68;
    _drawFloor(canvas, size, ground);
    final you = Offset(size.width * (0.3 + progress * 0.08), ground - 70);
    final other = Offset(size.width * 0.72, ground - 70);
    _drawPlayerDot(canvas, you, AppTheme.primary);
    _drawPlayerDot(canvas, other, AppTheme.danger);
    _drawArrow(
      canvas,
      you.translate(20, -12),
      other.translate(-24, -12),
      AppTheme.warning,
    );
    _drawText(
      canvas,
      lower.contains('dist')
          ? 'controle distancia'
          : lower.contains('entrada')
          ? 'entra e sai'
          : 'kumite sombra',
      Offset(size.width * 0.33, ground - 138),
    );
  }

  void _drawBreathing(Canvas canvas, Size size) {
    final center = Offset(size.width * 0.5, size.height * 0.43);
    canvas.drawCircle(
      center,
      42 + progress * 24,
      Paint()..color = AppTheme.primary.withValues(alpha: 0.08),
    );
    _drawPerson(
      canvas: canvas,
      head: center.translate(0, -58),
      body: center,
      leftHand: center.translate(-38, -8),
      rightHand: center.translate(38, -8),
      leftFoot: center.translate(-34, 70),
      rightFoot: center.translate(34, 70),
    );
    _drawText(
      canvas,
      'inspira > kiai',
      Offset(size.width * 0.34, size.height * 0.68),
    );
  }

  void _drawHillRun(Canvas canvas, Size size) {
    final start = Offset(size.width * 0.18, size.height * 0.68);
    final end = Offset(size.width * 0.82, size.height * 0.28);
    _drawArrow(canvas, start, end, AppTheme.primary);
    canvas.drawLine(
      start,
      end,
      Paint()
        ..color = Colors.white.withValues(alpha: 0.18)
        ..strokeWidth = 8
        ..strokeCap = StrokeCap.round,
    );
    _drawPlayerDot(
      canvas,
      Offset(
        _lerp(start.dx, end.dx, progress),
        _lerp(start.dy, end.dy, progress),
      ),
      AppTheme.primary,
    );
    _drawText(
      canvas,
      'subida curta',
      Offset(size.width * 0.4, size.height * 0.2),
    );
  }

  void _drawIntervalRun(Canvas canvas, Size size, String lower) {
    final y = size.height * 0.48;
    final segments = lower.contains('30-30')
        ? ['30s forte', '30s leve']
        : ['1min forte', '1min leve'];
    for (var i = 0; i < 4; i++) {
      final rect = Rect.fromLTWH(
        size.width * (0.16 + i * 0.17),
        y - 28,
        size.width * 0.13,
        56,
      );
      canvas.drawRRect(
        RRect.fromRectAndRadius(rect, const Radius.circular(10)),
        Paint()
          ..color = (i.isEven ? AppTheme.warning : AppTheme.primary).withValues(
            alpha: 0.22,
          ),
      );
      _drawText(canvas, segments[i % 2], rect.topLeft.translate(4, -30));
    }
    final x = _lerp(size.width * 0.18, size.width * 0.78, progress);
    _drawPlayerDot(canvas, Offset(x, y), AppTheme.primary);
  }

  void _drawRunningDrill(Canvas canvas, Size size, String lower) {
    final ground = size.height * 0.66;
    _drawFloor(canvas, size, ground);
    final x = size.width * 0.5;
    final kneeLift = lower.contains('skipping') ? 58.0 : 34.0;
    _drawPerson(
      canvas: canvas,
      head: Offset(x, ground - 132),
      body: Offset(x, ground - 78),
      leftHand: Offset(x - 40, ground - 90),
      rightHand: Offset(x + 40, ground - 94),
      leftFoot: Offset(x - 30, ground),
      rightFoot: Offset(x + 34, ground - kneeLift - progress * 12),
    );
    _drawText(
      canvas,
      lower.contains('skipping') ? 'joelho alto' : 'passos curtos',
      Offset(size.width * 0.36, ground - 164),
    );
  }

  void _drawStrideRun(Canvas canvas, Size size) {
    final y = size.height * 0.5;
    _drawArrow(
      canvas,
      Offset(size.width * 0.18, y),
      Offset(size.width * 0.84, y),
      AppTheme.primary,
    );
    for (var i = 0; i < 5; i++) {
      final x = size.width * (0.22 + i * 0.13);
      canvas.drawLine(
        Offset(x, y + 34),
        Offset(x + 28, y + 34),
        Paint()
          ..color = AppTheme.warning.withValues(alpha: 0.6)
          ..strokeWidth = 3,
      );
    }
    _drawPlayerDot(
      canvas,
      Offset(size.width * (0.2 + progress * 0.62), y - 22),
      AppTheme.primary,
    );
    _drawText(canvas, 'aceleracoes curtas', Offset(size.width * 0.34, y - 82));
  }

  void _drawProgressiveRun(Canvas canvas, Size size) {
    final y = size.height * 0.5;
    for (var i = 0; i < 4; i++) {
      final start = Offset(size.width * (0.16 + i * 0.16), y + 34 - i * 16);
      final end = Offset(size.width * (0.28 + i * 0.16), y + 24 - i * 16);
      _drawArrow(
        canvas,
        start,
        end,
        i < 2 ? AppTheme.primary : AppTheme.warning,
      );
    }
    _drawPlayerDot(
      canvas,
      Offset(size.width * (0.18 + progress * 0.62), y + 34 - progress * 62),
      AppTheme.primary,
    );
    _drawText(
      canvas,
      'ritmo sobe aos poucos',
      Offset(size.width * 0.32, y - 90),
    );
  }

  void _drawFartlekRun(Canvas canvas, Size size) {
    final points = [
      Offset(size.width * 0.16, size.height * 0.58),
      Offset(size.width * 0.32, size.height * 0.38),
      Offset(size.width * 0.48, size.height * 0.56),
      Offset(size.width * 0.66, size.height * 0.34),
      Offset(size.width * 0.84, size.height * 0.5),
    ];
    _drawPath(canvas, points, AppTheme.primary);
    _drawBall(canvas, _pointOnPath(points, progress));
    _drawText(
      canvas,
      'ritmos variados',
      Offset(size.width * 0.36, size.height * 0.22),
    );
  }

  void _drawPaceTest(Canvas canvas, Size size) {
    _drawTarget(
      canvas,
      Offset(size.width * 0.5, size.height * 0.42),
      58,
      'ritmo',
    );
    _drawArrow(
      canvas,
      Offset(size.width * 0.22, size.height * 0.62),
      Offset(size.width * 0.78, size.height * 0.62),
      AppTheme.primary,
    );
    _drawPlayerDot(
      canvas,
      Offset(size.width * (0.22 + progress * 0.56), size.height * 0.62),
      AppTheme.primary,
    );
    _drawText(
      canvas,
      'confortavel e constante',
      Offset(size.width * 0.3, size.height * 0.2),
    );
  }

  void _drawStrength(Canvas canvas, Size size) {
    final lower = name.toLowerCase();
    if (lower.contains('agach')) {
      _drawSquat(canvas, size);
      return;
    }
    if (lower.contains('flex')) {
      _drawPushUp(canvas, size, inclined: lower.contains('inclinada'));
      return;
    }
    if (lower.contains('prancha lateral')) {
      _drawSidePlank(canvas, size);
      return;
    }
    if (lower.contains('prancha frontal')) {
      _drawPlank(canvas, size);
      return;
    }
    if (lower.contains('avan') || lower.contains('afundo')) {
      _drawLunge(canvas, size, reverse: lower.contains('reverso'));
      return;
    }
    if (lower.contains('eleva') && lower.contains('quadril')) {
      _drawGluteBridge(canvas, size);
      return;
    }
    if (lower.contains('remada')) {
      _drawBackpackRow(canvas, size);
      return;
    }
    if (lower.contains('desenvolvimento')) {
      _drawOverheadPress(canvas, size);
      return;
    }
    if (lower.contains('panturrilha')) {
      _drawCalfRaise(canvas, size);
      return;
    }
    if (lower.contains('dead bug')) {
      _drawDeadBug(canvas, size);
      return;
    }
    if (lower.contains('superman')) {
      _drawSuperman(canvas, size);
      return;
    }
    if (lower.contains('pike')) {
      _drawPikePushUp(canvas, size);
      return;
    }
    if (lower.contains('isometria')) {
      _drawWallSit(canvas, size);
      return;
    }
    if (lower.contains('burpee')) {
      _drawBurpee(canvas, size);
      return;
    }
    if (lower.contains('good morning')) {
      _drawGoodMorning(canvas, size);
      return;
    }
    if (lower.contains('mountain')) {
      _drawMountainClimber(canvas, size);
      return;
    }
    if (lower.contains('hollow')) {
      _drawHollowHold(canvas, size);
      return;
    }
    _drawPushMovement(canvas, size);
  }

  void _drawMobility(Canvas canvas, Size size) {
    final lower = name.toLowerCase();
    if (lower.contains('tornozelo')) {
      _drawMobilityJoint(
        canvas,
        size,
        'tornozelo',
        Icons.directions_walk_rounded,
      );
      return;
    }
    if (lower.contains('quadril') || lower.contains('cossack')) {
      _drawMobilityJoint(
        canvas,
        size,
        'quadril',
        Icons.accessibility_new_rounded,
      );
      return;
    }
    if (lower.contains('tor') || lower.contains('peitoral')) {
      _drawMobilityRotation(
        canvas,
        size,
        lower.contains('peitoral') ? 'abre peito' : 'rota tronco',
      );
      return;
    }
    if (lower.contains('posterior') || lower.contains('flexor')) {
      _drawMobilityStretch(
        canvas,
        size,
        lower.contains('flexor') ? 'flexor do quadril' : 'posterior',
      );
      return;
    }
    if (lower.contains('ombro') || lower.contains('escapular')) {
      _drawMobilityShoulder(
        canvas,
        size,
        lower.contains('escapular') ? 'escapula sobe/desce' : 'ombro circular',
      );
      return;
    }
    if (lower.contains('cat') || lower.contains('cow')) {
      _drawCatCow(canvas, size);
      return;
    }
    if (lower.contains('punho')) {
      _drawMobilityJoint(canvas, size, 'punho', Icons.pan_tool_alt_rounded);
      return;
    }
    if (lower.contains('respira')) {
      _drawBreathing(canvas, size);
      return;
    }
    final ground = size.height * 0.68;
    _drawFloor(canvas, size, ground);
    final hip = Offset(size.width * 0.48, ground - 30);
    _drawLimb(canvas, hip.translate(0, -48), hip, AppTheme.primary, 8);
    canvas.drawCircle(
      hip.translate(0, -74),
      18,
      Paint()..color = AppTheme.primary,
    );
    _drawLimb(
      canvas,
      hip,
      Offset(size.width * 0.28, ground),
      AppTheme.primary,
      8,
    );
    _drawLimb(
      canvas,
      hip,
      Offset(size.width * 0.75, ground - 18),
      AppTheme.primary,
      8,
    );
    _drawLimb(
      canvas,
      hip.translate(0, -38),
      Offset(size.width * 0.68, ground - 66),
      AppTheme.primary,
      7,
    );
    _drawArrow(
      canvas,
      Offset(size.width * 0.55, ground - 72),
      Offset(size.width * 0.73, ground - 92),
      AppTheme.warning,
    );
  }

  void _drawVolleyball(Canvas canvas, Size size) {
    final lower = name.toLowerCase();
    if (lower.contains('parede')) {
      _drawVolleyballWall(
        canvas,
        size,
        lower.contains('manchete') ? 'manchete' : 'toque',
      );
      return;
    }
    if (lower.contains('saque')) {
      _drawVolleyballServe(canvas, size, lower.contains('baixo'));
      return;
    }
    if (lower.contains('deslocamento')) {
      _drawVolleyballLateral(canvas, size);
      return;
    }
    if (lower.contains('recep') || lower.contains('levantamento')) {
      _drawVolleyballTarget(
        canvas,
        size,
        lower.contains('levantamento') ? 'levantamento' : 'recepcao',
      );
      return;
    }
    if (lower.contains('ataque')) {
      _drawVolleyballAttack(canvas, size, lower.contains('aproxima'));
      return;
    }
    if (lower.contains('bloqueio')) {
      _drawVolleyballBlock(canvas, size);
      return;
    }
    if (lower.contains('defesa') || lower.contains('reacao')) {
      _drawVolleyballDefense(canvas, size, lower.contains('curta'));
      return;
    }
    if (lower.contains('tri')) {
      _drawVolleyballTriangle(canvas, size);
      return;
    }
    final court = Rect.fromLTWH(28, 34, size.width - 56, size.height * 0.58);
    canvas.drawRRect(
      RRect.fromRectAndRadius(court, const Radius.circular(16)),
      Paint()..color = AppTheme.secondary.withValues(alpha: 0.16),
    );
    final linePaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.34)
      ..strokeWidth = 2;
    canvas.drawLine(
      Offset(size.width * 0.5, 34),
      Offset(size.width * 0.5, size.height * 0.72),
      linePaint,
    );
    for (var y = 50.0; y < size.height * 0.7; y += 18) {
      canvas.drawLine(
        Offset(size.width * 0.48, y),
        Offset(size.width * 0.52, y),
        linePaint,
      );
    }
    _drawBall(canvas, Offset(size.width * 0.7, size.height * 0.3));
    _drawArrow(
      canvas,
      Offset(size.width * 0.28, size.height * 0.58),
      Offset(size.width * 0.7, size.height * 0.3),
      AppTheme.primary,
    );
  }

  void _drawParkour(Canvas canvas, Size size) {
    final lower = name.toLowerCase();
    if (lower.contains('aterrissagem')) {
      _drawParkourLanding(canvas, size);
      return;
    }
    if (lower.contains('rolamento')) {
      _drawParkourRoll(canvas, size);
      return;
    }
    if (lower.contains('precis')) {
      _drawParkourPrecision(canvas, size, lower.contains('salto'));
      return;
    }
    if (lower.contains('equil') || lower.contains('cat balance')) {
      _drawParkourBalance(canvas, size, lower.contains('cat'));
      return;
    }
    if (lower.contains('vault')) {
      _drawParkourVault(canvas, size, lower.contains('safety'));
      return;
    }
    if (lower.contains('quadrupedal')) {
      _drawParkourQuadrupedal(canvas, size);
      return;
    }
    if (lower.contains('subida') || lower.contains('descida')) {
      _drawParkourLevel(canvas, size, lower.contains('subida'));
      return;
    }
    if (lower.contains('tic-tac')) {
      _drawParkourTicTac(canvas, size);
      return;
    }
    if (lower.contains('mudan') || lower.contains('flow')) {
      _drawParkourFlow(canvas, size);
      return;
    }
    final ground = size.height * 0.72;
    _drawFloor(canvas, size, ground);
    final blockPaint = Paint()
      ..color = AppTheme.secondary.withValues(alpha: 0.38);
    final blocks = [
      Rect.fromLTWH(size.width * 0.16, ground - 34, 70, 34),
      Rect.fromLTWH(size.width * 0.42, ground - 72, 86, 72),
      Rect.fromLTWH(size.width * 0.72, ground - 46, 70, 46),
    ];
    for (final block in blocks) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(block, const Radius.circular(8)),
        blockPaint,
      );
    }
    _drawPath(canvas, [
      Offset(size.width * 0.22, ground - 56),
      Offset(size.width * 0.48, ground - 100),
      Offset(size.width * 0.78, ground - 72),
    ], AppTheme.primary);
    _drawText(
      canvas,
      'aterrisse leve',
      Offset(size.width * 0.58, ground - 132),
    );
  }

  void _drawMobilityJoint(
    Canvas canvas,
    Size size,
    String label,
    IconData icon,
  ) {
    final center = Offset(size.width * 0.5, size.height * 0.44);
    _drawTarget(canvas, center, 48, label);
    final radius = 70.0;
    final moving = Offset(
      center.dx + math.cos(progress * math.pi * 2) * radius,
      center.dy + math.sin(progress * math.pi * 2) * 32,
    );
    _drawArrow(canvas, center, moving, AppTheme.primary);
    _drawText(
      canvas,
      'circulos controlados',
      Offset(size.width * 0.31, size.height * 0.68),
    );
  }

  void _drawMobilityRotation(Canvas canvas, Size size, String label) {
    final ground = size.height * 0.66;
    _drawFloor(canvas, size, ground);
    final body = Offset(size.width * 0.5, ground - 74);
    _drawPerson(
      canvas: canvas,
      head: body.translate(0, -54),
      body: body,
      leftHand: body.translate(-70, -24),
      rightHand: body.translate(70 * math.sin(progress * math.pi), -38),
      leftFoot: body.translate(-32, 74),
      rightFoot: body.translate(32, 74),
    );
    _drawText(canvas, label, Offset(size.width * 0.36, ground - 142));
  }

  void _drawMobilityStretch(Canvas canvas, Size size, String label) {
    final ground = size.height * 0.68;
    _drawFloor(canvas, size, ground);
    final hip = Offset(size.width * 0.42, ground - 56);
    canvas.drawCircle(
      hip.translate(-58, -24),
      16,
      Paint()..color = AppTheme.primary,
    );
    _drawLimb(canvas, hip.translate(-42, -18), hip, AppTheme.primary, 9);
    _drawLimb(
      canvas,
      hip,
      Offset(size.width * 0.72, ground - 4),
      AppTheme.primary,
      9,
    );
    _drawLimb(
      canvas,
      hip,
      Offset(size.width * 0.32, ground),
      AppTheme.primary,
      9,
    );
    _drawArrow(
      canvas,
      Offset(size.width * 0.62, ground - 42),
      Offset(size.width * 0.78, ground - 22),
      AppTheme.warning,
    );
    _drawText(canvas, label, Offset(size.width * 0.38, ground - 122));
  }

  void _drawMobilityShoulder(Canvas canvas, Size size, String label) {
    final body = Offset(size.width * 0.5, size.height * 0.5);
    _drawPerson(
      canvas: canvas,
      head: body.translate(0, -58),
      body: body,
      leftHand: body.translate(-66, -20),
      rightHand: body.translate(
        66,
        -20 + math.sin(progress * math.pi * 2) * 24,
      ),
      leftFoot: body.translate(-32, 74),
      rightFoot: body.translate(32, 74),
    );
    _drawTarget(canvas, body.translate(66, -20), 32, label);
  }

  void _drawCatCow(Canvas canvas, Size size) {
    final ground = size.height * 0.68;
    _drawFloor(canvas, size, ground);
    final arch = math.sin(progress * math.pi * 2) * 24;
    final path = Path()
      ..moveTo(size.width * 0.28, ground - 48)
      ..quadraticBezierTo(
        size.width * 0.5,
        ground - 88 - arch,
        size.width * 0.72,
        ground - 48,
      );
    canvas.drawPath(
      path,
      Paint()
        ..color = AppTheme.primary
        ..strokeWidth = 9
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round,
    );
    canvas.drawCircle(
      Offset(size.width * 0.24, ground - 54),
      15,
      Paint()..color = AppTheme.primary,
    );
    _drawLimb(
      canvas,
      Offset(size.width * 0.34, ground - 44),
      Offset(size.width * 0.34, ground),
      AppTheme.primary,
      8,
    );
    _drawLimb(
      canvas,
      Offset(size.width * 0.66, ground - 44),
      Offset(size.width * 0.66, ground),
      AppTheme.primary,
      8,
    );
    _drawText(
      canvas,
      'arredonda / estende',
      Offset(size.width * 0.32, ground - 132),
    );
  }

  void _drawVolleyballWall(Canvas canvas, Size size, String label) {
    final ground = size.height * 0.68;
    _drawFloor(canvas, size, ground);
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.76, ground - 150, 12, 150),
      Paint()..color = AppTheme.secondary.withValues(alpha: 0.5),
    );
    final player = Offset(size.width * 0.34, ground - 74);
    _drawPlayerDot(canvas, player, AppTheme.primary);
    final wall = Offset(size.width * 0.75, ground - 98);
    _drawArrow(canvas, player, wall, AppTheme.primary);
    _drawBall(
      canvas,
      Offset(
        _lerp(player.dx, wall.dx, progress),
        _lerp(player.dy, wall.dy, progress),
      ),
    );
    _drawText(canvas, label, Offset(size.width * 0.38, ground - 142));
  }

  void _drawVolleyballServe(Canvas canvas, Size size, bool underhand) {
    final court = Rect.fromLTWH(28, 34, size.width - 56, size.height * 0.58);
    canvas.drawRRect(
      RRect.fromRectAndRadius(court, const Radius.circular(16)),
      Paint()..color = AppTheme.secondary.withValues(alpha: 0.16),
    );
    final start = Offset(
      size.width * 0.24,
      size.height * (underhand ? 0.58 : 0.42),
    );
    final end = Offset(size.width * 0.78, size.height * 0.34);
    _drawPlayerDot(canvas, start.translate(-24, 18), AppTheme.primary);
    _drawArrow(canvas, start, end, AppTheme.warning);
    _drawBall(
      canvas,
      Offset(
        _lerp(start.dx, end.dx, progress),
        _lerp(start.dy, end.dy, progress),
      ),
    );
    _drawText(
      canvas,
      underhand ? 'saque por baixo' : 'saque por cima',
      Offset(size.width * 0.34, size.height * 0.2),
    );
  }

  void _drawVolleyballLateral(Canvas canvas, Size size) {
    final y = size.height * 0.5;
    for (var i = 0; i < 5; i++) {
      _drawCone(canvas, Offset(size.width * (0.2 + i * 0.15), y + 40));
    }
    _drawArrow(
      canvas,
      Offset(size.width * 0.2, y),
      Offset(size.width * 0.8, y),
      AppTheme.primary,
    );
    _drawPlayerDot(
      canvas,
      Offset(size.width * (0.2 + progress * 0.6), y),
      AppTheme.primary,
    );
    _drawText(canvas, 'passos laterais', Offset(size.width * 0.36, y - 84));
  }

  void _drawVolleyballTarget(Canvas canvas, Size size, String label) {
    final player = Offset(size.width * 0.24, size.height * 0.58);
    final target = Offset(size.width * 0.72, size.height * 0.36);
    _drawPlayerDot(canvas, player, AppTheme.primary);
    _drawTarget(canvas, target, 44, 'alvo');
    _drawArrow(canvas, player, target, AppTheme.primary);
    _drawBall(
      canvas,
      Offset(
        _lerp(player.dx, target.dx, progress),
        _lerp(player.dy, target.dy, progress),
      ),
    );
    _drawText(canvas, label, Offset(size.width * 0.36, size.height * 0.2));
  }

  void _drawVolleyballAttack(Canvas canvas, Size size, bool approach) {
    final ground = size.height * 0.68;
    _drawFloor(canvas, size, ground);
    final netX = size.width * 0.72;
    canvas.drawLine(
      Offset(netX, ground - 150),
      Offset(netX, ground),
      Paint()
        ..color = Colors.white.withValues(alpha: 0.28)
        ..strokeWidth = 4,
    );
    final start = Offset(size.width * (approach ? 0.24 : 0.42), ground - 54);
    final hit = Offset(size.width * 0.62, ground - 130);
    _drawPlayerDot(canvas, start, AppTheme.primary);
    if (approach) _drawArrow(canvas, start, hit, AppTheme.primary);
    _drawBall(
      canvas,
      Offset(
        _lerp(hit.dx, netX + 40, progress),
        _lerp(hit.dy, ground - 116, progress),
      ),
    );
    _drawText(
      canvas,
      approach ? 'aproximacao + ataque' : 'ataque sem salto',
      Offset(size.width * 0.3, ground - 170),
    );
  }

  void _drawVolleyballBlock(Canvas canvas, Size size) {
    final ground = size.height * 0.68;
    _drawFloor(canvas, size, ground);
    final netX = size.width * 0.5;
    canvas.drawLine(
      Offset(netX, ground - 150),
      Offset(netX, ground),
      Paint()
        ..color = Colors.white.withValues(alpha: 0.28)
        ..strokeWidth = 4,
    );
    _drawPlayerDot(
      canvas,
      Offset(netX - 34, ground - 108 - progress * 16),
      AppTheme.primary,
    );
    _drawArrow(
      canvas,
      Offset(netX - 34, ground - 48),
      Offset(netX - 34, ground - 132),
      AppTheme.warning,
    );
    _drawText(
      canvas,
      'maos acima da rede',
      Offset(size.width * 0.3, ground - 170),
    );
  }

  void _drawVolleyballDefense(Canvas canvas, Size size, bool shortBall) {
    final ground = size.height * 0.68;
    _drawFloor(canvas, size, ground);
    final player = Offset(size.width * 0.45, ground - 48);
    _drawPlayerDot(canvas, player, AppTheme.primary);
    final ball = shortBall
        ? Offset(size.width * 0.62, ground - 30)
        : Offset(size.width * 0.7, ground - 96);
    _drawArrow(canvas, player, ball, AppTheme.warning);
    _drawBall(canvas, ball);
    _drawText(
      canvas,
      shortBall ? 'bola curta' : 'defesa baixa',
      Offset(size.width * 0.34, ground - 126),
    );
  }

  void _drawVolleyballTriangle(Canvas canvas, Size size) {
    final points = [
      Offset(size.width * 0.5, size.height * 0.24),
      Offset(size.width * 0.25, size.height * 0.58),
      Offset(size.width * 0.75, size.height * 0.58),
    ];
    for (final point in points) {
      _drawPlayerDot(canvas, point, AppTheme.primary);
    }
    _drawPath(canvas, [...points, points.first], AppTheme.primary);
    _drawBall(canvas, _pointOnPath([...points, points.first], progress));
    _drawText(
      canvas,
      'passe em triangulo',
      Offset(size.width * 0.32, size.height * 0.7),
    );
  }

  void _drawParkourLanding(Canvas canvas, Size size) {
    final ground = size.height * 0.72;
    _drawFloor(canvas, size, ground);
    _drawArrow(
      canvas,
      Offset(size.width * 0.5, ground - 150),
      Offset(size.width * 0.5, ground - 36),
      AppTheme.warning,
    );
    _drawPlayerDot(
      canvas,
      Offset(size.width * 0.5, ground - 42 + progress * 12),
      AppTheme.primary,
    );
    _drawText(
      canvas,
      'absorva impacto',
      Offset(size.width * 0.34, ground - 166),
    );
  }

  void _drawParkourRoll(Canvas canvas, Size size) {
    final ground = size.height * 0.72;
    _drawFloor(canvas, size, ground);
    final center = Offset(size.width * (0.22 + progress * 0.56), ground - 42);
    canvas.drawCircle(
      center,
      30,
      Paint()
        ..color = AppTheme.primary.withValues(alpha: 0.22)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 8,
    );
    _drawArrow(
      canvas,
      Offset(size.width * 0.2, ground - 90),
      Offset(size.width * 0.82, ground - 90),
      AppTheme.primary,
    );
    _drawText(
      canvas,
      'rola pelo ombro',
      Offset(size.width * 0.34, ground - 138),
    );
  }

  void _drawParkourPrecision(Canvas canvas, Size size, bool jump) {
    final ground = size.height * 0.72;
    _drawFloor(canvas, size, ground);
    final a = Offset(size.width * 0.25, ground - 20);
    final b = Offset(size.width * 0.72, ground - 20);
    _drawTarget(canvas, a, 24, 'A');
    _drawTarget(canvas, b, 24, 'B');
    _drawArrow(canvas, a, b, AppTheme.primary);
    _drawPlayerDot(
      canvas,
      Offset(
        _lerp(a.dx, b.dx, progress),
        jump ? _lerp(a.dy - 20, b.dy - 46, progress) : a.dy - 20,
      ),
      AppTheme.primary,
    );
    _drawText(
      canvas,
      jump ? 'salto preciso' : 'passo preciso',
      Offset(size.width * 0.36, ground - 126),
    );
  }

  void _drawParkourBalance(Canvas canvas, Size size, bool cat) {
    final ground = size.height * 0.68;
    _drawFloor(canvas, size, ground);
    canvas.drawLine(
      Offset(size.width * 0.18, ground - 40),
      Offset(size.width * 0.82, ground - 40),
      Paint()
        ..color = AppTheme.warning
        ..strokeWidth = 6
        ..strokeCap = StrokeCap.round,
    );
    _drawPlayerDot(
      canvas,
      Offset(size.width * (0.2 + progress * 0.6), ground - (cat ? 62 : 78)),
      AppTheme.primary,
    );
    _drawText(
      canvas,
      cat ? 'cat balance baixo' : 'equilibrio em linha',
      Offset(size.width * 0.32, ground - 132),
    );
  }

  void _drawParkourVault(Canvas canvas, Size size, bool safety) {
    final ground = size.height * 0.72;
    _drawFloor(canvas, size, ground);
    final block = Rect.fromLTWH(size.width * 0.45, ground - 58, 90, 58);
    canvas.drawRRect(
      RRect.fromRectAndRadius(block, const Radius.circular(8)),
      Paint()..color = AppTheme.secondary.withValues(alpha: 0.42),
    );
    _drawArrow(
      canvas,
      Offset(size.width * 0.22, ground - 70),
      Offset(size.width * 0.78, ground - 78),
      AppTheme.primary,
    );
    _drawPlayerDot(
      canvas,
      Offset(
        size.width * (0.22 + progress * 0.56),
        ground - 78 - math.sin(progress * math.pi) * 42,
      ),
      AppTheme.primary,
    );
    _drawText(
      canvas,
      safety ? 'safety vault' : 'step vault',
      Offset(size.width * 0.38, ground - 156),
    );
  }

  void _drawParkourQuadrupedal(Canvas canvas, Size size) {
    final ground = size.height * 0.68;
    _drawFloor(canvas, size, ground);
    final body = Offset(size.width * (0.24 + progress * 0.52), ground - 52);
    _drawLimb(
      canvas,
      body.translate(-46, -8),
      body.translate(54, -2),
      AppTheme.primary,
      9,
    );
    _drawLimb(
      canvas,
      body.translate(-28, -8),
      body.translate(-44, 42),
      AppTheme.primary,
      8,
    );
    _drawLimb(
      canvas,
      body.translate(36, -2),
      body.translate(54, 42),
      AppTheme.primary,
      8,
    );
    canvas.drawCircle(
      body.translate(-64, -14),
      14,
      Paint()..color = AppTheme.primary,
    );
    _drawText(canvas, 'quatro apoios', Offset(size.width * 0.36, ground - 126));
  }

  void _drawParkourLevel(Canvas canvas, Size size, bool up) {
    final ground = size.height * 0.72;
    _drawFloor(canvas, size, ground);
    final block = Rect.fromLTWH(size.width * 0.55, ground - 84, 90, 84);
    canvas.drawRRect(
      RRect.fromRectAndRadius(block, const Radius.circular(8)),
      Paint()..color = AppTheme.secondary.withValues(alpha: 0.42),
    );
    final start = Offset(size.width * 0.28, up ? ground - 20 : ground - 104);
    final end = Offset(size.width * 0.68, up ? ground - 104 : ground - 20);
    _drawArrow(canvas, start, end, AppTheme.primary);
    _drawPlayerDot(
      canvas,
      Offset(
        _lerp(start.dx, end.dx, progress),
        _lerp(start.dy, end.dy, progress),
      ),
      AppTheme.primary,
    );
    _drawText(
      canvas,
      up ? 'subida controlada' : 'descida controlada',
      Offset(size.width * 0.32, ground - 154),
    );
  }

  void _drawParkourTicTac(Canvas canvas, Size size) {
    final ground = size.height * 0.72;
    _drawFloor(canvas, size, ground);
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.68, ground - 150, 12, 150),
      Paint()..color = AppTheme.secondary.withValues(alpha: 0.45),
    );
    final points = [
      Offset(size.width * 0.22, ground - 20),
      Offset(size.width * 0.68, ground - 92),
      Offset(size.width * 0.82, ground - 36),
    ];
    _drawPath(canvas, points, AppTheme.primary);
    _drawPlayerDot(canvas, _pointOnPath(points, progress), AppTheme.primary);
    _drawText(
      canvas,
      'toque na parede',
      Offset(size.width * 0.36, ground - 164),
    );
  }

  void _drawParkourFlow(Canvas canvas, Size size) {
    final ground = size.height * 0.72;
    _drawFloor(canvas, size, ground);
    final points = [
      Offset(size.width * 0.18, ground - 28),
      Offset(size.width * 0.36, ground - 80),
      Offset(size.width * 0.55, ground - 36),
      Offset(size.width * 0.76, ground - 104),
    ];
    for (final point in points) {
      _drawTarget(canvas, point, 20, '');
    }
    _drawPath(canvas, points, AppTheme.primary);
    _drawPlayerDot(canvas, _pointOnPath(points, progress), AppTheme.primary);
    _drawText(canvas, 'flow continuo', Offset(size.width * 0.36, ground - 152));
  }

  void _drawGeneric(Canvas canvas, Size size) {
    final center = Offset(size.width * 0.5, size.height * 0.44);
    _drawPerson(
      canvas: canvas,
      head: center.translate(0, -40),
      body: center,
      leftHand: center.translate(-48, -8),
      rightHand: center.translate(48, -8),
      leftFoot: center.translate(-34, 58),
      rightFoot: center.translate(34, 58),
    );
    _drawArrow(
      canvas,
      center.translate(-82, 62),
      center.translate(82, 62),
      AppTheme.primary,
    );
  }

  void _drawSquat(Canvas canvas, Size size) {
    final ground = size.height * 0.7;
    _drawFloor(canvas, size, ground);
    final hip = Offset(size.width * 0.5, ground - 62);
    _drawPerson(
      canvas: canvas,
      head: hip.translate(0, -56),
      body: hip.translate(0, -8),
      leftHand: hip.translate(-44, -34),
      rightHand: hip.translate(44, -34),
      leftFoot: Offset(size.width * 0.36, ground),
      rightFoot: Offset(size.width * 0.64, ground),
    );
    _drawArrow(
      canvas,
      hip.translate(78, -40),
      hip.translate(78, 18),
      AppTheme.warning,
    );
  }

  void _drawPushUp(Canvas canvas, Size size, {required bool inclined}) {
    final ground = size.height * 0.68;
    _drawFloor(canvas, size, ground);
    if (inclined) {
      final bench = Rect.fromLTWH(size.width * 0.62, ground - 54, 88, 16);
      canvas.drawRRect(
        RRect.fromRectAndRadius(bench, const Radius.circular(6)),
        Paint()..color = AppTheme.secondary.withValues(alpha: 0.5),
      );
      _drawText(
        canvas,
        'apoio elevado',
        Offset(size.width * 0.56, ground - 90),
      );
    }
    final handY = inclined ? ground - 54 : ground - 18;
    final shoulder = Offset(size.width * 0.42, handY - 34 - progress * 10);
    canvas.drawCircle(
      shoulder.translate(-46, -2),
      16,
      Paint()..color = AppTheme.primary,
    );
    _drawLimb(
      canvas,
      shoulder.translate(-28, 0),
      shoulder.translate(88, 14),
      AppTheme.primary,
      8,
    );
    _drawLimb(
      canvas,
      shoulder.translate(26, 8),
      Offset(size.width * 0.66, handY),
      AppTheme.primary,
      8,
    );
    _drawLimb(
      canvas,
      shoulder.translate(84, 14),
      Offset(size.width * 0.82, ground),
      AppTheme.primary,
      8,
    );
    _drawArrow(
      canvas,
      Offset(size.width * 0.5, handY - 70),
      Offset(size.width * 0.5, handY - 24),
      AppTheme.warning,
    );
  }

  void _drawSidePlank(Canvas canvas, Size size) {
    final ground = size.height * 0.66;
    _drawFloor(canvas, size, ground);
    final hip = Offset(size.width * 0.5, ground - 58);
    canvas.drawCircle(
      Offset(size.width * 0.28, ground - 70),
      16,
      Paint()..color = AppTheme.primary,
    );
    _drawLimb(
      canvas,
      Offset(size.width * 0.34, ground - 64),
      Offset(size.width * 0.74, ground - 48),
      AppTheme.primary,
      9,
    );
    _drawLimb(
      canvas,
      hip,
      Offset(size.width * 0.45, ground - 4),
      AppTheme.primary,
      8,
    );
    _drawLimb(
      canvas,
      Offset(size.width * 0.72, ground - 48),
      Offset(size.width * 0.82, ground - 4),
      AppTheme.primary,
      8,
    );
    _drawArrow(
      canvas,
      hip.translate(0, 34),
      hip.translate(0, -28),
      AppTheme.warning,
    );
    _drawText(canvas, 'quadril alto', Offset(size.width * 0.42, ground - 108));
  }

  void _drawLunge(Canvas canvas, Size size, {required bool reverse}) {
    final ground = size.height * 0.7;
    _drawFloor(canvas, size, ground);
    final hip = Offset(size.width * 0.5, ground - 82);
    _drawPerson(
      canvas: canvas,
      head: hip.translate(0, -62),
      body: hip.translate(0, -20),
      leftHand: hip.translate(-46, -28),
      rightHand: hip.translate(46, -28),
      leftFoot: Offset(size.width * (reverse ? 0.68 : 0.32), ground),
      rightFoot: Offset(size.width * (reverse ? 0.34 : 0.72), ground - 6),
    );
    _drawText(
      canvas,
      reverse ? 'passo para tras' : 'passo a frente',
      Offset(size.width * 0.34, ground - 126),
    );
  }

  void _drawGluteBridge(Canvas canvas, Size size) {
    final ground = size.height * 0.68;
    _drawFloor(canvas, size, ground);
    final hip = Offset(size.width * 0.52, ground - 70 - progress * 12);
    canvas.drawCircle(
      Offset(size.width * 0.28, ground - 26),
      16,
      Paint()..color = AppTheme.primary,
    );
    _drawLimb(
      canvas,
      Offset(size.width * 0.34, ground - 26),
      hip,
      AppTheme.primary,
      9,
    );
    _drawLimb(
      canvas,
      hip,
      Offset(size.width * 0.67, ground - 6),
      AppTheme.primary,
      9,
    );
    _drawLimb(
      canvas,
      Offset(size.width * 0.67, ground - 6),
      Offset(size.width * 0.78, ground),
      AppTheme.primary,
      9,
    );
    _drawArrow(
      canvas,
      hip.translate(36, 24),
      hip.translate(36, -24),
      AppTheme.warning,
    );
    _drawText(canvas, 'suba o quadril', Offset(size.width * 0.4, ground - 124));
  }

  void _drawBackpackRow(Canvas canvas, Size size) {
    final ground = size.height * 0.68;
    _drawFloor(canvas, size, ground);
    final hip = Offset(size.width * 0.46, ground - 72);
    _drawLimb(canvas, hip.translate(-32, -42), hip, AppTheme.primary, 8);
    canvas.drawCircle(
      hip.translate(-44, -62),
      16,
      Paint()..color = AppTheme.primary,
    );
    _drawLimb(
      canvas,
      hip,
      Offset(size.width * 0.36, ground),
      AppTheme.primary,
      8,
    );
    _drawLimb(
      canvas,
      hip,
      Offset(size.width * 0.58, ground),
      AppTheme.primary,
      8,
    );
    final bag = Rect.fromCenter(
      center: hip.translate(70, -10 + progress * 18),
      width: 42,
      height: 30,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(bag, const Radius.circular(8)),
      Paint()..color = AppTheme.warning,
    );
    _drawArrow(
      canvas,
      bag.center.translate(42, 22),
      bag.center.translate(42, -26),
      AppTheme.primary,
    );
    _drawText(
      canvas,
      'puxe a mochila',
      Offset(size.width * 0.47, ground - 126),
    );
  }

  void _drawOverheadPress(Canvas canvas, Size size) {
    final ground = size.height * 0.7;
    _drawFloor(canvas, size, ground);
    final base = Offset(size.width * 0.5, ground - 70);
    _drawPerson(
      canvas: canvas,
      head: base.translate(0, -54),
      body: base,
      leftHand: base.translate(-40, -70 - progress * 28),
      rightHand: base.translate(40, -70 - progress * 28),
      leftFoot: base.translate(-32, 70),
      rightFoot: base.translate(32, 70),
    );
    final bag = Rect.fromCenter(
      center: base.translate(0, -84 - progress * 28),
      width: 70,
      height: 20,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(bag, const Radius.circular(8)),
      Paint()..color = AppTheme.warning,
    );
    _drawText(canvas, 'empurre acima', Offset(size.width * 0.36, ground - 160));
  }

  void _drawCalfRaise(Canvas canvas, Size size) {
    final ground = size.height * 0.7;
    _drawFloor(canvas, size, ground);
    final lift = progress < 0.5 ? progress * 18 : (1 - progress) * 18;
    final base = Offset(size.width * 0.5, ground - 76 - lift);
    _drawPerson(
      canvas: canvas,
      head: base.translate(0, -54),
      body: base,
      leftHand: base.translate(-34, -20),
      rightHand: base.translate(34, -20),
      leftFoot: Offset(size.width * 0.44, ground - lift * 0.35),
      rightFoot: Offset(size.width * 0.56, ground - lift * 0.35),
    );
    _drawArrow(
      canvas,
      base.translate(70, 42),
      base.translate(70, -8),
      AppTheme.warning,
    );
    _drawText(canvas, 'suba na ponta', Offset(size.width * 0.34, ground - 140));
  }

  void _drawDeadBug(Canvas canvas, Size size) {
    final ground = size.height * 0.68;
    _drawFloor(canvas, size, ground);
    final core = Offset(size.width * 0.5, ground - 48);
    canvas.drawCircle(
      core.translate(-48, 4),
      15,
      Paint()..color = AppTheme.primary,
    );
    _drawLimb(
      canvas,
      core.translate(-30, 0),
      core.translate(30, 0),
      AppTheme.primary,
      9,
    );
    _drawLimb(
      canvas,
      core,
      core.translate(-48, -58 - progress * 16),
      AppTheme.primary,
      8,
    );
    _drawLimb(
      canvas,
      core,
      core.translate(54, -42 + progress * 10),
      AppTheme.primary,
      8,
    );
    _drawLimb(
      canvas,
      core.translate(20, 0),
      core.translate(-34, 54),
      AppTheme.primary,
      8,
    );
    _drawLimb(
      canvas,
      core.translate(20, 0),
      core.translate(60, 48 - progress * 16),
      AppTheme.primary,
      8,
    );
    _drawText(
      canvas,
      'opostos alternados',
      Offset(size.width * 0.34, ground - 132),
    );
  }

  void _drawSuperman(Canvas canvas, Size size) {
    final ground = size.height * 0.66;
    _drawFloor(canvas, size, ground);
    final body = Offset(size.width * 0.5, ground - 42 - progress * 12);
    canvas.drawCircle(
      body.translate(-74, 0),
      15,
      Paint()..color = AppTheme.primary,
    );
    _drawLimb(
      canvas,
      body.translate(-54, 0),
      body.translate(58, 0),
      AppTheme.primary,
      9,
    );
    _drawLimb(
      canvas,
      body.translate(-30, 0),
      body.translate(-88, -30),
      AppTheme.primary,
      8,
    );
    _drawLimb(
      canvas,
      body.translate(48, 0),
      body.translate(102, -24),
      AppTheme.primary,
      8,
    );
    _drawText(
      canvas,
      'peito e pernas sobem',
      Offset(size.width * 0.32, ground - 114),
    );
  }

  void _drawPikePushUp(Canvas canvas, Size size) {
    final ground = size.height * 0.68;
    _drawFloor(canvas, size, ground);
    final hip = Offset(size.width * 0.52, ground - 118);
    canvas.drawCircle(
      Offset(size.width * 0.31, ground - 44 - progress * 8),
      15,
      Paint()..color = AppTheme.primary,
    );
    _drawLimb(
      canvas,
      Offset(size.width * 0.36, ground - 44),
      hip,
      AppTheme.primary,
      9,
    );
    _drawLimb(
      canvas,
      hip,
      Offset(size.width * 0.76, ground),
      AppTheme.primary,
      9,
    );
    _drawArrow(
      canvas,
      Offset(size.width * 0.3, ground - 90),
      Offset(size.width * 0.3, ground - 38),
      AppTheme.warning,
    );
    _drawText(canvas, 'quadril alto', Offset(size.width * 0.43, ground - 158));
  }

  void _drawWallSit(Canvas canvas, Size size) {
    final ground = size.height * 0.7;
    _drawFloor(canvas, size, ground);
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.28, ground - 150, 12, 150),
      Paint()..color = AppTheme.secondary.withValues(alpha: 0.5),
    );
    final hip = Offset(size.width * 0.44, ground - 70);
    canvas.drawCircle(
      hip.translate(-36, -58),
      16,
      Paint()..color = AppTheme.primary,
    );
    _drawLimb(canvas, hip.translate(-24, -42), hip, AppTheme.primary, 9);
    _drawLimb(
      canvas,
      hip,
      Offset(size.width * 0.62, ground - 70),
      AppTheme.primary,
      9,
    );
    _drawLimb(
      canvas,
      Offset(size.width * 0.62, ground - 70),
      Offset(size.width * 0.62, ground),
      AppTheme.primary,
      9,
    );
    _drawText(canvas, '90 graus', Offset(size.width * 0.5, ground - 124));
  }

  void _drawBurpee(Canvas canvas, Size size) {
    final y = size.height * 0.42;
    final xs = [size.width * 0.24, size.width * 0.5, size.width * 0.76];
    for (final entry in xs.indexed) {
      _drawTarget(canvas, Offset(entry.$2, y), 24, '${entry.$1 + 1}');
    }
    _drawArrow(
      canvas,
      Offset(xs[0], y + 45),
      Offset(xs[1], y + 45),
      AppTheme.primary,
    );
    _drawArrow(
      canvas,
      Offset(xs[1], y + 45),
      Offset(xs[2], y + 45),
      AppTheme.primary,
    );
    _drawText(
      canvas,
      'agacha > prancha > salta',
      Offset(size.width * 0.28, size.height * 0.66),
    );
  }

  void _drawGoodMorning(Canvas canvas, Size size) {
    final ground = size.height * 0.7;
    _drawFloor(canvas, size, ground);
    final hip = Offset(size.width * 0.5, ground - 78);
    _drawLimb(
      canvas,
      hip,
      hip.translate(-70 - progress * 20, -44),
      AppTheme.primary,
      9,
    );
    canvas.drawCircle(
      hip.translate(-86 - progress * 20, -50),
      16,
      Paint()..color = AppTheme.primary,
    );
    _drawLimb(
      canvas,
      hip,
      Offset(size.width * 0.42, ground),
      AppTheme.primary,
      8,
    );
    _drawLimb(
      canvas,
      hip,
      Offset(size.width * 0.58, ground),
      AppTheme.primary,
      8,
    );
    _drawArrow(
      canvas,
      hip.translate(56, -72),
      hip.translate(8, -40),
      AppTheme.warning,
    );
    _drawText(
      canvas,
      'dobre no quadril',
      Offset(size.width * 0.34, ground - 142),
    );
  }

  void _drawMountainClimber(Canvas canvas, Size size) {
    final ground = size.height * 0.66;
    _drawFloor(canvas, size, ground);
    final shoulder = Offset(size.width * 0.36, ground - 62);
    final hip = Offset(size.width * 0.62, ground - 54);
    canvas.drawCircle(
      shoulder.translate(-42, -10),
      15,
      Paint()..color = AppTheme.primary,
    );
    _drawLimb(canvas, shoulder, hip, AppTheme.primary, 9);
    _drawLimb(
      canvas,
      shoulder,
      Offset(size.width * 0.28, ground),
      AppTheme.primary,
      8,
    );
    _drawLimb(
      canvas,
      hip,
      Offset(size.width * (0.48 + progress * 0.1), ground),
      AppTheme.primary,
      8,
    );
    _drawLimb(
      canvas,
      hip,
      Offset(size.width * 0.82, ground),
      AppTheme.primary,
      8,
    );
    _drawText(
      canvas,
      'joelho alterna',
      Offset(size.width * 0.38, ground - 120),
    );
  }

  void _drawHollowHold(Canvas canvas, Size size) {
    final ground = size.height * 0.68;
    _drawFloor(canvas, size, ground);
    final core = Offset(size.width * 0.5, ground - 48);
    canvas.drawCircle(
      core.translate(-68, -10),
      15,
      Paint()..color = AppTheme.primary,
    );
    _drawLimb(
      canvas,
      core.translate(-48, -6),
      core.translate(60, -4),
      AppTheme.primary,
      9,
    );
    _drawLimb(
      canvas,
      core.translate(-34, -6),
      core.translate(-88, -46),
      AppTheme.primary,
      8,
    );
    _drawLimb(
      canvas,
      core.translate(58, -4),
      core.translate(108, -34),
      AppTheme.primary,
      8,
    );
    _drawText(
      canvas,
      'lombar no chao',
      Offset(size.width * 0.36, ground - 112),
    );
  }

  void _drawPlank(Canvas canvas, Size size) {
    final ground = size.height * 0.64;
    _drawFloor(canvas, size, ground);
    final paint = Paint()
      ..color = AppTheme.primary
      ..strokeWidth = 9
      ..strokeCap = StrokeCap.round;
    canvas.drawCircle(
      Offset(size.width * 0.28, ground - 52),
      17,
      Paint()..color = AppTheme.primary,
    );
    canvas.drawLine(
      Offset(size.width * 0.34, ground - 44),
      Offset(size.width * 0.75, ground - 36),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 0.38, ground - 38),
      Offset(size.width * 0.32, ground),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 0.72, ground - 36),
      Offset(size.width * 0.83, ground - 6),
      paint,
    );
    _drawText(canvas, 'linha reta', Offset(size.width * 0.46, ground - 84));
  }

  void _drawPushMovement(Canvas canvas, Size size) {
    final ground = size.height * 0.68;
    _drawFloor(canvas, size, ground);
    final base = Offset(size.width * 0.5, ground - 54 - progress * 18);
    _drawPerson(
      canvas: canvas,
      head: base.translate(0, -48),
      body: base,
      leftHand: base.translate(-58, -20),
      rightHand: base.translate(58, -20),
      leftFoot: base.translate(-36, 60),
      rightFoot: base.translate(36, 60),
    );
    _drawArrow(
      canvas,
      base.translate(88, 36),
      base.translate(88, -36),
      AppTheme.warning,
    );
  }

  void _drawPerson({
    required Canvas canvas,
    required Offset head,
    required Offset body,
    required Offset leftHand,
    required Offset rightHand,
    required Offset leftFoot,
    required Offset rightFoot,
  }) {
    final paint = Paint()
      ..color = AppTheme.primary
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;
    canvas.drawCircle(head, 18, Paint()..color = AppTheme.primary);
    _drawLimb(canvas, head.translate(0, 20), body, AppTheme.primary, 8);
    _drawLimb(canvas, body.translate(0, -22), leftHand, AppTheme.primary, 8);
    _drawLimb(canvas, body.translate(0, -22), rightHand, AppTheme.primary, 8);
    _drawLimb(canvas, body, leftFoot, AppTheme.primary, 8);
    _drawLimb(canvas, body, rightFoot, AppTheme.primary, 8);
    canvas.drawCircle(leftHand, 6, paint);
    canvas.drawCircle(rightHand, 6, paint);
  }

  void _drawLimb(
    Canvas canvas,
    Offset start,
    Offset end,
    Color color,
    double width,
  ) {
    canvas.drawLine(
      start,
      end,
      Paint()
        ..color = color
        ..strokeWidth = width
        ..strokeCap = StrokeCap.round,
    );
  }

  void _drawFloor(Canvas canvas, Size size, double y) {
    canvas.drawLine(
      Offset(24, y),
      Offset(size.width - 24, y),
      Paint()
        ..color = Colors.white.withValues(alpha: 0.2)
        ..strokeWidth = 2,
    );
  }

  void _drawCone(Canvas canvas, Offset bottom) {
    final path = Path()
      ..moveTo(bottom.dx, bottom.dy - 22)
      ..lineTo(bottom.dx - 14, bottom.dy + 8)
      ..lineTo(bottom.dx + 14, bottom.dy + 8)
      ..close();
    canvas.drawPath(path, Paint()..color = AppTheme.warning);
  }

  void _drawBall(Canvas canvas, Offset center) {
    canvas.drawCircle(center, 14, Paint()..color = Colors.white);
    canvas.drawCircle(
      center,
      14,
      Paint()
        ..color = AppTheme.border
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );
    canvas.drawCircle(center, 4, Paint()..color = AppTheme.border);
  }

  void _drawPath(Canvas canvas, List<Offset> points, Color color) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    final path = Path()..moveTo(points.first.dx, points.first.dy);
    for (final point in points.skip(1)) {
      path.lineTo(point.dx, point.dy);
    }
    canvas.drawPath(path, paint);
    _drawArrowHead(canvas, points[points.length - 2], points.last, color);
  }

  void _drawArrow(Canvas canvas, Offset start, Offset end, Color color) {
    canvas.drawLine(
      start,
      end,
      Paint()
        ..color = color
        ..strokeWidth = 4
        ..strokeCap = StrokeCap.round,
    );
    _drawArrowHead(canvas, start, end, color);
  }

  void _drawArrowHead(Canvas canvas, Offset start, Offset end, Color color) {
    final direction = (end - start).direction;
    const size = 12.0;
    final p1 = Offset.fromDirection(direction + 2.55, size);
    final p2 = Offset.fromDirection(direction - 2.55, size);
    final path = Path()
      ..moveTo(end.dx, end.dy)
      ..lineTo(end.dx + p1.dx, end.dy + p1.dy)
      ..moveTo(end.dx, end.dy)
      ..lineTo(end.dx + p2.dx, end.dy + p2.dy);
    canvas.drawPath(
      path,
      Paint()
        ..color = color
        ..strokeWidth = 4
        ..strokeCap = StrokeCap.round,
    );
  }

  void _drawText(Canvas canvas, String text, Offset offset) {
    final painter = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w800,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    final rect = Rect.fromLTWH(
      offset.dx - 8,
      offset.dy - 5,
      painter.width + 16,
      painter.height + 10,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, const Radius.circular(999)),
      Paint()..color = AppTheme.background.withValues(alpha: 0.68),
    );
    painter.paint(canvas, offset);
  }

  void _drawAngleLabel(Canvas canvas, ExerciseDemoAngle angle) {
    final label = switch (angle) {
      ExerciseDemoAngle.top => 'vista superior',
      ExerciseDemoAngle.side => 'vista lateral',
      ExerciseDemoAngle.front => 'vista frontal',
    };
    _drawText(canvas, label, const Offset(14, 14));
  }

  Offset _pointOnPath(List<Offset> points, double value) {
    final scaled = value.clamp(0, 0.999).toDouble() * (points.length - 1);
    final index = scaled.floor();
    final local = scaled - index;
    final start = points[index];
    final end = points[index + 1];
    return Offset(
      _lerp(start.dx, end.dx, local),
      _lerp(start.dy, end.dy, local),
    );
  }

  double _lerp(double start, double end, double value) {
    return start + (end - start) * value;
  }
}

String detailedExerciseGuide(Exercise exercise) {
  final name = exercise.name.toLowerCase();
  if (exercise.id == 'FUT-001' || name.contains('circuito em cones')) {
    return [
      'Preparacao:',
      '1. Posicione 5 cones em linha reta, um na frente do outro, com cerca de meio metro entre eles.',
      '2. Fique atras do primeiro cone com a bola perto do pe dominante.',
      '3. Deixe um pequeno espaco livre depois do ultimo cone para desacelerar sem perder controle.',
      '',
      'Execucao:',
      '1. Comece conduzindo a bola devagar em diagonal para passar pelo lado do primeiro cone.',
      '2. Ao chegar no espaco entre os cones, toque a bola para o lado oposto e entre no proximo corredor.',
      '3. Repita esse desenho como um zig-zag: direita, esquerda, direita, esquerda ate sair do ultimo cone.',
      '4. Use toques curtos. A bola deve ficar a no maximo um passo do seu pe.',
      '5. Na volta, repita usando mais o outro pe ou alternando parte interna e externa do pe.',
      '',
      'Meta pratica:',
      'Faca 4 passagens limpas. Depois tente diminuir o tempo sem derrubar cones e sem deixar a bola escapar.',
      '',
      'Erros comuns:',
      'Chutar a bola longe demais, olhar so para baixo, virar o corpo tarde e tentar correr antes de dominar o trajeto.',
    ].join('\n');
  }

  return switch (exercise.category) {
    'Futebol' => _footballGuide(exercise),
    'Karate' => _karateGuide(exercise),
    'Corrida e resistencia' => _runningGuide(exercise),
    'Forca' => _strengthGuide(exercise),
    'Mobilidade' => _mobilityGuide(exercise),
    'Volei' => _volleyballGuide(exercise),
    'Parkour seguro' => _parkourGuide(exercise),
    _ => _genericGuide(exercise),
  };
}

String _footballGuide(Exercise exercise) {
  final lower = exercise.name.toLowerCase();
  final focus = lower.split(':').first;
  final spec = _footballSpec(lower);
  final focusInstruction = _footballFocusInstruction(focus);
  final contextInstruction = switch (spec.context) {
    _FootballContext.wallRebound =>
      '1. Fique de 2 a 4 metros de uma parede ou reboteiro.\n'
          '2. Execute o gesto principal em direcao a parede e receba a bola no retorno.\n'
          '3. No rebote, ajuste o corpo antes do proximo toque; se for duelo, imagine ou marque um defensor entre voce e a parede.',
    _FootballContext.duel =>
      '1. Marque um corredor curto com dois cones de entrada e uma linha de saida.\n'
          '2. Coloque um defensor, sombra ou obstaculo no meio do corredor.\n'
          '3. Ataque o espaco, proteja a bola e finalize passando pela linha sem perder controle.',
    _FootballContext.smallGame =>
      '1. Monte um campo pequeno com dois mini-gols ou zonas de pontuacao.\n'
          '2. Jogue em poucos toques, sempre procurando apoio e mudanca de direcao.\n'
          '3. A repeticao termina quando houver passe limpo, finalizacao ou recuperacao defensiva.',
    _FootballContext.rondo =>
      '1. Forme um circulo pequeno com 4 a 5 pontos de passe.\n'
          '2. Mantenha um defensor no centro ou use um cone como pressao imaginaria.\n'
          '3. A bola deve girar rapido; receba ja orientando o corpo para o proximo passe.',
    _FootballContext.sequence =>
      '1. Separe 3 ou 4 estacoes numeradas.\n'
          '2. Execute uma acao em cada estacao: dominio, conducao, passe, giro ou finalizacao.\n'
          '3. So avance para a proxima estacao quando a anterior sair limpa.',
    _FootballContext.points =>
      '1. Crie alvos com pontuacao diferente: facil vale 1, medio vale 2, dificil vale 3.\n'
          '2. Execute a acao principal tentando somar pontos sem perder tecnica.\n'
          '3. Registre acertos e repita buscando aumentar a pontuacao total.',
    _FootballContext.attackWaves =>
      '1. Saia em ondas: primeira corrida, segundo apoio, terceira acao de decisao.\n'
          '2. Ataque o espaco em velocidade progressiva.\n'
          '3. Termine com passe, cruzamento, finalizacao ou recomposicao, conforme o foco.',
    _FootballContext.runWithBall =>
      '1. Marque uma faixa reta ou levemente curva.\n'
          '2. Conduza a bola no ritmo da passada, sem deixar ela fugir mais que um passo.\n'
          '3. Acelere apenas depois de manter controle por toda a faixa.',
    _FootballContext.station =>
      '1. Monte uma estacao fixa com bola, alvo e ponto de retorno.\n'
          '2. Execute a mesma acao varias vezes do mesmo ponto.\n'
          '3. Use a repeticao para corrigir detalhe tecnico, nao para correr sem criterio.',
    _FootballContext.markedTarget =>
      '1. Marque um alvo claro na parede, gol, chao ou entre cones.\n'
          '2. Execute o gesto mirando uma zona especifica.\n'
          '3. Conte apenas repeticoes em que a bola chega perto do alvo escolhido.',
    _FootballContext.decisionZone =>
      '1. Marque duas saidas ou dois alvos, A e B.\n'
          '2. Antes de tocar na bola, escolha a rota olhando para frente.\n'
          '3. Troque a decisao a cada repeticao para treinar leitura e adaptacao.',
    _FootballContext.cones =>
      '1. Posicione cones ou marcas no chao no desenho indicado.\n'
          '2. Conduza ou execute o gesto passando pelos espacos sem derrubar os cones.\n'
          '3. Mantenha toques curtos e mude direcao antes de chegar em cima do cone.',
  };
  return [
    'Preparacao:',
    '1. Prepare bola, marcadores e o espaco especifico do contexto: ${spec.contextLabel}.',
    '2. O foco tecnico deste treino e: ${spec.focusLabel}.',
    '3. Comece em ritmo baixo para entender o gesto antes de buscar velocidade.',
    '',
    'Execucao:',
    focusInstruction,
    '',
    'Organizacao do exercicio:',
    contextInstruction,
    '',
    'Como saber se esta certo:',
    'A bola fica perto, voce consegue levantar o olhar por alguns instantes e termina a repeticao sem perder equilibrio.',
  ].join('\n');
}

String _footballFocusInstruction(String focus) {
  if (focus.contains('passe curto')) {
    return '1. Use a parte interna do pe, tornozelo firme e bola rasteira.\n2. Depois do passe, reposicione o corpo para receber de novo.';
  }
  if (focus.contains('passe longo')) {
    return '1. Abra o corpo, apoie o pe ao lado da bola e acerte a parte inferior/meio da bola.\n2. Busque trajetoria controlada, nao apenas forca.';
  }
  if (focus.contains('primeiro toque')) {
    return '1. Receba ja tirando a bola da pressao.\n2. O primeiro toque deve deixar a proxima acao pronta.';
  }
  if (focus.contains('drible') || focus.contains('1 contra')) {
    return '1. Aproxime com toques curtos.\n2. Ameace um lado, mude para o outro e proteja a bola com o corpo.';
  }
  if (focus.contains('2 contra') || focus.contains('3 contra')) {
    return '1. Carregue o defensor para um lado.\n2. Solte a bola no apoio livre quando o marcador fechar o espaco.';
  }
  if (focus.contains('finaliza')) {
    return '1. Ajuste o ultimo toque para preparar o chute.\n2. Trave o tornozelo, olhe rapido para o alvo e finalize com equilibrio.';
  }
  if (focus.contains('cruzamento')) {
    return '1. Conduza pela lateral e ajuste o corpo antes do contato.\n2. Cruze procurando altura e direcao, nao apenas potencia.';
  }
  if (focus.contains('cabeceio')) {
    return '1. Olhe a bola ate o contato.\n2. Ataque a bola com testa firme e pes preparados para aterrissar.';
  }
  if (focus.contains('goleiro')) {
    return '1. Fique em base baixa, maos ativas e peso na ponta dos pes.\n2. Reaja curto primeiro, depois recupere a posicao.';
  }
  if (focus.contains('marcacao') || focus.contains('transicao defensiva')) {
    return '1. Feche a linha de passe primeiro.\n2. Aproxime sem dar bote cedo e force o adversario para a zona menos perigosa.';
  }
  if (focus.contains('transicao ofensiva')) {
    return '1. Depois de recuperar a bola, procure a primeira acao vertical.\n2. Decida rapido entre conduzir, passar ou finalizar.';
  }
  if (focus.contains('velocidade') || focus.contains('agilidade')) {
    return '1. Faça a primeira passada explosiva.\n2. Baixe o centro de gravidade nas mudancas de direcao.';
  }
  return '1. Execute o gesto principal com controle.\n2. Repita buscando menos erros, melhor postura e mais velocidade apenas no final.';
}

String _karateGuide(Exercise exercise) {
  final lower = exercise.name.toLowerCase();
  if (lower.contains('dachi') || lower.contains('base')) {
    return [
      'Preparacao:',
      '1. Abra a base conforme o nome do treino e distribua o peso antes de mover os bracos.',
      '2. Mantenha joelhos flexionados, coluna alta e guarda protegendo o rosto.',
      '',
      'Execucao:',
      lower.contains('kiba')
          ? '1. Fique com os pes afastados e paralelos, como uma base de cavalo.\n2. Desca o quadril sem deixar os joelhos fecharem.'
          : lower.contains('kokutsu')
          ? '1. Leve mais peso para a perna de tras.\n2. Mantenha a perna da frente leve para defender ou contra-atacar.'
          : '1. Leve o peso para a perna da frente.\n2. Mantenha a perna de tras firme para empurrar o chao.',
      '',
      'Controle:',
      'A base esta correta quando voce consegue ficar estavel sem subir o quadril ou cruzar os pes.',
    ].join('\n');
  }
  if (lower.contains('geri')) {
    return [
      'Preparacao:',
      '1. Comece em guarda, olhando para o alvo.',
      '2. Eleve o joelho antes de estender a perna.',
      '',
      'Execucao:',
      lower.contains('mawashi')
          ? '1. Gire o quadril e leve a perna em arco.\n2. Acerte com controle e recolha a perna antes de apoiar.'
          : lower.contains('yoko')
          ? '1. Vire o quadril de lado.\n2. Empurre o calcanhar em linha reta e retorne para a base.'
          : '1. Suba o joelho na linha do corpo.\n2. Estenda a perna para frente e recolha rapido.',
      '',
      'Erro comum:',
      'Chutar sem recolher a perna ou perder a guarda durante o movimento.',
    ].join('\n');
  }
  if (lower.contains('uke') || lower.contains('barai')) {
    return [
      'Preparacao:',
      '1. Fique em base firme com a guarda ativa.',
      '2. Imagine a linha de ataque vindo na sua direcao.',
      '',
      'Execucao:',
      lower.contains('age')
          ? '1. Suba o antebraco protegendo a cabeca.\n2. Termine com o cotovelo levemente flexionado, sem abrir demais.'
          : lower.contains('gedan')
          ? '1. Varra a linha baixa para fora.\n2. Termine com a mao proxima da perna da frente.'
          : '1. Cruze a mao no centro e defenda para fora.\n2. Pare o movimento na linha do ombro, sem girar demais o tronco.',
      '',
      'Controle:',
      'A defesa deve terminar firme, mas sem travar ombro ou cotovelo.',
    ].join('\n');
  }
  return [
    'Preparacao:',
    '1. Fique em uma base estavel, com joelhos destravados e guarda alta.',
    '2. Escolha uma linha imaginaria de ataque para nao cruzar demais o corpo.',
    '',
    'Execucao:',
    '1. Faca 3 repeticoes lentas para sentir a trajetoria.',
    '2. Ative quadril, tronco e retorno do movimento, sem soltar a guarda.',
    '3. Aumente a velocidade apenas quando a base continuar firme.',
    '',
    'Pontos de controle:',
    'Pe de apoio firme, olhar no alvo, retorno rapido e respiracao curta no momento do golpe.',
  ].join('\n');
}

String _runningGuide(Exercise exercise) {
  final lower = exercise.name.toLowerCase();
  if (lower.contains('intervalado')) {
    final block = lower.contains('30-30')
        ? '30 segundos forte + 30 segundos leve'
        : '1 minuto forte + 1 minuto leve';
    return [
      'Preparacao:',
      '1. Aqueca com 5 minutos leves antes do primeiro tiro.',
      '2. Defina o ciclo do treino: $block.',
      '',
      'Execucao:',
      '1. No trecho forte, acelere mantendo passada curta e postura alta.',
      '2. No trecho leve, reduza o ritmo para recuperar a respiracao sem parar bruscamente.',
      '3. Repita os ciclos ate completar o tempo planejado.',
      '',
      'Acompanhe:',
      'Compare se os ultimos tiros ainda saem parecidos com os primeiros.',
    ].join('\n');
  }
  if (lower.contains('subida')) {
    return [
      'Preparacao:',
      '1. Escolha uma subida curta, segura e sem piso escorregadio.',
      '2. Comece caminhando ou trotando para sentir a inclinacao.',
      '',
      'Execucao:',
      '1. Suba com passadas curtas e tronco levemente inclinado.',
      '2. Use os bracos para ajudar o ritmo.',
      '3. Desca devagar para recuperar antes da proxima repeticao.',
      '',
      'Erro comum:',
      'Dar passadas longas demais e perder postura no meio da subida.',
    ].join('\n');
  }
  if (lower.contains('skipping') || lower.contains('dribbling')) {
    return [
      'Preparacao:',
      '1. Marque uma faixa curta de 8 a 12 metros.',
      '2. Fique alto, com abdomen firme e bracos ativos.',
      '',
      'Execucao:',
      lower.contains('skipping')
          ? '1. Eleve um joelho de cada vez ate perto da linha do quadril.\n2. Toque o chao rapido com a ponta do pe e mantenha ritmo.'
          : '1. Faca passos curtos e rapidos, quase sem sair do lugar.\n2. Mantenha tornozelos ativos e contato leve no solo.',
      '',
      'Meta:',
      'Tecnica limpa vale mais que velocidade.',
    ].join('\n');
  }
  return [
    'Preparacao:',
    '1. Comece com 3 a 5 minutos de caminhada ou trote leve.',
    '2. Se for usar metricas, abra o registro do HealthKit ou Health Connect antes de iniciar.',
    '',
    'Execucao:',
    '1. Mantenha postura alta, ombros soltos e passada curta.',
    '2. Controle o ritmo para conseguir terminar o bloco sem quebrar a tecnica.',
    '3. Se o treino tiver intervalos, use os tiros para acelerar e os descansos para recuperar respiracao.',
    '',
    'Acompanhe:',
    'Tempo total, ritmo medio, sensacao de esforco e queda de desempenho entre blocos.',
  ].join('\n');
}

String _strengthGuide(Exercise exercise) {
  final lower = exercise.name.toLowerCase();
  if (lower.contains('agach')) {
    return [
      'Preparacao:',
      '1. Pes na largura dos ombros, ponta dos pes levemente para fora.',
      '2. Contraia abdomen e olhe para frente.',
      '',
      'Execucao:',
      '1. Leve o quadril para tras como se fosse sentar.',
      '2. Desca mantendo joelhos alinhados com os pes.',
      '3. Suba empurrando o chao e sem deixar o tronco cair.',
      '',
      'Erros comuns:',
      'Joelho fechar para dentro, calcanhar sair do chao e descer rapido sem controle.',
    ].join('\n');
  }
  if (lower.contains('flex')) {
    return [
      'Preparacao:',
      lower.contains('inclinada')
          ? '1. Apoie as maos em banco, parede baixa ou superficie firme.'
          : '1. Apoie maos no chao, um pouco mais abertas que os ombros.',
      '2. Alinhe cabeca, tronco, quadril e pernas.',
      '',
      'Execucao:',
      '1. Desca controlando cotovelos, sem deixar o quadril cair.',
      '2. Empurre o chao ou apoio ate estender os bracos.',
      '3. Pare a serie quando perder a linha do corpo.',
    ].join('\n');
  }
  if (lower.contains('prancha')) {
    return [
      'Preparacao:',
      lower.contains('lateral')
          ? '1. Apoie antebraco no chao e alinhe ombro, quadril e tornozelo.'
          : '1. Apoie antebracos e ponta dos pes no chao.',
      '2. Contraia abdomen e gluteos antes de iniciar o cronometro.',
      '',
      'Execucao:',
      lower.contains('lateral')
          ? '1. Eleve o quadril e mantenha o corpo em linha lateral.\n2. Nao deixe o ombro afundar.'
          : '1. Mantenha coluna neutra e respire curto.\n2. Evite levantar demais ou deixar cair o quadril.',
    ].join('\n');
  }
  if (lower.contains('avan') || lower.contains('afundo')) {
    return [
      'Preparacao:',
      '1. Fique em pe com tronco alto e pes paralelos.',
      '2. Escolha se o passo sera para frente ou para tras conforme o treino.',
      '',
      'Execucao:',
      '1. De o passo e desca ate os joelhos ficarem flexionados.',
      '2. Mantenha o joelho da frente alinhado com o pe.',
      '3. Volte empurrando o chao, sem tombar o tronco.',
    ].join('\n');
  }
  if (lower.contains('eleva') && lower.contains('quadril')) {
    return [
      'Preparacao:',
      '1. Deite de barriga para cima com joelhos dobrados e pes no chao.',
      '2. Deixe os pes perto do quadril.',
      '',
      'Execucao:',
      '1. Suba o quadril contraindo gluteos.',
      '2. Pare no topo por um instante.',
      '3. Desca sem relaxar totalmente no chao.',
    ].join('\n');
  }
  if (lower.contains('remada')) {
    return [
      'Preparacao:',
      '1. Segure uma mochila firme com as duas maos.',
      '2. Incline o tronco mantendo coluna neutra.',
      '',
      'Execucao:',
      '1. Puxe a mochila em direcao ao abdomen.',
      '2. Junte levemente as escapulas.',
      '3. Desca controlando, sem arredondar as costas.',
    ].join('\n');
  }
  if (lower.contains('desenvolvimento')) {
    return [
      'Preparacao:',
      '1. Segure a mochila na altura do peito.',
      '2. Contraia abdomen para nao arquear a lombar.',
      '',
      'Execucao:',
      '1. Empurre a mochila acima da cabeca.',
      '2. Desca ate a linha do peito com controle.',
      '3. Mantenha costelas baixas durante todo o movimento.',
    ].join('\n');
  }
  if (lower.contains('burpee')) {
    return [
      'Preparacao:',
      '1. Fique em pe com espaco livre a frente.',
      '2. Prepare a sequencia: agachar, apoiar, prancha, voltar, saltar.',
      '',
      'Execucao:',
      '1. Agache e apoie as maos no chao.',
      '2. Leve os pes para tras ate a prancha.',
      '3. Volte os pes para perto das maos e suba com salto leve.',
    ].join('\n');
  }
  return [
    'Preparacao:',
    '1. Ajuste a postura antes da primeira repeticao.',
    '2. Contraia abdomen e organize ombros, quadril e coluna.',
    '',
    'Execucao:',
    '1. Controle a fase de descida.',
    '2. Pare por um instante se perder alinhamento.',
    '3. Suba com forca, mas sem roubar amplitude.',
    '',
    'Meta:',
    'Terminar todas as repeticoes com a mesma qualidade da primeira.',
  ].join('\n');
}

String _mobilityGuide(Exercise exercise) {
  final lower = exercise.name.toLowerCase();
  if (lower.contains('tornozelo') || lower.contains('punho')) {
    final joint = lower.contains('punho') ? 'punho' : 'tornozelo';
    return [
      'Preparacao:',
      '1. Apoie o corpo em uma posicao confortavel e deixe o $joint livre para mover.',
      '2. Comece com amplitude pequena.',
      '',
      'Execucao:',
      '1. Faca circulos lentos para um lado.',
      '2. Inverta o sentido mantendo controle.',
      '3. Aumente amplitude apenas se nao houver dor.',
    ].join('\n');
  }
  if (lower.contains('cat') || lower.contains('cow')) {
    return [
      'Preparacao:',
      '1. Fique em quatro apoios, maos abaixo dos ombros e joelhos abaixo do quadril.',
      '',
      'Execucao:',
      '1. Arredonde a coluna olhando para baixo.',
      '2. Depois estenda a coluna abrindo o peito.',
      '3. Alterne devagar junto com a respiracao.',
    ].join('\n');
  }
  if (lower.contains('respira')) {
    return [
      'Preparacao:',
      '1. Deite ou sente com postura confortavel.',
      '2. Coloque uma mao no peito e outra no abdomen.',
      '',
      'Execucao:',
      '1. Inspire tentando expandir o abdomen.',
      '2. Solte o ar devagar sem elevar os ombros.',
      '3. Repita buscando ritmo calmo.',
    ].join('\n');
  }
  return [
    'Preparacao:',
    '1. Entre na posicao aos poucos e procure uma amplitude confortavel.',
    '2. A sensacao deve ser de alongamento controlado, nunca dor forte.',
    '',
    'Execucao:',
    '1. Respire fundo e solte o ar devagar.',
    '2. Mantenha a posicao pelo tempo indicado.',
    '3. Saia da posicao lentamente para nao travar a articulacao.',
    '',
    'Ajuste:',
    'Se doer, reduza amplitude ou use apoio com as maos.',
  ].join('\n');
}

String _volleyballGuide(Exercise exercise) {
  final lower = exercise.name.toLowerCase();
  if (lower.contains('parede')) {
    return [
      'Preparacao:',
      '1. Fique de 2 a 3 metros de uma parede lisa.',
      '2. Escolha uma altura de alvo na parede.',
      '',
      'Execucao:',
      lower.contains('manchete')
          ? '1. Una os antebracos e direcione a bola com as pernas.\n2. Tente fazer a bola voltar na sua linha de controle.'
          : '1. Toque a bola acima da testa com dedos ativos.\n2. Amorteca e empurre para a mesma zona da parede.',
      '',
      'Meta:',
      'Conte quantos contatos seguidos voce consegue manter sem correr atras da bola.',
    ].join('\n');
  }
  if (lower.contains('saque')) {
    return [
      'Preparacao:',
      '1. Fique atras da linha marcada e escolha uma zona-alvo.',
      '2. Segure a bola com controle antes do contato.',
      '',
      'Execucao:',
      lower.contains('baixo')
          ? '1. Balance o braco de baixo para frente.\n2. Acerte a parte inferior da bola com mao firme.'
          : '1. Lance a bola pouco acima da cabeca.\n2. Bata com braco estendido, direcionando para o alvo.',
      '',
      'Erro comum:',
      'Jogar a bola muito alta ou bater sem mirar uma zona.',
    ].join('\n');
  }
  if (lower.contains('ataque')) {
    return [
      'Preparacao:',
      lower.contains('aproxima')
          ? '1. Marque tres passos de aproximacao antes do ataque.'
          : '1. Fique perto da zona de contato, sem salto no inicio.',
      '',
      'Execucao:',
      '1. Leve o braco para tras preparando o ataque.',
      '2. Contate a bola a frente do corpo.',
      '3. Termine apontando a mao para a direcao desejada.',
    ].join('\n');
  }
  if (lower.contains('bloqueio')) {
    return [
      'Preparacao:',
      '1. Fique de frente para uma linha imaginaria de rede.',
      '2. Maos altas e joelhos flexionados.',
      '',
      'Execucao:',
      '1. Suba verticalmente sem invadir para frente demais.',
      '2. Leve as maos acima da rede imaginaria.',
      '3. Aterrisse com joelhos flexionados.',
    ].join('\n');
  }
  return [
    'Preparacao:',
    '1. Marque uma zona de alvo na quadra, parede ou espaco seguro.',
    '2. Fique com base baixa, joelhos flexionados e maos prontas.',
    '',
    'Execucao:',
    '1. Execute o gesto em velocidade baixa primeiro.',
    '2. Busque contato limpo com a bola e direcao para o alvo.',
    '3. Repita em blocos curtos, descansando quando perder precisao.',
    '',
    'Ponto principal:',
    'Base estavel antes do contato vale mais que forca.',
  ].join('\n');
}

String _parkourGuide(Exercise exercise) {
  final lower = exercise.name.toLowerCase();
  if (lower.contains('aterrissagem')) {
    return [
      'Preparacao:',
      '1. Use uma altura baixa, como um degrau pequeno.',
      '2. Olhe para o ponto onde os pes vao tocar.',
      '',
      'Execucao:',
      '1. Aterrisse com os dois pes quase juntos.',
      '2. Flexione joelhos e quadril para absorver impacto.',
      '3. Termine estavel e silencioso.',
    ].join('\n');
  }
  if (lower.contains('rolamento')) {
    return [
      'Preparacao:',
      '1. Use colchonete ou piso macio.',
      '2. Comece ajoelhado ou agachado.',
      '',
      'Execucao:',
      '1. Entre pelo ombro, nunca pelo topo da cabeca.',
      '2. Role na diagonal das costas.',
      '3. Saia em posicao baixa e equilibrada.',
    ].join('\n');
  }
  if (lower.contains('vault')) {
    return [
      'Preparacao:',
      '1. Escolha um obstaculo baixo e firme.',
      '2. Treine primeiro parado, depois com pequena aproximacao.',
      '',
      'Execucao:',
      lower.contains('safety')
          ? '1. Apoie uma mao e passe uma perna por cima primeiro.\n2. Use a outra perna para sair com controle.'
          : '1. Apoie a mao no obstaculo.\n2. Pise ou passe a perna de apoio por cima, mantendo o tronco compacto.',
      '',
      'Seguranca:',
      'Se bater o pe ou perder equilibrio, reduza altura e velocidade.',
    ].join('\n');
  }
  if (lower.contains('precis')) {
    return [
      'Preparacao:',
      '1. Marque dois pontos no chao: saida e aterrissagem.',
      '2. Comece com distancia curta.',
      '',
      'Execucao:',
      '1. Saia equilibrado e olhe para o ponto de chegada.',
      '2. Aterrisse com os pes no alvo.',
      '3. Congele por um segundo antes de sair.',
    ].join('\n');
  }
  return [
    'Preparacao:',
    '1. Use obstaculo baixo, superficie seca e area livre.',
    '2. Treine primeiro a aterrissagem sem salto alto.',
    '',
    'Execucao:',
    '1. Aproxime devagar e visualize onde as maos e pes vao tocar.',
    '2. Execute com corpo compacto e controle na saida.',
    '3. Repita baixo e limpo antes de aumentar distancia ou altura.',
    '',
    'Seguranca:',
    'Se a aterrissagem fizer barulho ou perder equilibrio, reduza a dificuldade.',
  ].join('\n');
}

String _genericGuide(Exercise exercise) {
  return [
    'Preparacao:',
    '1. Leia o objetivo e prepare o espaco antes de iniciar.',
    '2. Faca uma repeticao lenta para entender o movimento.',
    '',
    'Execucao:',
    '1. Mantenha controle do corpo do inicio ao fim.',
    '2. Aumente intensidade apenas quando a tecnica estiver estavel.',
    '',
    'Meta:',
    'Registrar qualidade, fadiga e qualquer desconforto.',
  ].join('\n');
}
