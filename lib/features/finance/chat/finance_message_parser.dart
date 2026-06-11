import '../../../data/local/database/app_database.dart';
import 'finance_chat_models.dart';

class FinanceMessageParser {
  FinanceMessageParser(this._categories)
    : _categoriesById = {
        for (final category in _categories) category.id: category,
      };

  final List<FinanceCategory> _categories;
  final Map<String, FinanceCategory> _categoriesById;

  static final RegExp _currencyPattern = RegExp(
    r'(?:(?:r\$)\s*)?(?:\d{1,3}(?:\.\d{3})+(?:,\d{1,2})?|\d+(?:,\d{1,2})?)',
    caseSensitive: false,
  );

  static final RegExp _commandPattern = RegExp(
    r'^/([a-z]+)\b',
    caseSensitive: false,
  );

  static const List<String> _incomeKeywords = [
    'recebi',
    'ganhei',
    'entrou',
    'salario',
    'salário',
    'pagamento',
    'pix recebido',
    'freela',
    'freelas',
    'venda',
    'deposito',
    'depósito',
    'renda',
  ];

  static const List<String> _expenseKeywords = [
    'gastei',
    'paguei',
    'comprei',
    'saiu',
    'mercado',
    'lanche',
    'aluguel',
    'conta',
    'internet',
    'energia',
    'gasolina',
    'delivery',
    'transferencia enviada',
    'transferência enviada',
    'transferi',
  ];

  static const List<String> _leadingActionKeywords = [
    'pix recebido',
    'transferencia enviada',
    'transferência enviada',
    'recebi',
    'ganhei',
    'entrou',
    'gastei',
    'paguei',
    'comprei',
    'saiu',
    'transferi',
  ];

  static const Map<String, List<String>> _categoryKeywords = {
    'FIN-CAT-001': [
      'mercado',
      'lanche',
      'comida',
      'almoço',
      'almoco',
      'jantar',
      'cafe',
      'café',
      'restaurante',
      'delivery',
      'ifood',
      'padaria',
    ],
    'FIN-CAT-002': [
      'gasolina',
      'uber',
      'combustivel',
      'combustível',
      'transporte',
      'passagem',
      'onibus',
      'ônibus',
      'metro',
      'metrô',
    ],
    'FIN-CAT-003': [
      'curso',
      'livro',
      'apostila',
      'prova',
      'faculdade',
      'estudo',
      'estudos',
    ],
    'FIN-CAT-004': [
      'salario',
      'salário',
      'pagamento',
      'cliente',
      'freela',
      'freelas',
      'venda',
      'pix recebido',
      'deposito',
      'depósito',
      'renda',
    ],
    'FIN-CAT-005': [
      'cinema',
      'jogo',
      'games',
      'lazer',
      'show',
      'passeio',
      'viagem',
    ],
    'FIN-CAT-006': [
      'dominio',
      'domínio',
      'hospedagem',
      'servidor',
      'plugin',
      'asset',
      'ferramenta',
      'projeto',
      'projeto',
    ],
    'FIN-CAT-007': [
      'remedio',
      'remédio',
      'consulta',
      'farmacia',
      'farmácia',
      'exame',
      'saude',
      'saúde',
    ],
    'FIN-CAT-008': [
      'academia',
      'suplemento',
      'creatina',
      'whey',
      'equipamento',
      'treino',
      'corrida',
    ],
    'FIN-CAT-009': [
      'presente',
      'familia',
      'família',
      'mae',
      'mãe',
      'pai',
      'filho',
    ],
    'FIN-CAT-010': [
      'reserva',
      'emergencia',
      'emergência',
      'guardei',
      'guardar',
    ],
    'FIN-CAT-011': [
      'investimento',
      'aporte',
      'apliquei',
      'aplicacao',
      'aplicação',
    ],
    'FIN-CAT-012': [
      'assinatura',
      'assinaturas',
      'netflix',
      'spotify',
      'internet',
      'streaming',
      'mensalidade',
      'adobe',
    ],
  };

