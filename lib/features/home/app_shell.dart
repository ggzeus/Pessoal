import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.auto_awesome_rounded),
            label: 'IA',
          ),
          NavigationDestination(icon: Icon(Icons.today_rounded), label: 'Hoje'),
          NavigationDestination(
            icon: Icon(Icons.calendar_view_week_rounded),
            label: 'Rotina',
          ),
          NavigationDestination(
            icon: Icon(Icons.fitness_center_rounded),
            label: 'Treino',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_balance_wallet_rounded),
            label: 'Financas',
          ),
          NavigationDestination(
            icon: Icon(Icons.grid_view_rounded),
            label: 'Mais',
          ),
        ],
      ),
    );
  }
}
