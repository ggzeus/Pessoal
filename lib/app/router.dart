import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/ai/ai_page.dart';
import '../features/diary/diary_screen.dart';
import '../features/finance/finance_screen.dart';
import '../features/habits/habits_screen.dart';
import '../features/home/app_shell.dart';
import '../features/home/home_screen.dart';
import '../features/immersive_training/immersive_training_screen.dart';
import '../features/life_areas/life_areas_screen.dart';
import '../features/mission/mission_screen.dart';
import '../features/nutrition/nutrition_screen.dart';
import '../features/progress/progress_screen.dart';
import '../features/products/products_screen.dart';
import '../features/projects/projects_screen.dart';
import '../features/routine/routine_screen.dart';
import '../features/settings/settings_screen.dart';
import '../features/studies/studies_screen.dart';
import '../features/training/training_screen.dart';
import '../features/training/workout_plan.dart';
import '../features/weekly_review/weekly_review_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          AppShell(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(path: '/', builder: (context, state) => const AiPage()),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/routine',
              builder: (context, state) => const RoutineScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/training',
              builder: (context, state) => const TrainingScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/finance',
              builder: (context, state) => const FinanceScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/more',
              builder: (context, state) => const MoreScreen(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/mission',
      builder: (context, state) => const MissionScreen(),
    ),
    GoRoute(
      path: '/nutrition',
      builder: (context, state) => const NutritionScreen(),
    ),
    GoRoute(
      path: '/products',
      builder: (context, state) => const ProductsScreen(),
    ),
    GoRoute(
      path: '/immersive',
      builder: (context, state) {
        final plan = state.extra is WorkoutPlan
            ? state.extra! as WorkoutPlan
            : null;
        return ImmersiveTrainingScreen(plan: plan);
      },
    ),
    GoRoute(
      path: '/studies',
      builder: (context, state) => const StudiesScreen(),
    ),
    GoRoute(
      path: '/projects',
      builder: (context, state) => const ProjectsScreen(),
    ),
    GoRoute(path: '/diary', builder: (context, state) => const DiaryScreen()),
    GoRoute(path: '/habits', builder: (context, state) => const HabitsScreen()),
    GoRoute(
      path: '/progress',
      builder: (context, state) => const ProgressScreen(),
    ),
    GoRoute(
      path: '/weekly-review',
      builder: (context, state) => const WeeklyReviewScreen(),
    ),
    GoRoute(
      path: '/life-areas',
      builder: (context, state) => const LifeAreasScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
);

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      (Icons.flag_rounded, 'Missao do Dia', '/mission'),
      (Icons.restaurant_rounded, 'Alimentacao', '/nutrition'),
      (Icons.inventory_2_rounded, 'Produtos', '/products'),
      (Icons.menu_book_rounded, 'Estudos', '/studies'),
      (Icons.folder_special_rounded, 'Projetos', '/projects'),
      (Icons.edit_note_rounded, 'Diario', '/diary'),
      (Icons.check_circle_rounded, 'Habitos', '/habits'),
      (Icons.auto_graph_rounded, 'Progresso', '/progress'),
      (Icons.radar_rounded, 'Areas da Vida', '/life-areas'),
      (Icons.calendar_month_rounded, 'Revisao Semanal', '/weekly-review'),
      (Icons.settings_rounded, 'Configuracoes', '/settings'),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Mais')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            leading: Icon(item.$1),
            title: Text(item.$2),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () => context.push(item.$3),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemCount: items.length,
      ),
    );
  }
}