  FinanceUserIntent parse(
    String rawMessage, {
    required bool awaitingClearConfirmation,
  }) {
    final trimmed = rawMessage.trim();
    if (trimmed.isEmpty) {
      return const FinanceInvalidIntent(
        'Digite uma mensagem para eu registrar sua movimentacao.',
      );
    }

    if (awaitingClearConfirmation && _isConfirmation(trimmed)) {
      return const FinanceConfirmClearIntent();
    }

    if (trimmed.startsWith('/')) {
      return _parseCommand(trimmed);
    }

    final amount = _extractAmount(trimmed);
    if (amount == null) {
      return const FinanceInvalidIntent(
        "Nao consegui identificar o valor. Tente escrever algo como: 'gastei 40 no mercado'.",
      );
    }

    final type = _detectType(trimmed);
    if (type == null) {
      return const FinanceInvalidIntent(
        "Nao consegui identificar se foi entrada ou saida. Tente algo como: 'recebi 500 salario' ou 'gastei 40 no mercado'.",
      );
    }

    final description = _extractDescription(trimmed);
    final category = _detectCategory(trimmed, description, type);

    return FinanceRegisterMovementIntent(
      type: type,
      amount: amount,
      description: description,
      categoryId: category?.id,
      categoryName: category?.name,
    );
  }

  FinanceUserIntent _parseCommand(String message) {
    final commandMatch = _commandPattern.firstMatch(message);
    final command = commandMatch?.group(1)?.toLowerCase();
    switch (command) {
      case 'add':
        return _parseAddCommand(message);
      case 'historico':
        return const FinanceHistoryIntent();
      case 'saldo':
        return const FinanceBalanceIntent();
      case 'limpar':
        return const FinanceClearIntent();
      case 'help':
        return const FinanceHelpIntent();
      default:
        return const FinanceInvalidIntent(
          'Comando nao reconhecido. Use /help para ver a lista de comandos disponiveis.',
        );
    }
  }

  FinanceUserIntent _parseAddCommand(String message) {
    final payload = message
        .replaceFirst(RegExp(r'^/add\b', caseSensitive: false), '')
        .trim();
    if (payload.isEmpty) {
      return const FinanceInvalidIntent(
        'Use /add valor descricao. Exemplo: /add 500 salario',
      );
    }

    final amount = _extractAmount(payload);
    if (amount == null) {
      return const FinanceInvalidIntent(
        'Nao consegui identificar o valor da entrada. Use algo como: /add 500 salario',
      );
    }

    final description = _extractDescription(payload);
    final category = _detectCategory(
      payload,
      description,
      FinanceEntryType.income,
    );

    return FinanceRegisterMovementIntent(
      type: FinanceEntryType.income,
      amount: amount,
      description: description,
      categoryId: category?.id,
      categoryName: category?.name,
      compactResponse: true,
    );
  }

  double? _extractAmount(String text) {
    final match = _currencyPattern.firstMatch(text);
    if (match == null) return null;

    var token = match.group(0)!.toLowerCase().replaceAll('r\$', '').trim();
    token = token.replaceAll(RegExp(r'[^0-9,\.]'), '');

    if (token.contains(',')) {
      token = token.replaceAll('.', '').replaceAll(',', '.');
    } else if (RegExp(r'^\d{1,3}(\.\d{3})+$').hasMatch(token)) {
      token = token.replaceAll('.', '');
    }

    return double.tryParse(token);
  }

  FinanceEntryType? _detectType(String text) {
    final normalized = _normalize(text);
    final incomeScore = _keywordScore(normalized, _incomeKeywords);
    final expenseScore = _keywordScore(normalized, _expenseKeywords);

    if (incomeScore == 0 && expenseScore == 0) {
      return null;
    }
    if (incomeScore == expenseScore) {
      final firstIncome = _firstKeywordIndex(normalized, _incomeKeywords);
      final firstExpense = _firstKeywordIndex(normalized, _expenseKeywords);
      if (firstIncome == -1 && firstExpense == -1) return null;
      if (firstExpense == -1) return FinanceEntryType.income;
      if (firstIncome == -1) return FinanceEntryType.expense;
      return firstIncome < firstExpense
          ? FinanceEntryType.income
          : FinanceEntryType.expense;
    }
    return incomeScore > expenseScore
        ? FinanceEntryType.income
        : FinanceEntryType.expense;
  }

