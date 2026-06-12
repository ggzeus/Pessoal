import '../../../data/local/database/app_database.dart';
import '../../../data/repositories/personal_repository.dart';
import '../utils/normalize_message.dart';
import '../utils/parse_nutrition.dart';
import '../utils/parse_quantity.dart';

class ProductDraftData {
  static const Set<String> _placeholderNames = {
    'novo produto',
    'produto',
    'consumo',
  };

  const ProductDraftData({
    this.name,
    this.brand,
    this.category,
    this.servingSize,
    this.servingUnit,
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
    this.barcode,
    this.notes,
  });

  final String? name;
  final String? brand;
  final String? category;
  final double? servingSize;
  final String? servingUnit;
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
  final String? barcode;
  final String? notes;

  bool get hasName => !isPlaceholderName(name);

  bool get hasAnyNutrition =>
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
      potassium != null;

  bool get hasAnyData =>
      hasName ||
      brand != null ||
      category != null ||
      servingSize != null ||
      servingUnit != null ||
      hasAnyNutrition ||
      barcode != null ||
      notes != null;

  ProductDraftData merge(ProductDraftData other) {
    return ProductDraftData(
      name: other.name ?? name,
      brand: other.brand ?? brand,
      category: other.category ?? category,
      servingSize: other.servingSize ?? servingSize,
      servingUnit: other.servingUnit ?? servingUnit,
      calories: other.calories ?? calories,
      protein: other.protein ?? protein,
      carbohydrates: other.carbohydrates ?? carbohydrates,
      sugars: other.sugars ?? sugars,
      totalFat: other.totalFat ?? totalFat,
      saturatedFat: other.saturatedFat ?? saturatedFat,
      transFat: other.transFat ?? transFat,
      fiber: other.fiber ?? fiber,
      sodium: other.sodium ?? sodium,
      salt: other.salt ?? salt,
      cholesterol: other.cholesterol ?? cholesterol,
      potassium: other.potassium ?? potassium,
      barcode: other.barcode ?? barcode,
      notes: other.notes ?? notes,
    );
  }

  List<String> missingPrimaryFields() {
    if (!hasName) {
      return const ['name'];
    }
    return const [];
  }

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'brand': brand,
      'category': category,
      'servingSize': servingSize,
      'servingUnit': servingUnit,
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
      'barcode': barcode,
      'notes': notes,
    };
  }

  static ProductDraftData fromJson(Map<String, Object?> json) {
    return ProductDraftData(
      name: json['name']?.toString(),
      brand: json['brand']?.toString(),
      category: json['category']?.toString(),
      servingSize: _asDouble(json['servingSize']),
      servingUnit: json['servingUnit']?.toString(),
      calories: _asDouble(json['calories']),
      protein: _asDouble(json['protein']),
      carbohydrates: _asDouble(json['carbohydrates']),
      sugars: _asDouble(json['sugars']),
      totalFat: _asDouble(json['totalFat']),
      saturatedFat: _asDouble(json['saturatedFat']),
      transFat: _asDouble(json['transFat']),
      fiber: _asDouble(json['fiber']),
      sodium: _asDouble(json['sodium']),
      salt: _asDouble(json['salt']),
      cholesterol: _asDouble(json['cholesterol']),
      potassium: _asDouble(json['potassium']),
      barcode: json['barcode']?.toString(),
      notes: json['notes']?.toString(),
    );
  }

  static double? _asDouble(Object? value) {
    if (value is num) {
      return value.toDouble();
    }
    return double.tryParse(value?.toString() ?? '');
  }

  static bool isPlaceholderName(String? value) {
    final normalized = value?.trim().toLowerCase();
    if (normalized == null || normalized.isEmpty) {
      return true;
    }
    return _placeholderNames.contains(normalized);
  }
}

class ProductService {
  ProductService(this._repository);

  final PersonalRepository _repository;

  Future<List<Product>> listProducts() => _repository.loadProducts();

