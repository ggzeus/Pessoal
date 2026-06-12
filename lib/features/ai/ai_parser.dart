import '../../core/utils/date_utils.dart';
import 'ai_models.dart';

class ParsedQuantity {
  const ParsedQuantity({required this.quantity, required this.unit});

  final double quantity;
  final String unit;
}

class AiParser {
  static final RegExp _moneyPattern = RegExp(
    r'(?:(?:r\$)\s*)?(?:\d{1,3}(?:\.\d{3})+(?:,\d{1,2})?|\d+(?:,\d{1,2})?)',
    caseSensitive: false,
  );

  static final RegExp _timePattern = RegExp(
    r'(?:as|a|às)?\s*(\d{1,2})(?::(\d{2}))?\s*h?\b',
    caseSensitive: false,
  );

  static final RegExp _datePattern = RegExp(
    r'\b(\d{1,2})/(\d{1,2})(?:/(\d{4}))?\b',
  );

  static final RegExp _quantityUnitPattern = RegExp(
    r'(\d+(?:[.,]\d+)?)\s*(ml|l|litro|litros|g|kg|grama|gramas|scoop|scoops|porcao|porcoes|porção|porções|unidade|unidades|ovo|ovos)\b',
    caseSensitive: false,
  );

  static const Map<String, int> _weekdayMap = {
    'segunda': DateTime.monday,
    'terca': DateTime.tuesday,
    'terça': DateTime.tuesday,
    'quarta': DateTime.wednesday,
    'quinta': DateTime.thursday,
    'sexta': DateTime.friday,
    'sabado': DateTime.saturday,
    'sábado': DateTime.saturday,
    'domingo': DateTime.sunday,
  };

  static const List<String> _waterTerms = ['agua', 'água'];
  static const List<String> _drinkTerms = [
    'suco',
    'leite',
    'refrigerante',
    'cafe',
    'café',
    'cha',
    'chá',
    'energetico',
    'energético',
    'vitamina',
  ];
  static const List<String> _productTerms = [
    'whey',
    'barra de proteina',
    'barra de proteína',
    'iogurte',
    'energetico',
    'energético',
    'creatina',
    'suplemento',
  ];
  static const List<String> _foodVerbs = [
    'comi',
    'almocei',
    'jantei',
    'lanchei',
  ];
  static const List<String> _drinkVerbs = [
    'bebi',
    'tomei',
    'consumi',
    'registre',
    'registra',
    'adicione',
  ];
  static const List<String> _routineLeadTerms = [
    'adicione',
    'adiciona',
    'coloca',
    'me lembra de',
    'me lembra',
    'cria lembrete para',
    'criar lembrete para',
    'lembrete para',
  ];

