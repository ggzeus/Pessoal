import 'package:flutter/material.dart';

import '../../core/widgets/section_card.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configuracoes')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SectionCard(
            child: Text('Privacidade: dados locais por padrao, sem login obrigatorio e sem envio automatico.'),
          ),
          const SizedBox(height: 10),
          const SectionCard(
            child: Text('Permissoes futuras serao pedidas somente quando a funcionalidade for usada.'),
          ),
          const SizedBox(height: 10),
          const SectionCard(
            child: Text('Proximas fases: backup criptografado, biometria, OCR de comprovantes e integracoes de saude.'),
          ),
        ],
      ),
    );
  }
}
