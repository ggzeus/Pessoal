import 'normalize_message.dart';
import 'parse_quantity.dart';

class ParsedNutritionData {
  const ParsedNutritionData({
    this.calories,
    this.protein,
    this.carbohydrates,
    this.sugars,
    this.totalFat,
    this.saturatedFat,
    this.transFat,
    this.fiber,
    this.sodium,
    this.salt,
    this.cholesterol,
    this.potassium,
    this.servingSize,
    this.servingUnit,
  });

  final double? calories;
  final double? protein;
  final double? carbohydrates;
  final double? sugars;
  final double? totalFat;
  final double? saturatedFat;
  final double? transFat;
  final double? fiber;
  final double? sodium;
  final double? salt;
  final double? cholesterol;
  final double? potassium;
  final double? servingSize;
  final String? servingUnit;

  bool get hasAnyValue =>
      calories != null ||
      protein != null ||
      carbohydrates != null ||
      sugars != null ||
      totalFat != null ||
      saturatedFat != null ||
      transFat != null ||
      fiber != null ||
      sodium != null ||
      salt != null ||
      cholesterol != null ||
      potassium != null ||
      servingSize != null ||
      servingUnit != null;

  Map<String, Object?> toJson() {
    return {
      'calories': calories,
      'protein': protein,
      'carbohydrates': carbohydrates,
      'sugars': sugars,
      'totalFat': totalFat,
      'saturatedFat': saturatedFat,
      'transFat': transFat,
      'fiber': fiber,
      'sodium': sodium,
      'salt': salt,
      'cholesterol': cholesterol,
      'potassium': potassium,
      'servingSize': servingSize,
      'servingUnit': servingUnit,
    };
  }
}

class NutritionParser {
  const NutritionParser._();

  static ParsedNutritionData parse(String message) {
    final normalized = NormalizeMessage.normalizeForComparison(
      message,
    ).replaceAll(',', '.');

    double? extractWithUnits(
      List<String> keywords,
      List<String> acceptedUnits,
    ) {
      for (final keyword in keywords) {
        final afterPattern = RegExp(
          '${RegExp.escape(keyword)}\\s*(?:de\\s*)?(\\d+(?:\\.\\d+)?)\\s*(mg|g|kcal|cal)?',
          caseSensitive: false,
        );
        final afterMatch = afterPattern.firstMatch(normalized);
        if (afterMatch != null) {
          return QuantityParser.parseNumberOnly(afterMatch.group(1)!);
        }

        final beforePattern = RegExp(
          '(\\d+(?:\\.\\d+)?)\\s*(mg|g|kcal|cal)?\\s*(?:de\\s*)?${RegExp.escape(keyword)}',
          caseSensitive: false,
        );
        final beforeMatch = beforePattern.firstMatch(normalized);
        if (beforeMatch != null) {
          return QuantityParser.parseNumberOnly(beforeMatch.group(1)!);
        }
      }

      for (final unit in acceptedUnits) {
        for (final keyword in keywords) {
          final pattern = RegExp(
            '(\\d+(?:\\.\\d+)?)\\s*${RegExp.escape(unit)}\\s*(?:de\\s*)?${RegExp.escape(keyword)}',
            caseSensitive: false,
          );
          final match = pattern.firstMatch(normalized);
          if (match != null) {
            return QuantityParser.parseNumberOnly(match.group(1)!);
          }
        }
      }

      return null;
    }

    final calories = extractWithUnits(
      const ['kcal', 'cal', 'caloria', 'calorias'],
      const ['kcal', 'cal'],
    );
    final protein = extractWithUnits(
      const ['proteina', 'proteinas', 'prot', 'protein'],
      const ['g'],
    );
    final carbohydrates = extractWithUnits(
      const ['carbo', 'carbos', 'carboidrato', 'carboidratos'],
      const ['g'],
    );
    final sugars = extractWithUnits(
      const ['acucar', 'acucares', 'acucare', 'acucares'],
      const ['g'],
    );
    final totalFat = extractWithUnits(
      const [
        'gordura',
        'gorduras',
        'gordura total',
        'gorduras totais',
        'fat',
        'lipidios',
      ],
      const ['g'],
    );
    final saturatedFat = extractWithUnits(
      const [
        'saturada',
        'gordura saturada',
        'gorduras saturadas',
        'gord saturada',
      ],
      const ['g'],
    );
    final transFat = extractWithUnits(
      const ['trans', 'gordura trans'],
      const ['g'],
    );
    final fiber = extractWithUnits(
      const ['fibra', 'fibras', 'fibra alimentar'],
      const ['g'],
    );
    final sodium = extractWithUnits(
      const ['sodio', 'sodium'],
      const ['mg', 'g'],
    );
    final salt = extractWithUnits(const ['sal'], const ['g']);
    final cholesterol = extractWithUnits(
      const ['colesterol'],
      const ['mg', 'g'],
    );
    final potassium = extractWithUnits(const ['potassio'], const ['mg', 'g']);

    double? servingSize;
    String? servingUnit;
    final servingPattern = RegExp(
      r'(?:porcao|porcoes|serving)?\s*(\d+(?:\.\d+)?)\s*(ml|g|unidade|unidades|bala|balas|scoop|scoops)\b',
      caseSensitive: false,
    );
    final servingMatch = servingPattern.firstMatch(normalized);
    if (servingMatch != null) {
      servingSize = QuantityParser.parseNumberOnly(servingMatch.group(1)!);
      servingUnit = QuantityParser.normalizeUnit(servingMatch.group(2)!);
    }

    return ParsedNutritionData(
      calories: calories,
      protein: protein,
      carbohydrates: carbohydrates,
      sugars: sugars,
      totalFat: totalFat,
      saturatedFat: saturatedFat,
      transFat: transFat,
      fiber: fiber,
      sodium: sodium,
      salt: salt,
      cholesterol: cholesterol,
      potassium: potassium,
      servingSize: servingSize,
      servingUnit: servingUnit,
    );
  }
}
