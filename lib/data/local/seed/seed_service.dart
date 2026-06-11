import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/services.dart';

import '../database/app_database.dart';

class SeedService {
  SeedService(this._db);

  static const _seedVersion = '2026-06-09-training-routine-v2';

  final AppDatabase _db;

  Future<void> ensureSeeded() async {
    final seeded = await (_db.select(
      _db.appSettings,
    )..where((s) => s.key.equals('seed_version'))).getSingleOrNull();
    if (seeded?.value == _seedVersion) return;

    await _db.transaction(() async {
      await _seedLifeAreas();
      await _seedLevels();
      await _seedAchievements();
      await _seedStudyUnits();
      await _seedExercises();
      await _seedFinanceCategories();
      await _seedHabits();
      await _seedWorkoutTemplates();
      if (seeded == null) {
        await _seedStarterRoutineAndMission();
      }

      await _db
          .into(_db.appSettings)
          .insertOnConflictUpdate(
            AppSettingsCompanion.insert(
              key: 'seed_version',
              value: _seedVersion,
              updatedAt: DateTime.now(),
            ),
          );
    });
  }

  Future<List<Map<String, dynamic>>> _readList(String path) async {
    final raw = await rootBundle.loadString(path);
    return (jsonDecode(raw) as List).cast<Map<String, dynamic>>();
  }

  Future<void> _seedLifeAreas() async {
    final areas = [
      'Corpo',
      'Mente',
      'Estudos',
      'Trabalho',
      'Fe / Proposito',
      'Familia',
      'Projetos',
      'Lazer',
      'Sono',
      'Alimentacao',
      'Financas',
    ];
    for (final entry in areas.indexed) {
      await _db
          .into(_db.lifeAreas)
          .insertOnConflictUpdate(
            LifeAreasCompanion.insert(
              id: 'life-${entry.$2.toLowerCase().replaceAll(' ', '-').replaceAll('/', '-')}',
              name: entry.$2,
              sortOrder: Value(entry.$1),
              createdAt: DateTime.now(),
            ),
          );
    }
  }

  Future<void> _seedLevels() async {
    final levels = <(int, String)>[
      (1, 'Iniciante'),
      (5, 'Organizado'),
      (10, 'Disciplinado'),
      (20, 'Focado'),
      (35, 'Imparavel'),
      (50, 'Mestre da Rotina'),
      (75, 'Alta Performance'),
      (100, 'Lenda Pessoal'),
    ];
    for (final level in levels) {
      await _db
          .into(_db.levels)
          .insertOnConflictUpdate(
            LevelsCompanion.insert(
              id: 'level-${level.$1}',
              level: level.$1,
              title: level.$2,
              requiredXp: level.$1 * 500,
            ),
          );
    }
  }

  Future<void> _seedAchievements() async {
    final names = [
      'Primeira Missao Concluida',
      '7 Dias de Consistencia',
      'Primeiro Treino Completo',
      'Primeira Semana Organizada',
      'Projeto em Movimento',
      'Mente Forte',
      'Sono em Dia',
      'Financas Controladas',
      'Primeira Meta Financeira',
      'Rotina Blindada',
    ];
    for (final name in names.indexed) {
      await _db
          .into(_db.achievements)
          .insertOnConflictUpdate(
            AchievementsCompanion.insert(
              id: 'ach-${name.$1 + 1}',
              name: name.$2,
              description: 'Conquista de progresso pessoal: ${name.$2}.',
              xpReward: const Value(10),
            ),
          );
    }
  }

  Future<void> _seedStudyUnits() async {
    final items = await _readList('assets/seed/study_units.json');
    final subjectIds = <String, String>{};
    for (final item in items) {
      final subjectName = item['subject'] as String;
      final subjectId = subjectIds.putIfAbsent(
        subjectName,
        () => 'subject-${subjectIds.length + 1}',
      );
      await _db
          .into(_db.studySubjects)
          .insertOnConflictUpdate(
            StudySubjectsCompanion.insert(
              id: subjectId,
              name: subjectName,
              createdAt: DateTime.now(),
            ),
          );
      await _db
          .into(_db.studyUnits)
          .insertOnConflictUpdate(
            StudyUnitsCompanion.insert(
              id: item['id'] as String,
              subjectId: subjectId,
              title: item['title'] as String,
              objective: Value(item['objective'] as String?),
              difficulty: Value(item['difficulty'] as String? ?? 'Base'),
              estimatedMinutes: Value(
                (item['estimatedMinutes'] as num?)?.toInt() ?? 30,
              ),
              priority: const Value('Normal'),
              createdAt: DateTime.now(),
            ),
          );
    }
  }