  AiParsedIntent parseNatural(String message) {
    final trimmed = message.trim();
    final normalized = normalize(trimmed);
    if (trimmed.isEmpty) {
      return AiParsedIntent(
        type: AiIntentType.unknown,
        module: AiModule.assistant,
        originalMessage: message,
      );
    }

    if (_containsAny(normalized, [
      'o que voce consegue fazer',
      'o que voce faz',
      'como usar o app',
    ])) {
      return AiParsedIntent(
        type: AiIntentType.help,
        module: AiModule.assistant,
        originalMessage: message,
      );
    }

    if (_containsAny(normalized, [
      'meu historico',
      'historico da ia',
      'historico geral',
    ])) {
      return AiParsedIntent(
        type: AiIntentType.listHistory,
        module: AiModule.history,
        originalMessage: message,
      );
    }

    if (_containsAny(normalized, [
      'me mostra minha rotina',
      'minha rotina',
      'o que tenho hoje',
      'o que tenho para fazer hoje',
    ])) {
      return AiParsedIntent(
        type: AiIntentType.listRoutine,
        module: AiModule.routine,
        originalMessage: message,
        scheduledDate: extractDate(trimmed) ?? DateTime.now(),
      );
    }

    if (_containsAny(normalized, [
      'quanto de agua bebi hoje',
      'quanta agua bebi hoje',
    ])) {
      return AiParsedIntent(
        type: AiIntentType.showWaterIntake,
        module: AiModule.hydration,
        originalMessage: message,
      );
    }

    // Perguntas sobre calorias do dia
    if (_containsAny(normalized, [
      'quantas calorias consumi hoje',
      'quantas kcal consumi hoje',
      'quantas cal consumi hoje',
      'quantas calorias comi hoje',
      'quantas calorias tive hoje',
    ])) {
      return AiParsedIntent(
        type: AiIntentType.showCaloriesToday,
        module: AiModule.consumption,
        originalMessage: message,
      );
    }

    // Perguntas sobre nutriente específico
    final nutrientIntent = _tryParseNutrientQuery(normalized, message);
    if (nutrientIntent != null) return nutrientIntent;

    // Listar o que comeu hoje
    if (_containsAny(normalized, [
      'o que eu comi hoje',
      'o que comi hoje',
      'o que consumi hoje',
      'lista do que comi hoje',
    ])) {
      return AiParsedIntent(
        type: AiIntentType.listTodayConsumption,
        module: AiModule.consumption,
        originalMessage: message,
      );
    }

    if (_containsAny(normalized, [
      'meu consumo hoje',
      'meu consumo de hoje',
      'quanto comi hoje',
      '/consumo',
    ])) {
      return AiParsedIntent(
        type: AiIntentType.showDailyConsumption,
        module: AiModule.consumption,
        originalMessage: message,
      );
    }

    if (_containsAny(normalized, [
      'meu resumo nutricional',
      'resumo nutricional',
      '/nutricao',
      'quantas proteinas consumi hoje',
      'quantas proteínas consumi hoje',
    ])) {
      return AiParsedIntent(
        type: AiIntentType.showNutritionSummary,
        module: AiModule.consumption,
        originalMessage: message,
      );
    }

    if (_containsAny(normalized, [
      'listar produtos',
      'meus produtos cadastrados',
      'meus produtos',
    ])) {
      return AiParsedIntent(
        type: AiIntentType.listProducts,
        module: AiModule.products,
        originalMessage: message,
      );
    }

    if (_containsAny(normalized, [
      'cadastrar produto',
      'adicionar produto',
      'criar produto',
      'salvar produto',
      'registrar produto',
    ])) {
      return AiParsedIntent(
        type: AiIntentType.createProduct,
        module: AiModule.products,
        originalMessage: message,
        title: cleanProductName(trimmed),
      );
    }

    final money = extractMoney(trimmed);
    if (money != null &&
        _containsAny(normalized, [
          'gastei',
          'paguei',
          'recebi',
          'ganhei',
          'adicionar gasto',
          'adicionar entrada',
          'adiciona gasto',
          'adiciona entrada',
        ])) {
      return AiParsedIntent(
        type: AiIntentType.createFinanceRecord,
        module: AiModule.finance,
        originalMessage: message,
        amount: money,
        financeType: _containsAny(normalized, ['recebi', 'ganhei', 'entrada'])
            ? AiFinanceRecordType.income
            : AiFinanceRecordType.expense,
        description: cleanFinanceDescription(trimmed),
      );
    }

    final quantity = extractQuantity(trimmed);
    if (_isWaterMessage(normalized)) {
      final resolved = _resolveWaterQuantity(quantity, normalized);
      return AiParsedIntent(
        type: AiIntentType.registerWaterConsumption,
        module: AiModule.hydration,
        originalMessage: message,
        title: 'Agua',
        quantity: resolved.quantity,
        unit: resolved.unit,
        consumptionType: AiConsumptionType.water,
      );
    }

    if (_isProductConsumption(normalized)) {
      final resolved =
          quantity ?? const ParsedQuantity(quantity: 1, unit: 'porcao');
      return AiParsedIntent(
        type: AiIntentType.registerProductConsumption,
        module: AiModule.consumption,
        originalMessage: message,
        title: cleanConsumptionName(trimmed),
        quantity: resolved.quantity,
        unit: resolved.unit,
        consumptionType: AiConsumptionType.product,
      );
    }

    if (_isDrinkMessage(normalized)) {
      final resolved =
          quantity ?? const ParsedQuantity(quantity: 1, unit: 'porcao');
      return AiParsedIntent(
        type: AiIntentType.registerDrinkConsumption,
        module: AiModule.consumption,
        originalMessage: message,
        title: cleanConsumptionName(trimmed),
        quantity: resolved.quantity,
        unit: resolved.unit,
        consumptionType: AiConsumptionType.drink,
      );
    }

    if (_isFoodMessage(normalized)) {
      final resolved =
          quantity ?? const ParsedQuantity(quantity: 1, unit: 'unidade');
      // Qualquer mensagem com verbo de consumo é primeiro tentada como produto
      // O classifier vai buscar no banco e reclassificar se necessário
      return AiParsedIntent(
        type: AiIntentType.registerProductConsumption,
        module: AiModule.consumption,
        originalMessage: message,
        title: cleanConsumptionName(trimmed),
        quantity: resolved.quantity,
        unit: resolved.unit,
        consumptionType: AiConsumptionType.product,
      );
    }

    if (_containsAny(normalized, [
      'iniciar treino',
      'inicia treino',
      'comecar treino',
      'comecar treino',
      'treino de',
      'registrar treino',
      'meus treinos',
    ])) {
      return AiParsedIntent(
        type: normalized.contains('meus treinos')
            ? AiIntentType.listWorkout
            : AiIntentType.startWorkout,
        module: AiModule.training,
        originalMessage: message,
        title: extractWorkoutName(trimmed),
      );
    }

    final timeMinutes = extractTimeMinutes(trimmed);
    final weekdays = extractWeekdays(trimmed);
    final date = extractDate(trimmed);
    final hasRoutineSignal = _containsAny(normalized, [
      'rotina',
      'agenda',
      'todo dia',
      'todos os dias',
      'em todos dias da semana',
      'me lembra',
      'segunda',
      'terca',
      'terça',
      'quarta',
      'quinta',
      'sexta',
      'sabado',
      'sábado',
      'domingo',
    ]);

    if (timeMinutes != null || hasRoutineSignal) {
      return AiParsedIntent(
        type: AiIntentType.createRoutineItem,
        module: AiModule.routine,
        originalMessage: message,
        title: cleanRoutineTitle(trimmed),
        scheduledDate: date,
        timeMinutes: timeMinutes,
        metadata: {
          'notify':
              normalized.contains('lembrete') ||
                  normalized.contains('me lembra')
              ? 'true'
              : 'false',
          'recurrence': weekdays.length == 7
              ? 'daily'
              : (weekdays.isNotEmpty ? 'weekly' : 'single'),
          'weekdays': weekdays.join(','),
          if (normalized.contains('de 2 em 2 horas')) 'interval_hours': '2',
        },
      );
    }

    if (_containsAny(normalized, [
      'adicionar tarefa',
      'adiciona tarefa',
      'adiciona uma tarefa',
      'cria uma tarefa',
      'tenho que fazer',
    ])) {
      return AiParsedIntent(
        type: AiIntentType.createTask,
        module: AiModule.tasks,
        originalMessage: message,
        title: cleanTaskTitle(trimmed),
        scheduledDate: date,
        timeMinutes: timeMinutes,
      );
    }

    if (_containsAny(normalized, [
      'anota isso',
      'salva isso',
      'cria uma nota',
      'anota',
    ])) {
      return AiParsedIntent(
        type: AiIntentType.createNote,
        module: AiModule.notes,
        originalMessage: message,
        description: cleanNoteContent(trimmed),
      );
    }

    if (_looksLikeAmbiguousProduct(trimmed, quantity)) {
      final resolved =
          quantity ?? const ParsedQuantity(quantity: 1, unit: 'porcao');
      return AiParsedIntent(
        type: AiIntentType.unknown,
        module: AiModule.products,
        originalMessage: message,
        title: cleanConsumptionName(trimmed),
        quantity: resolved.quantity,
        unit: resolved.unit,
        metadata: const {'ambiguous': 'product_or_create'},
      );
    }

    return AiParsedIntent(
      type: AiIntentType.unknown,
      module: AiModule.assistant,
      originalMessage: message,
    );
  }