  String _extractDescription(String text) {
    var cleaned = text.trim();
    cleaned = cleaned.replaceFirst(_currencyPattern, ' ');
    cleaned = cleaned.replaceAll(
      RegExp(r'\breais?\b', caseSensitive: false),
      ' ',
    );
    cleaned = cleaned.replaceAll(RegExp(r'\brs\b', caseSensitive: false), ' ');

    for (final keyword in _leadingActionKeywords) {
      final pattern = RegExp(
        '^${RegExp.escape(keyword)}\\b',
        caseSensitive: false,
      );
      cleaned = cleaned.replaceFirst(pattern, ' ').trimLeft();
    }

    cleaned = cleaned.replaceFirst(
      RegExp(r'^(de|do|da|no|na|em|para|pro|pra)\b', caseSensitive: false),
      ' ',
    );
    cleaned = cleaned.replaceAll(RegExp(r'\s+'), ' ').trim();

    return cleaned.isEmpty ? 'Movimentacao manual' : _capitalize(cleaned);
  }

  FinanceCategory? _detectCategory(
    String rawText,
    String description,
    FinanceEntryType type,
  ) {
    final normalized = '${_normalize(rawText)} ${_normalize(description)}';

    for (final entry in _categoryKeywords.entries) {
      final category = _categoriesById[entry.key];
      if (category == null) {
        continue;
      }
      if (type == FinanceEntryType.income && category.nature != 'income') {
        continue;
      }
      if (type == FinanceEntryType.expense && category.nature != 'expense') {
        continue;
      }
      if (entry.value.any(
        (keyword) => normalized.contains(_normalize(keyword)),
      )) {
        return category;
      }
    }

    for (final category in _categories) {
      if (type == FinanceEntryType.income && category.nature != 'income') {
        continue;
      }
      if (type == FinanceEntryType.expense && category.nature != 'expense') {
        continue;
      }
      if (normalized.contains(_normalize(category.name))) {
        return category;
      }
    }

    return null;
  }

  bool _isConfirmation(String text) {
    final normalized = _normalize(text);
    return normalized == 'sim' ||
        normalized == 'confirmar' ||
        normalized == '/confirmar' ||
        normalized == 'pode limpar';
  }

  int _keywordScore(String normalizedText, List<String> keywords) {
    var score = 0;
    for (final keyword in keywords) {
      final normalizedKeyword = _normalize(keyword);
      if (!normalizedText.contains(normalizedKeyword)) continue;
      score += switch (normalizedKeyword) {
        'recebi' ||
        'ganhei' ||
        'entrou' ||
        'gastei' ||
        'paguei' ||
        'comprei' ||
        'saiu' => 3,
        'pix recebido' || 'transferencia enviada' || 'transferi' => 3,
        _ => 1,
      };
    }
    return score;
  }

  int _firstKeywordIndex(String normalizedText, List<String> keywords) {
    final indexes = keywords
        .map((keyword) => normalizedText.indexOf(_normalize(keyword)))
        .where((index) => index >= 0)
        .toList();
    if (indexes.isEmpty) return -1;
    indexes.sort();
    return indexes.first;
  }

  String _normalize(String value) {
    final lowercase = value.toLowerCase();
    const replacements = {
      'á': 'a',
      'à': 'a',
      'â': 'a',
      'ã': 'a',
      'ä': 'a',
      'é': 'e',
      'è': 'e',
      'ê': 'e',
      'ë': 'e',
      'í': 'i',
      'ì': 'i',
      'î': 'i',
      'ï': 'i',
      'ó': 'o',
      'ò': 'o',
      'ô': 'o',
      'õ': 'o',
      'ö': 'o',
      'ú': 'u',
      'ù': 'u',
      'û': 'u',
      'ü': 'u',
      'ç': 'c',
    };

    final buffer = StringBuffer();
    for (final rune in lowercase.runes) {
      final char = String.fromCharCode(rune);
      buffer.write(replacements[char] ?? char);
    }
    return buffer.toString();
  }

  String _capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}
