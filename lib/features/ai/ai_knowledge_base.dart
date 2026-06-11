class AppKnowledgeModule {
  const AppKnowledgeModule({
    required this.name,
    required this.description,
    required this.actions,
    required this.examples,
    required this.requiredData,
  });

  final String name;
  final String description;
  final List<String> actions;
  final List<String> examples;
  final List<String> requiredData;
}

class AppKnowledgeBase {
  const AppKnowledgeBase._();

  static const modules = <String, AppKnowledgeModule>{
    'rotina': AppKnowledgeModule(
      name: 'Rotina',
      description:
          'Organiza habitos, tarefas recorrentes e compromissos por dia da semana.',
      actions: [
        'createRoutineItem',
        'listRoutine',
        'completeRoutineItem',
        'clearRoutine',
      ],
      examples: [
        'adicione acordar as 06:00 em todos dias da semana',
        'coloca estudar matematica amanha as 19h',
        'me mostra minha rotina de hoje',
      ],
      requiredData: ['titulo', 'horario ou data'],
    ),
    'treino': AppKnowledgeModule(
      name: 'Treino',
      description:
          'Gerencia treinos, sessoes iniciadas e atalhos para o modo imersivo.',
      actions: ['startWorkout', 'listWorkouts'],
      examples: ['iniciar treino de peito', 'comecar treino', 'meus treinos'],
      requiredData: ['nome do treino quando houver'],
    ),
    'financas': AppKnowledgeModule(
      name: 'Financas',
      description: 'Registra entradas, saidas e mostra saldo e historico.',
      actions: ['createFinanceRecord', 'listFinance', 'showBalance'],
      examples: ['gastei 35 no mercado', 'recebi 1500 do salario', '/financas'],
      requiredData: ['valor', 'tipo de movimentacao'],
    ),
    'consumo': AppKnowledgeModule(
      name: 'Consumo',
      description: 'Registra agua, alimentos, bebidas e produtos consumidos.',
      actions: [
        'registerWater',
        'registerFood',
        'registerDrink',
        'registerProductConsumption',
      ],
      examples: ['bebi 250ml de agua', 'comi 2 ovos', 'tomei whey'],
      requiredData: ['item', 'quantidade quando disponivel'],
    ),
    'produtos': AppKnowledgeModule(
      name: 'Produtos',
      description: 'Cadastra produtos com informacoes nutricionais por porcao.',
      actions: [
        'createProduct',
        'listProducts',
        'updateProduct',
        'deleteProduct',
      ],
      examples: [
        'cadastrar produto whey',
        'adicionar produto barra de proteina',
        '/produtos',
      ],
      requiredData: ['nome do produto', 'porcao', 'dados nutricionais'],
    ),
    'tarefas': AppKnowledgeModule(
      name: 'Tarefas',
      description: 'Cria tarefas simples com opcional de prazo.',
      actions: ['createTask', 'completeTask'],
      examples: [
        'adicionar tarefa beber 2 litros de agua',
        '/add comprar pao amanha',
      ],
      requiredData: ['descricao'],
    ),
    'historico': AppKnowledgeModule(
      name: 'Historico',
      description: 'Mostra acoes recentes da IA e registros do dia.',
      actions: ['listHistory', 'clearHistory'],
      examples: ['me mostra meu historico', '/historico'],
      requiredData: [],
    ),
  };

  static const ambiguityGuidance = <String>[
    'Quando a frase tiver quantidade e nome de produto sem verbo claro, sugerir consumo ou cadastro.',
    'Quando faltar horario para rotina, pedir o horario antes de salvar.',
    'Quando houver mais de um produto parecido, pedir escolha.',
    'Quando nao entender, sugerir ate tres possibilidades com base no texto.',
  ];

  static String overviewText() {
    return 'Posso te ajudar com rotina, treinos, financas, consumo de agua, alimentos, produtos, tarefas e historico. '
        "Voce pode escrever algo como: 'bebi 250ml de agua', 'comi arroz e frango', 'iniciar treino de peito', "
        "'gastei 35 no mercado' ou 'cadastrar produto whey'.";
  }
}