  DateTime? extractDate(String text, {DateTime? referenceDate}) {
    final now = referenceDate ?? DateTime.now();
    final normalized = normalize(text);

    if (normalized.contains('hoje')) {
      return AppDateUtils.startOfDay(now);
    }
    if (normalized.contains('amanha')) {
      return AppDateUtils.startOfDay(now.add(const Duration(days: 1)));
    }

    for (final entry in _weekdayMap.entries) {
      if (normalized.contains(entry.key)) {
        return _nextWeekday(now, entry.value);
      }
    }

    final match = _datePattern.firstMatch(text);
    if (match == null) {
      return null;
    }
    final day = int.tryParse(match.group(1)!);
    final month = int.tryParse(match.group(2)!);
    final year = int.tryParse(match.group(3) ?? '') ?? now.year;
    if (day == null || month == null) {
      return null;
    }
    return DateTime(year, month, day);
  }

  int? extractTimeMinutes(String text) {
    final match = _timePattern.firstMatch(text);
    if (match != null) {
      final hour = int.tryParse(match.group(1)!);
      final minute = int.tryParse(match.group(2) ?? '0');
      if (hour != null && minute != null) {
        return hour * 60 + minute;
      }
    }

    final normalized = normalize(text);
    final night = RegExp(r'\b(\d{1,2}) da noite\b').firstMatch(normalized);
    if (night != null) {
      final hour = int.tryParse(night.group(1)!);
      if (hour != null) {
        return (hour % 12 + 12) * 60;
      }
    }

    final morning = RegExp(r'\b(\d{1,2}) da manha\b').firstMatch(normalized);
    if (morning != null) {
      final hour = int.tryParse(morning.group(1)!);
      if (hour != null) {
        return hour * 60;
      }
    }

    return null;
  }

