# Controle Pessoal

Aplicativo Flutter offline-first para rotina, missao do dia, tarefas, estudos, treinos, alimentacao, agua, financas, projetos, diario, habitos e progresso.

O app foi criado a partir dos requisitos de `artifacts/about.md` e do repertorio inicial de `artifacts/repertorio.md`.

## Stack

- Flutter 3 / Dart 3
- Material 3
- Riverpod
- GoRouter
- Drift + SQLite local
- Seed offline em JSON dentro de `assets/seed/`

## Como rodar

```bash
flutter pub get
dart run build_runner build
flutter run
```

Para gerar APK debug:

```bash
flutter build apk --debug
```

## Validacao executada

```bash
flutter analyze
flutter test
flutter build apk --debug
```

Resultado atual:

- `flutter analyze`: sem issues.
- `flutter test`: todos os testes passaram.
- `flutter build apk --debug`: APK gerado em `build/app/outputs/flutter-apk/app-debug.apk`.

## Estrutura principal

```txt
lib/
  app/
    app.dart
    router.dart
    theme.dart
  core/
    constants/
    utils/
    widgets/
  data/
    local/
      database/
      seed/
    repositories/
  features/
    home/
    routine/
    mission/
    nutrition/
    training/
    immersive_training/
    studies/
    finance/
    projects/
    diary/
    habits/
    weekly_review/
    life_areas/
    progress/
    settings/
assets/
  seed/
```

## Seed local

Os arquivos em `assets/seed/` foram gerados a partir de `artifacts/repertorio.md`:

- `study_units.json`: 116 unidades de estudo.
- `exercises.json`: 370 exercicios/treinos.
- `football_drills.json`: 130 treinos de futebol.
- `finance_categories.json`: 12 categorias financeiras.
- `habits.json`: 10 habitos.
- `workout_templates.json`: 4 templates de treino.

O seed roda no primeiro uso via `SeedService` e grava uma chave de versao em `app_settings`.

## Implementado no MVP

- Home/Dashboard com missao, proximo evento, XP, agua, financas, treino, estudo e atalhos rapidos.
- Rotina semanal com criacao de evento por dia.
- Missao do dia com criacao manual, geracao simples e conclusao com XP.
- Tarefas rapidas com conclusao e XP.
- Registro de agua.
- Registro rapido de alimento.
- Registro de gastos e entradas.
- Gastos fixos.
- Resumo financeiro mensal.
- Biblioteca de estudos carregada do repertorio.
- Biblioteca de treinos/exercicios carregada do repertorio.
- Modo imersivo basico com cronometro, pausa e pular.
- Projetos pessoais com proxima acao.
- Diario rapido com humor, energia, vitoria e aprendizado.
- Habitos com marcacao e XP.
- Progresso com nivel, XP e fontes de pontuacao.
- Revisao semanal inicial.
- Areas da vida inicial.
- Configuracoes com diretrizes de privacidade e proximas permissoes.

## Proximas fases

- Edicao/remocao completa de rotina e excecoes por data/periodo.
- Graficos financeiros com `fl_chart`.
- Cadastro completo de alimentos favoritos e metas nutricionais.
- Sessao de treino com passos reais vindos do template.
- Registro completo de estudos e revisoes espacadas.
- Conquistas desbloqueaveis.
- Notificacoes locais por rotina, estudo, agua, diario e gastos fixos.
- Anexo de comprovantes por camera/galeria.
- Exportacao e exclusao de dados.
- Protecao futura de diario/financas com senha ou biometria.
- OCR, HealthKit/Health Connect, uso de apps e backup criptografado.
