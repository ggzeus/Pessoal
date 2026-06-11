import '../../core/utils/date_utils.dart';
import 'ai_models.dart';

class AiParser {
  static final RegExp _amountPattern = RegExp(
    r'(?:(?:r\$)\s*)?(?:\d{1,3}(?:\.\d{3})+(?:,\d{1,2})?|\d+(?:,\d{1,2})?)',
    caseSensitive: false,
  );

  static final RegExp _timePattern = RegExp(
    r'(?:as|às)?\s*(\d{1,2})(?::(\d{2}))?\s*h?\b',
    caseSensitive: false,
  );

  static final RegExp _datePattern = RegExp(
    r'\b(\d{1,2})/(\d{1,2})(?:/(\d{4}))?\b',
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

  static const List<String> _routineKeywords = [
    'rotina',
    'agenda',
    'lembrete',
    'me lembra',
    'coloca',
    'adiciona',
    'cria uma tarefa',
    'tenho que fazer',
  ];

  static const List<String> _taskKeywords = [
    'tarefa',
    'adicionar tarefa',
    'adiciona uma tarefa',
    'comprar',
    'fazer',
  ];

  static const List<String> _noteKeywords = [
    'anota isso',
    'salva isso',
    'cria um elemento',
    'cria uma nota',
    'anota',
  ];

  static const List<String> _workoutKeywords = [
    'iniciar treino',
    'inicia treino',
    'comecar treino',
    'comecar treino',
    'treino de',
    'registrar treino',
  ];

  static const List<String> _financeIncomeKeywords = [
    'recebi',
    'ganhei',
    'adicionar entrada',
    'adiciona entrada',
    'pix recebido',
  ];

  static const List<String> _financeExpenseKeywords = [
    'gastei',
    'paguei',
    'adicionar gasto',
    'adiciona gasto',
    'gasto',
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
      'apaga historico',
      'limpa historico',
      'apagar historico',
    ])) {
      return AiParsedIntent(
        type: AiIntentType.clearHistory,
        module: AiModule.history,
        originalMessage: message,
      );
    }

    if (_containsAny(normalized, [
      'apaga minha rotina',
      'limpa minha rotina',
      'resetar rotina',
    ])) {
      return AiParsedIntent(
        type: AiIntentType.clearRoutine,
        module: AiModule.routine,
        originalMessage: message,
        scheduledDate: extractDate(trimmed) ?? DateTime.now(),
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
      'meus treinos',
      'mostrar treino',
      'ver treino atual',
    ])) {
      return AiParsedIntent(
        type: AiIntentType.listWorkout,
        module: AiModule.training,
        originalMessage: message,
      );
    }

    if (_containsAny(normalized, [
      'meu saldo',
      'resumo financeiro',
      'minhas financas',
    ])) {
      return AiParsedIntent(
        type: AiIntentType.listFinance,
        module: AiModule.finance,
        originalMessage: message,
      );
    }

    if (_containsAny(normalized, [
      'meu historico',
      'historico geral',
      'historico da ia',
    ])) {
      return AiParsedIntent(
        type: AiIntentType.listHistory,
        module: AiModule.history,
        originalMessage: message,
      );
    }

    final amount = extractAmount(trimmed);
    if (amount != null &&
        (_containsAny(normalized, _financeIncomeKeywords) ||
            _containsAny(normalized, _financeExpenseKeywords))) {
      return AiParsedIntent(
        type: AiIntentType.createFinanceRecord,
        module: AiModule.finance,
        originalMessage: message,
        description: cleanFinanceDescription(trimmed),
        amount: amount,
        financeType: _containsAny(normalized, _financeIncomeKeywords)
            ? AiFinanceRecordType.income
            : AiFinanceRecordType.expense,
      );
    }

    if (_containsAny(normalized, _workoutKeywords)) {
      return AiParsedIntent(
        type: AiIntentType.startWorkout,
        module: AiModule.training,
        originalMessage: message,
        title: extractWorkoutName(trimmed),
        scheduledDate: extractDate(trimmed),
        timeMinutes: extractTimeMinutes(trimmed),
      );
    }

    final extractedDate = extractDate(trimmed);
    final extractedTime = extractTimeMinutes(trimmed);
    if ((_containsAny(normalized, _routineKeywords) ||
            extractedDate != null ||
            extractedTime != null) &&
        !_containsAny(normalized, _financeExpenseKeywords) &&
        !_containsAny(normalized, _financeIncomeKeywords)) {
      return AiParsedIntent(
        type: AiIntentType.createRoutineItem,
        module: AiModule.routine,
        originalMessage: message,
        title: cleanRoutineTitle(trimmed),
        scheduledDate: extractedDate,
        timeMinutes: extractedTime,
        metadata: {
          'notify':
              normalized.contains('lembrete') ||
                  normalized.contains('me lembra')
              ? 'true'
              : 'false',
        },
      );
    }

    if (_containsAny(normalized, _taskKeywords)) {
      return AiParsedIntent(
        type: AiIntentType.createTask,
        module: AiModule.tasks,
        originalMessage: message,
        title: cleanTaskTitle(trimmed),
        scheduledDate: extractedDate,
        timeMinutes: extractedTime,
      );
    }

    if (_containsAny(normalized, _noteKeywords)) {
      return AiParsedIntent(
        type: AiIntentType.createNote,
        module: AiModule.notes,
        originalMessage: message,
        description: cleanNoteContent(trimmed),
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
    if (match != null) {
      final day = int.tryParse(match.group(1)!);
      final month = int.tryParse(match.group(2)!);
      final year = int.tryParse(match.group(3) ?? '') ?? now.year;
      if (day != null && month != null) {
        return DateTime(year, month, day);
      }
    }

    return null;
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
    final nightMatch = RegExp(r'\b(\d{1,2}) da noite\b').firstMatch(normalized);
    if (nightMatch != null) {
      final hour = int.tryParse(nightMatch.group(1)!);
      if (hour != null) {
        return (hour % 12 + 12) * 60;
      }
    }

    final morningMatch = RegExp(
      r'\b(\d{1,2}) da manha\b',
    ).firstMatch(normalized);
    if (morningMatch != null) {
      final hour = int.tryParse(morningMatch.group(1)!);
      if (hour != null) {
        return hour * 60;
      }
    }

    return null;
  }

  double? extractAmount(String text) {
    final match = _amountPattern.firstMatch(text);
    if (match == null) {
      return null;
    }

    var token = match.group(0)!.toLowerCase().replaceAll('r\$', '').trim();
    token = token.replaceAll(RegExp(r'[^0-9,\.]'), '');

    if (token.contains(',')) {
      token = token.replaceAll('.', '').replaceAll(',', '.');
    } else if (RegExp(r'^\d{1,3}(\.\d{3})+$').hasMatch(token)) {
      token = token.replaceAll('.', '');
    }

    return double.tryParse(token);
  }

  String cleanRoutineTitle(String text) {
    var cleaned = text.trim();
    cleaned = cleaned.replaceAll(_datePattern, ' ');
    cleaned = cleaned.replaceAll(_timePattern, ' ');
    cleaned = cleaned.replaceAll(
      RegExp(r'\b\d{1,2} da (noite|manha)\b', caseSensitive: false),
      ' ',
    );
    for (final phrase in [
      'coloca',
      'adiciona',
      'adiciona na minha rotina',
      'adiciona a minha rotina',
      'na minha rotina',
      'na agenda',
      'criar lembrete para',
      'cria lembrete para',
      'me lembra de',
      'me lembra',
      'coloca na agenda',
      'hoje',
      'amanha',
      'amanhã',
    ]) {
      cleaned = cleaned.replaceAll(
        RegExp(RegExp.escape(phrase), caseSensitive: false),
        ' ',
      );
    }
    return _tidy(cleaned, fallback: 'Novo item na rotina');
  }

  String cleanTaskTitle(String text) {
    var cleaned = text.trim();
    cleaned = cleaned.replaceAll(_datePattern, ' ');
    cleaned = cleaned.replaceAll(_timePattern, ' ');
    for (final phrase in [
      'adicionar tarefa',
      'adiciona tarefa',
      'adiciona uma tarefa',
      'cria uma tarefa',
      'tarefa:',
      'tarefa',
    ]) {
      cleaned = cleaned.replaceAll(
        RegExp(RegExp.escape(phrase), caseSensitive: false),
        ' ',
      );
    }
    return _tidy(cleaned, fallback: 'Nova tarefa');
  }

  String cleanNoteContent(String text) {
    var cleaned = text.trim();
    for (final phrase in [
      'anota isso',
      'salva isso',
      'cria uma nota',
      'anota',
    ]) {
      cleaned = cleaned.replaceAll(
        RegExp(RegExp.escape(phrase), caseSensitive: false),
        ' ',
      );
    }
    return _tidy(cleaned, fallback: 'Nova anotacao');
  }

  String cleanFinanceDescription(String text) {
    var cleaned = text.trim();
    cleaned = cleaned.replaceAll(_amountPattern, ' ');
    cleaned = cleaned.replaceAll(
      RegExp(r'\breais?\b', caseSensitive: false),
      ' ',
    );
    for (final phrase in [
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
    ]) {
      cleaned = cleaned.replaceAll(
        RegExp('^${RegExp.escape(phrase)}\\b', caseSensitive: false),
        ' ',
      );
    }
    return _tidy(cleaned, fallback: 'Movimentacao');
  }

  String extractWorkoutName(String text) {
    var cleaned = text.trim();
    for (final phrase in [
      'iniciar treino de',
      'inicia treino de',
      'comecar treino de',
      'comecar treino de',
      'iniciar treino',
      'comecar treino',
      'treino de',
    ]) {
      cleaned = cleaned.replaceAll(
        RegExp(RegExp.escape(phrase), caseSensitive: false),
        ' ',
      );
    }
    return _tidy(cleaned, fallback: 'Treino rapido');
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

  bool _containsAny(String normalizedText, List<String> terms) {
    return terms.any((term) => normalizedText.contains(normalize(term)));
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
    final cleaned = text.replaceAll(RegExp(r'\s+'), ' ').trim();
    if (cleaned.isEmpty) {
      return fallback;
    }
    return cleaned[0].toUpperCase() + cleaned.substring(1);
  }
}