  double? extractMoney(String text) {
    final match = _moneyPattern.firstMatch(text);
    if (match == null) {
      return null;
    }
    return _parseLocalizedNumber(match.group(0)!);
  }

  ParsedQuantity? extractQuantity(String text) {
    final match = _quantityUnitPattern.firstMatch(text);
    if (match != null) {
      final quantity = _parseLocalizedNumber(match.group(1)!);
      final unit = normalize(match.group(2)!);
      if (quantity != null) {
        if (unit == 'l' || unit == 'litro' || unit == 'litros') {
          return ParsedQuantity(quantity: quantity * 1000, unit: 'ml');
        }
        if (unit == 'kg') {
          return ParsedQuantity(quantity: quantity * 1000, unit: 'g');
        }
        if (unit == 'ovo' ||
            unit == 'ovos' ||
            unit == 'unidade' ||
            unit == 'unidades') {
          return ParsedQuantity(quantity: quantity, unit: 'unidade');
        }
        if (unit == 'porcao' ||
            unit == 'porcoes' ||
            unit == 'porção' ||
            unit == 'porções') {
          return ParsedQuantity(quantity: quantity, unit: 'porcao');
        }
        return ParsedQuantity(quantity: quantity, unit: unit);
      }
    }

    final countMatch = RegExp(r'\b(\d+)\b').firstMatch(text);
    if (countMatch != null) {
      final quantity = double.tryParse(countMatch.group(1)!);
      if (quantity != null) {
        return ParsedQuantity(quantity: quantity, unit: 'unidade');
      }
    }

    return null;
  }

  List<int> extractWeekdays(String text) {
    final normalized = normalize(text);
    if (_containsAny(normalized, [
      'todo dia',
      'todos os dias',
      'em todos dias da semana',
    ])) {
      return const [
        DateTime.monday,
        DateTime.tuesday,
        DateTime.wednesday,
        DateTime.thursday,
        DateTime.friday,
        DateTime.saturday,
        DateTime.sunday,
      ];
    }

    final weekdays = <int>[];
    for (final entry in _weekdayMap.entries) {
      if (normalized.contains(entry.key)) {
        weekdays.add(entry.value);
      }
    }
    return weekdays.toSet().toList()..sort();
  }

