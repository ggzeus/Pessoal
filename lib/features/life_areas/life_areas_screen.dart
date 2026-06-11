import 'package:flutter/material.dart';

import '../../core/widgets/section_card.dart';

class LifeAreasScreen extends StatelessWidget {
  const LifeAreasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final areas = const [
      ('Corpo', 0.80),
      ('Estudos', 0.60),
      ('Sono', 0.40),
      ('Financas', 0.70),
      ('Projetos', 0.50),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Areas da Vida')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          for (final area in areas)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: SectionCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text(area.$1, style: Theme.of(context).textTheme.titleMedium)),
                        Text('${(area.$2 * 100).round()}%'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(value: area.$2),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
