import '../../../data/local/database/app_database.dart';

class NutritionTotals {
  const NutritionTotals({
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

  NutritionTotals operator +(NutritionTotals other) {
    return NutritionTotals(
      calories: calories + other.calories,
      protein: protein + other.protein,
      carbohydrates: carbohydrates + other.carbohydrates,
      sugars: sugars + other.sugars,
      totalFat: totalFat + other.totalFat,
      saturatedFat: saturatedFat + other.saturatedFat,
      transFat: transFat + other.transFat,
      fiber: fiber + other.fiber,
      sodium: sodium + other.sodium,
      salt: salt + other.salt,
    );
  }

  static const zero = NutritionTotals(
    calories: 0,
    protein: 0,
    carbohydrates: 0,
    sugars: 0,
    totalFat: 0,
    saturatedFat: 0,
    transFat: 0,
    fiber: 0,
    sodium: 0,
    salt: 0,
  );
}

class NutritionCalculator {
  const NutritionCalculator();

  NutritionTotals fromConsumptionRecord(ConsumptionRecord record) {
    return NutritionTotals(
      calories: record.calories,
      protein: record.protein,
      carbohydrates: record.carbohydrates,
      sugars: record.sugars,
      totalFat: record.totalFat,
      saturatedFat: record.saturatedFat,
      transFat: record.transFat,
      fiber: record.fiber,
      sodium: record.sodium,
      salt: record.salt,
    );
  }

  NutritionTotals totalsForRecords(List<ConsumptionRecord> records) {
    return records.fold(
      NutritionTotals.zero,
      (total, record) => total + fromConsumptionRecord(record),
    );
  }

  NutritionTotals scaledFromProduct(Product product, double factor) {
    return NutritionTotals(
      calories: product.calories * factor,
      protein: product.protein * factor,
      carbohydrates: product.carbohydrates * factor,
      sugars: product.sugars * factor,
      totalFat: product.totalFat * factor,
      saturatedFat: product.saturatedFat * factor,
      transFat: product.transFat * factor,
      fiber: product.fiber * factor,
      sodium: product.sodium * factor,
      salt: product.salt * factor,
    );
  }
}