  String cleanRoutineTitle(String text) {
    var cleaned = text.trim();
    cleaned = cleaned.replaceAll(_datePattern, ' ');
    cleaned = cleaned.replaceAll(_timePattern, ' ');
    cleaned = cleaned.replaceAll(
      RegExp(r'\b\d{1,2} da (noite|manha)\b', caseSensitive: false),
      ' ',
    );
    cleaned = cleaned.replaceAll(
      RegExp(r'\bde \d+ em \d+ horas\b', caseSensitive: false),
      ' ',
    );
    cleaned = _removePhrases(cleaned, [
      ..._routineLeadTerms,
      'na minha rotina',
      'na agenda',
      'todo dia',
      'todos os dias',
      'em todos dias da semana',
      'toda semana',
      'hoje',
      'amanha',
      'amanhã',
    ]);
    for (final weekday in _weekdayMap.keys) {
      cleaned = cleaned.replaceAll(
        RegExp('\\b${RegExp.escape(weekday)}\\b', caseSensitive: false),
        ' ',
      );
    }
    cleaned = cleaned.replaceAll(RegExp(r'\be\b', caseSensitive: false), ' ');
    return _tidy(cleaned, fallback: 'Novo item na rotina');
  }

  String cleanTaskTitle(String text) {
    var cleaned = text;
    cleaned = _removePhrases(cleaned, [
      'adicionar tarefa',
      'adiciona tarefa',
      'adiciona uma tarefa',
      'cria uma tarefa',
      'tarefa',
      'tenho que fazer',
    ]);
    cleaned = cleaned.replaceAll(_datePattern, ' ');
    cleaned = cleaned.replaceAll(_timePattern, ' ');
    return _tidy(cleaned, fallback: 'Nova tarefa');
  }

  String cleanNoteContent(String text) {
    final cleaned = _removePhrases(text, [
      'anota isso',
      'salva isso',
      'cria uma nota',
      'anota',
    ]);
    return _tidy(cleaned, fallback: 'Nova anotacao');
  }

  String cleanFinanceDescription(String text) {
    var cleaned = text.replaceAll(_moneyPattern, ' ');
    cleaned = cleaned.replaceAll(
      RegExp(r'\breais?\b', caseSensitive: false),
      ' ',
    );
    cleaned = _removePhrases(cleaned, [
      'adiciona gasto de',
      'adicionar gasto de',
      'adiciona entrada de',
      'adicionar entrada de',
      'gastei',
      'paguei',
      'recebi',
      'ganhei',
      'no',
      'na',
      'de',
      'do',
      'da',
    ]);
    return _tidy(cleaned, fallback: 'Movimentacao');
  }

  String extractWorkoutName(String text) {
    final cleaned = _removePhrases(text, [
      'iniciar treino de',
      'inicia treino de',
      'comecar treino de',
      'comecar treino de',
      'iniciar treino',
      'inicia treino',
      'comecar treino',
      'começar treino',
      'treino de',
      'treino',
    ]);
    return _tidy(cleaned, fallback: 'Treino rapido');
  }

  String cleanConsumptionName(String text) {
    // 1) Remover padrões com unidade explícita (ex: 250ml, 2 unidades)
    var cleaned = text.replaceAll(_quantityUnitPattern, ' ');
    // 2) Remover números soltos sem unidade (ex: "comi 2 halls" → remove "2")
    cleaned = cleaned.replaceAll(RegExp(r'\b\d+(?:[.,]\d+)?\b'), ' ');
    cleaned = cleaned.replaceAll(_datePattern, ' ');
    cleaned = cleaned.replaceAll(_timePattern, ' ');
    cleaned = _removePhrases(cleaned, [
      'bebi',
      'tomei',
      'consumi',
      'comi',
      'almocei',
      'jantei',
      'lanchei',
      'chupei',
      'registre',
      'registra',
      'adicione',
      'adiciona',
      'de agua',
      'de água',
      'de',
    ]);
    return _tidy(cleaned, fallback: 'Consumo');
  }

  String cleanProductName(String text) {
    final cleaned = _removePhrases(text, [
      'cadastrar produto',
      'adicionar produto',
      'criar produto',
      'salvar produto',
      'registrar produto',
      'produto',
    ]);
    return _tidy(cleaned, fallback: 'Novo produto');
  }

  String normalize(String value) {
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
    final lowercase = value.toLowerCase();
    final buffer = StringBuffer();
    for (final rune in lowercase.runes) {
      final char = String.fromCharCode(rune);
      buffer.write(replacements[char] ?? char);
    }
    return buffer.toString();
  }

  bool _containsAny(String haystack, List<String> needles) {
    return needles.any((term) => haystack.contains(normalize(term)));
  }

