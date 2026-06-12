import 'normalize_message.dart';

class ParsedQuantityValue {
  const ParsedQuantityValue({
    required this.value,
    required this.unit,
    this.rawMatch,
  });

  final double value;
  final String unit;
  final String? rawMatch;
}

class QuantityParser {
  const QuantityParser._();

  static final RegExp _pattern = RegExp(
    r'(\d+(?:[.,]\d+)?)\s*(ml|l|litro|litros|g|kg|grama|gramas|kcal|cal|unidade|unidades|bala|balas|scoop|scoops|porcao|porcoes|ovo|ovos)\b',
    caseSensitive: false,
  );

  static ParsedQuantityValue? parse(String message) {
    final normalized = NormalizeMessage.normalizeForComparison(message);
    final match = _pattern.firstMatch(normalized);
    if (match == null) {
      return null;
    }

    final value = _parseNumber(match.group(1)!);
    if (value == null) {
      return null;
    }

    final unit = match.group(2)!;
    return ParsedQuantityValue(
      value: _normalizeUnitValue(value, unit),
      unit: _normalizeUnit(unit),
      rawMatch: match.group(0),
    );
  }

  static double? parseNumberOnly(String token) => _parseNumber(token);

  static String normalizeUnit(String unit) => _normalizeUnit(unit);

  static double? _parseNumber(String raw) {
    var token = raw.trim();
    if (token.contains(',')) {
      token = token.replaceAll('.', '').replaceAll(',', '.');
    }
    return double.tryParse(token);
  }

  static double _normalizeUnitValue(double value, String rawUnit) {
    final unit = _normalizeUnit(rawUnit);
    if (unit == 'ml' &&
        NormalizeMessage.normalizeForComparison(rawUnit) == 'l') {
      return value * 1000;
    }
    if (NormalizeMessage.normalizeForComparison(rawUnit) == 'litro' ||
        NormalizeMessage.normalizeForComparison(rawUnit) == 'litros') {
      return value * 1000;
    }
    if (unit == 'g' &&
        NormalizeMessage.normalizeForComparison(rawUnit) == 'kg') {
      return value * 1000;
    }
    return value;
  }

  static String _normalizeUnit(String unit) {
    final normalized = NormalizeMessage.normalizeForComparison(unit);
    switch (normalized) {
      case 'l':
      case 'litro':
      case 'litros':
        return 'ml';
      case 'kg':
      case 'grama':
      case 'gramas':
        return normalized == 'kg' ? 'g' : 'g';
      case 'unidade':
      case 'unidades':
      case 'bala':
      case 'balas':
      case 'ovo':
      case 'ovos':
        return 'unidade';
      case 'porcao':
      case 'porcoes':
        return 'porcao';
      default:
        return normalized;
    }
  }
}