  Future<List<Product>> searchProducts(String query) async {
    final matches = await _repository.findProductsByQuery(query);
    matches.sort((left, right) {
      final normalizedQuery = NormalizeMessage.normalizeForComparison(query);
      final leftName = NormalizeMessage.normalizeForComparison(left.name);
      final rightName = NormalizeMessage.normalizeForComparison(right.name);
      final leftScore = _scoreMatch(normalizedQuery, leftName);
      final rightScore = _scoreMatch(normalizedQuery, rightName);
      return rightScore.compareTo(leftScore);
    });
    return matches;
  }

  Future<Product?> findExactProduct(String name) async {
    final normalizedTarget = NormalizeMessage.normalizeForComparison(name);
    final matches = await searchProducts(name);
    for (final product in matches) {
      if (NormalizeMessage.normalizeForComparison(product.name) ==
          normalizedTarget) {
        return product;
      }
    }
    return null;
  }

  ProductDraftData? parseNutritionMessage(String message) {
    final draft = parseDraftFromMessage(message);
    return draft.hasAnyNutrition ? draft : null;
  }

  ProductDraftData parseDraftFromMessage(
    String message, {
    String? fallbackName,
  }) {
    final original = message.trim();
    final normalized = NormalizeMessage.normalizeForComparison(original);
    final nutrition = NutritionParser.parse(normalized);
    final quantity = QuantityParser.parse(normalized);

    final cleaned = _removeKnownPhrases(original);
    final name = _extractName(cleaned, fallbackName: fallbackName);

    return ProductDraftData(
      name: name,
      servingSize: nutrition.servingSize ?? quantity?.value,
      servingUnit: nutrition.servingUnit ?? quantity?.unit,
      calories: nutrition.calories,
      protein: nutrition.protein,
      carbohydrates: nutrition.carbohydrates,
      sugars: nutrition.sugars,
      totalFat: nutrition.totalFat,
      saturatedFat: nutrition.saturatedFat,
      transFat: nutrition.transFat,
      fiber: nutrition.fiber,
      sodium: nutrition.sodium,
      salt: nutrition.salt,
      cholesterol: nutrition.cholesterol,
      potassium: nutrition.potassium,
    );
  }

  Future<Product> createOrUpdateFromDraft(
    ProductDraftData draft, {
    Product? existing,
  }) async {
    final safeName = draft.name?.trim();
    if (safeName == null || safeName.isEmpty) {
      throw StateError('Product name is required.');
    }

    final servingSize = draft.servingSize ?? 1;
    final servingUnit = draft.servingUnit ?? 'porcao';

    if (existing == null) {
      return _repository.createProduct(
        name: safeName,
        brand: draft.brand,
        category: draft.category ?? 'Produto geral',
        servingSize: servingSize,
        servingUnit: servingUnit,
        calories: draft.calories ?? 0,
        protein: draft.protein ?? 0,
        carbohydrates: draft.carbohydrates ?? 0,
        sugars: draft.sugars ?? 0,
        totalFat: draft.totalFat ?? 0,
        saturatedFat: draft.saturatedFat ?? 0,
        transFat: draft.transFat ?? 0,
        fiber: draft.fiber ?? 0,
        sodium: draft.sodium ?? 0,
        salt: draft.salt ?? 0,
        cholesterol: draft.cholesterol,
        potassium: draft.potassium,
        barcode: draft.barcode,
        notes: draft.notes,
      );
    }

    await _repository.updateProduct(
      product: existing,
      name: safeName,
      brand: draft.brand ?? existing.brand,
      category: draft.category ?? existing.category,
      servingSize: servingSize,
      servingUnit: servingUnit,
      calories: draft.calories ?? existing.calories,
      protein: draft.protein ?? existing.protein,
      carbohydrates: draft.carbohydrates ?? existing.carbohydrates,
      sugars: draft.sugars ?? existing.sugars,
      totalFat: draft.totalFat ?? existing.totalFat,
      saturatedFat: draft.saturatedFat ?? existing.saturatedFat,
      transFat: draft.transFat ?? existing.transFat,
      fiber: draft.fiber ?? existing.fiber,
      sodium: draft.sodium ?? existing.sodium,
      salt: draft.salt ?? existing.salt,
      cholesterol: draft.cholesterol ?? existing.cholesterol,
      potassium: draft.potassium ?? existing.potassium,
      barcode: draft.barcode ?? existing.barcode,
      notes: draft.notes ?? existing.notes,
      imagePath: existing.imagePath,
      ingredients: existing.ingredients,
      price: existing.price,
      purchaseLocation: existing.purchaseLocation,
      expiryDate: existing.expiryDate,
    );
    return (await _repository.loadProductById(existing.id)) ?? existing;
  }