  bool _isWaterMessage(String normalized) {
    return _containsAny(normalized, _waterTerms) &&
        _containsAny(normalized, _drinkVerbs);
  }

  bool _isDrinkMessage(String normalized) {
    return !_isWaterMessage(normalized) &&
        _containsAny(normalized, _drinkTerms) &&
        _containsAny(normalized, _drinkVerbs);
  }

  bool _isProductConsumption(String normalized) {
    return _containsAny(normalized, _productTerms) &&
        _containsAny(normalized, _drinkVerbs);
  }

  bool _isFoodMessage(String normalized) {
    // Considera food apenas se tem verbo alimentar E não é água nem bebida específica
    return _containsAny(normalized, _foodVerbs) &&
        !_isDrinkMessage(normalized) &&
        !_isWaterMessage(normalized);
  }

  AiParsedIntent? _tryParseNutrientQuery(String normalized, String message) {
    // "quanto de açúcar consumi hoje" → showNutrientToday com nutrient: sugars
    // "quanto de proteína consumi hoje" → showNutrientToday com nutrient: protein
    final patterns = {
      RegExp(r'quanto (?:de )?(?:acucar|açúcar|acucares)\b'): 'sugars',
      RegExp(r'quanto (?:de )?(?:proteina|proteínas?|prot)\b'): 'protein',
      RegExp(r'quantos? (?:de )?carboidratos?\b'): 'carbohydrates',
      RegExp(r'quanto (?:de )?(?:gordura|gorduras?)\b'): 'totalFat',
      RegExp(r'quanto (?:de )?sodio\b'): 'sodium',
      RegExp(r'quanto (?:de )?sal\b'): 'salt',
      RegExp(r'quanto (?:de )?fibra\b'): 'fiber',
    };
    for (final entry in patterns.entries) {
      if (entry.key.hasMatch(normalized) &&
          (normalized.contains('consumi') ||
              normalized.contains('comi') ||
              normalized.contains('tive'))) {
        return AiParsedIntent(
          type: AiIntentType.showNutrientToday,
          module: AiModule.consumption,
          originalMessage: message,
          entities: {'nutrient': entry.value},
        );
      }
    }
    return null;
  }

  bool _looksLikeAmbiguousProduct(String text, ParsedQuantity? quantity) {
    final normalized = normalize(text);
    return quantity != null &&
        _containsAny(normalized, _productTerms) &&
        !_containsAny(normalized, _drinkVerbs) &&
        !_containsAny(normalized, ['produto', 'cadastrar']);
  }

  ParsedQuantity _resolveWaterQuantity(
    ParsedQuantity? quantity,
    String normalized,
  ) {
    if (quantity != null) {
      return quantity;
    }
    if (normalized.contains('litro')) {
      return const ParsedQuantity(quantity: 1000, unit: 'ml');
    }
    return const ParsedQuantity(quantity: 250, unit: 'ml');
  }

  String _removePhrases(String text, List<String> phrases) {
    var cleaned = text;
    for (final phrase in phrases) {
      cleaned = cleaned.replaceAll(
        RegExp('\\b${RegExp.escape(phrase)}\\b', caseSensitive: false),
        ' ',
      );
    }
    return cleaned;
  }

  double? _parseLocalizedNumber(String raw) {
    var token = raw.toLowerCase().replaceAll('r\$', '').trim();
    token = token.replaceAll(RegExp(r'[^0-9,\.]'), '');
    if (token.contains(',')) {
      token = token.replaceAll('.', '').replaceAll(',', '.');
    } else if (RegExp(r'^\d{1,3}(\.\d{3})+$').hasMatch(token)) {
      token = token.replaceAll('.', '');
    }
    return double.tryParse(token);
  }

  DateTime _nextWeekday(DateTime from, int weekday) {
    final base = AppDateUtils.startOfDay(from);
    var delta = weekday - base.weekday;
    if (delta < 0) {
      delta += 7;
    }
    return base.add(Duration(days: delta));
  }

  String _tidy(String text, {required String fallback}) {
    final cleaned = text
        .replaceAll(RegExp(r'\s+'), ' ')
        .replaceAll(';', ' ')
        .trim();
    if (cleaned.isEmpty) {
      return fallback;
    }
    return cleaned[0].toUpperCase() + cleaned.substring(1);
  }
}