  Future<void> _seedExercises() async {
    final items = await _readList('assets/seed/exercises.json');
    for (final item in items) {
      await _db
          .into(_db.exercises)
          .insertOnConflictUpdate(
            ExercisesCompanion.insert(
              id: item['id'] as String,
              category: item['category'] as String,
              subcategory: Value(item['subcategory'] as String?),
              name: item['name'] as String,
              objective: Value(item['objective'] as String?),
              description: Value(item['description'] as String?),
              level: Value(item['level'] as String? ?? 'Base'),
              averageMinutes: Value(
                (item['averageMinutes'] as num?)?.toInt() ?? 10,
              ),
              metrics: Value((item['metrics'] as List?)?.join(', ')),
              precautions: Value(item['precautions'] as String?),
              createdAt: DateTime.now(),
            ),
          );
    }
  }

  Future<void> _seedFinanceCategories() async {
    final items = await _readList('assets/seed/finance_categories.json');
    for (final item in items) {
      await _db
          .into(_db.financeCategories)
          .insertOnConflictUpdate(
            FinanceCategoriesCompanion.insert(
              id: item['id'] as String,
              name: item['name'] as String,
              nature: item['nature'] as String,
              description: Value(item['description'] as String?),
              acceptsRecurrence: Value(
                item['acceptsRecurrence'] as bool? ?? false,
              ),
              alertRule: Value(item['alertRule'] as String?),
              createdAt: DateTime.now(),
            ),
          );
    }
  }

  Future<void> _seedHabits() async {
    final items = await _readList('assets/seed/habits.json');
    for (final item in items) {
      await _db
          .into(_db.habits)
          .insertOnConflictUpdate(
            HabitsCompanion.insert(
              id: item['id'] as String,
              name: item['name'] as String,
              lifeArea: Value(item['area'] as String?),
              trigger: Value(item['trigger'] as String?),
              action: Value(item['action'] as String?),
              metric: Value(item['metric'] as String?),
              createdAt: DateTime.now(),
            ),
          );
    }
  }

  Future<void> _seedWorkoutTemplates() async {
    final items = await _readList('assets/seed/workout_templates.json');
    for (final item in items) {
      await _db
          .into(_db.workouts)
          .insertOnConflictUpdate(
            WorkoutsCompanion.insert(
              id: item['id'] as String,
              name: item['name'] as String,
              type: item['type'] as String,
              durationMinutes: (item['durationMinutes'] as num).toInt(),
              intensity: Value(item['intensity'] as String? ?? 'Media'),
              objective: Value(item['objective'] as String?),
              templateJson: Value(jsonEncode(item['steps'] ?? [])),
              status: const Value('template'),
              createdAt: DateTime.now(),
            ),
          );
    }
  }

  Future<void> _seedStarterRoutineAndMission() async {
    final now = DateTime.now();
    final missionId = 'mission-starter';
    await _db
        .into(_db.dailyMissions)
        .insertOnConflictUpdate(
          DailyMissionsCompanion.insert(
            id: missionId,
            date: DateTime(now.year, now.month, now.day),
            title: 'Estudar 1h, treinar 45min e registrar gastos',
            description: const Value(
              'Primeira missao baseada no repertorio inicial.',
            ),
            status: const Value('accepted'),
            createdAt: now,
          ),
        );

    for (final item in [
      ('Acordar', 'Sono', 6 * 60, 6 * 60 + 20),
      ('Escola', 'Estudo', 7 * 60, 12 * 60),
      ('Estudo focado', 'Estudo', 15 * 60, 16 * 60),
      ('Treino', 'Treino', 18 * 60, 18 * 60 + 45),
      ('Diario rapido', 'Reflexao', 22 * 60, 22 * 60 + 10),
    ]) {
      await _db
          .into(_db.routineEvents)
          .insertOnConflictUpdate(
            RoutineEventsCompanion.insert(
              id: 'routine-${item.$1.toLowerCase().replaceAll(' ', '-')}',
              title: item.$1,
              type: item.$2,
              weekday: now.weekday,
              startMinutes: item.$3,
              endMinutes: item.$4,
              areaTags: Value(item.$2),
              notify: const Value(false),
              createdAt: now,
            ),
          );
    }
  }
}