  Future<Product> createProductFromChat({
    required String name,
    String? brand,
    String? category,
    required ProductDraftData draft,
    double servingSize = 1,
    String servingUnit = 'porcao',
  }) {
    return createOrUpdateFromDraft(
      draft.merge(
        ProductDraftData(
          name: name,
          brand: brand,
          category: category,
          servingSize: draft.servingSize ?? servingSize,
          servingUnit: draft.servingUnit ?? servingUnit,
        ),
      ),
    );
  }

  String summarizeDraft(ProductDraftData draft) {
    final segments = <String>[];
    if (draft.hasName) {
      segments.add('Produto ${draft.name}');
    }
    if (draft.servingSize != null) {
      final unit = draft.servingUnit ?? 'porcao';
      segments.add('porcao ${_formatNumber(draft.servingSize!)}$unit');
    }
    if (draft.calories != null) {
      segments.add('${_formatNumber(draft.calories!)} kcal');
    }
    if (draft.protein != null) {
      segments.add('${_formatNumber(draft.protein!)}g de proteina');
    }
    if (draft.carbohydrates != null) {
      segments.add('${_formatNumber(draft.carbohydrates!)}g de carboidratos');
    }
    if (draft.sugars != null) {
      segments.add('${_formatNumber(draft.sugars!)}g de acucar');
    }
    if (draft.totalFat != null) {
      segments.add('${_formatNumber(draft.totalFat!)}g de gordura');
    }
    if (draft.sodium != null) {
      segments.add('${_formatNumber(draft.sodium!)}mg de sodio');
    }
    if (draft.salt != null) {
      segments.add('${_formatNumber(draft.salt!)}g de sal');
    }
    return segments.join(', ');
  }

  int _scoreMatch(String query, String value) {
    if (value == query) {
      return 100;
    }
    if (value.startsWith(query)) {
      return 80;
    }
    if (value.contains(query)) {
      return 60;
    }
    return 0;
  }

  String _removeKnownPhrases(String text) {
    var cleaned = text;
    const phrases = [
      'cadastrar produto',
      'cadastro de produto',
      'adicionar produto',
      'criar produto',
      'salvar produto',
      'registrar produto',
      'produto',
    ];
    for (final phrase in phrases) {
      cleaned = cleaned.replaceAll(
        RegExp(RegExp.escape(phrase), caseSensitive: false),
        ' ',
      );
    }
    return cleaned;
  }

  String? _extractName(String text, {String? fallbackName}) {
    final normalized = NormalizeMessage.normalizeForComparison(text);
    final firstNumericIndex = RegExp(r'\d').firstMatch(normalized)?.start;
    var candidate = firstNumericIndex == null
        ? text
        : text.substring(0, firstNumericIndex);
    if (candidate.contains(',')) {
      candidate = candidate.split(',').first;
    }

    candidate = candidate
        .replaceAll(
          RegExp(
            r'\b(kcal|cal|caloria|calorias|proteina|proteinas|prot|carbo|carboidrato|carboidratos|acucar|acucares|gordura|gorduras|sodio|sal|fibra|fibras|porcao|unidade|scoop)\b',
            caseSensitive: false,
          ),
          ' ',
        )
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();

    if (candidate.isEmpty) {
      return ProductDraftData.isPlaceholderName(fallbackName)
          ? null
          : fallbackName;
    }

    return NormalizeMessage.titleCase(candidate);
  }

  String _formatNumber(double value) {
    return value % 1 == 0 ? value.toInt().toString() : value.toStringAsFixed(1);
  }
}
