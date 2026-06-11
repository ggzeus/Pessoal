import '../../../data/local/database/app_database.dart';
import '../../../data/repositories/personal_repository.dart';

class ProductNutritionDraft {
  const ProductNutritionDraft({
    required this.calories,
    required this.protein,
    required this.carbohydrates,
    required this.sugars,
    required this.totalFat,
    required this.saturatedFat,
    required this.transFat,
    required this.fiber,
    required this.sodium,
    required this.salt,
  });

  final double calories;
  final double protein;
  final double carbohydrates;
  final double sugars;
  final double totalFat;
  final double saturatedFat;
  final double transFat;
  final double fiber;
  final double sodium;
  final double salt;
}

class ProductService {
  ProductService(this._repository);

  final PersonalRepository _repository;

  Future<List<Product>> listProducts() => _repository.loadProducts();

  Future<List<Product>> searchProducts(String query) {
    return _repository.findProductsByQuery(query);
  }

  ProductNutritionDraft? parseNutritionMessage(String text) {
    final normalized = text.toLowerCase().replaceAll(',', '.');

    double? extract(String pattern) {
      final match = RegExp(
        pattern,
        caseSensitive: false,
      ).firstMatch(normalized);
      return match == null ? null : double.tryParse(match.group(1)!);
    }

    final calories = extract(
      r'(\d+(?:\.\d+)?)\s*(?:kcal|cal|caloria|calorias)',
    );
    final protein = extract(
      r'(\d+(?:\.\d+)?)\s*g\s*(?:proteina|proteinas|protein)',
    );
    final carbohydrates = extract(
      r'(\d+(?:\.\d+)?)\s*g\s*(?:carbo|carboidrato|carboidratos)',
    );
    final sugars = extract(
      r'(\d+(?:\.\d+)?)\s*g\s*(?:acucar|acucares|açucar|açucares)',
    );
    final totalFat = extract(r'(\d+(?:\.\d+)?)\s*g\s*(?:gordura|gorduras)');
    final saturatedFat = extract(
      r'(\d+(?:\.\d+)?)\s*g\s*(?:saturada|gordura saturada)',
    );
    final transFat = extract(r'(\d+(?:\.\d+)?)\s*(?:g\s*)?(?:trans)');
    final fiber = extract(r'(\d+(?:\.\d+)?)\s*g\s*(?:fibra|fibras)');
    final sodium = extract(r'(\d+(?:\.\d+)?)\s*(?:mg)\s*(?:sodio|sódio)');
    final salt = extract(r'(\d+(?:\.\d+)?)\s*g\s*(?:sal)');

    if (calories == null ||
        protein == null ||
        carbohydrates == null ||
        sugars == null ||
        totalFat == null ||
        saturatedFat == null ||
        transFat == null ||
        fiber == null ||
        sodium == null ||
        salt == null) {
      return null;
    }

    return ProductNutritionDraft(
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
    );
  }

  Future<Product> createProductFromChat({
    required String name,
    String? brand,
    String? category,
    required ProductNutritionDraft draft,
    double servingSize = 1,
    String servingUnit = 'porcao',
  }) {
    return _repository.createProduct(
      name: name,
      brand: brand,
      category: category ?? 'Produto geral',
      servingSize: servingSize,
      servingUnit: servingUnit,
      calories: draft.calories,
      protein: draft.protein,
      carbohydrates: draft.carbohydrates,
      sugars: draft.sugars,
      totalFat: draft.totalFat,
      saturatedFat: draft.saturatedFat,
      transFat: draft.transFat,
      fiber: draft.fiber,
      sodium: draft.sodium,
      salt: draft.salt,
    );
  }
}
