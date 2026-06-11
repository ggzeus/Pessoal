import 'package:flutter/material.dart';

import 'router.dart';
import 'theme.dart';

class ControlePessoalApp extends StatelessWidget {
  const ControlePessoalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Controle Pessoal',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      routerConfig: appRouter,
    );
  }
}
