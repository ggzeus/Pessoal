import '../../../core/utils/date_utils.dart';
import '../../../data/local/database/app_database.dart';
import '../../../data/repositories/personal_repository.dart';
import 'nutrition_calculator.dart';

class DailyConsumptionSummary {
  const DailyConsumptionSummary({
    required this.waterMl,
    required this.records,
    required this.totals,
  });

  final int waterMl;
  final List<ConsumptionRecord> records;
  final NutritionTotals totals;
}

class ConsumptionService {
  ConsumptionService(this._repository, this._calculator);

  final PersonalRepository _repository;
  final NutritionCalculator _calculator;

  Future<ConsumptionRecord> registerWater(int amountMl) {
    return _repository.addWaterConsumption(amountMl);
  }

  Future<ConsumptionRecord> registerFood({
    required String name,
    required double quantity,
    required String unit,
    double calories = 0,
    double protein = 0,
    double carbohydrates = 0,
    double sugars = 0,
    double totalFat = 0,
    double saturatedFat = 0,
    double transFat = 0,
    double fiber = 0,
    double sodium = 0,
    double salt = 0,
  }) async {
    await _repository.addFoodLog(
      name: name,
      calories: calories,
      quantity: quantity,
      protein: protein,
      sugar: sugars,
      salt: salt,
      fat: totalFat,
      carbs: carbohydrates,
    );
    return _repository.addConsumptionRecord(
      type: 'food',
      name: name,
      quantity: quantity,
      unit: unit,
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

  Future<ConsumptionRecord> registerDrink({
    required String name,
    required double quantity,
    required String unit,
    double calories = 0,
    double protein = 0,
    double carbohydrates = 0,
    double sugars = 0,
    double totalFat = 0,
    double saturatedFat = 0,
    double transFat = 0,
    double fiber = 0,
    double sodium = 0,
    double salt = 0,
  }) {
    return _repository.addConsumptionRecord(
      type: 'drink',
      name: name,
      quantity: quantity,
      unit: unit,
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

  Future<ConsumptionRecord> registerProductConsumption({
    required Product product,
    required double quantity,
    required String unit,
  }) {
    final factor = _portionFactor(product, quantity, unit);
    final totals = _calculator.scaledFromProduct(product, factor);
    return _repository.addConsumptionRecord(
      type: 'product',
      name: product.name,
      productId: product.id,
      quantity: quantity,
      unit: unit,
      calories: totals.calories,
      protein: totals.protein,
      carbohydrates: totals.carbohydrates,
      sugars: totals.sugars,
      totalFat: totals.totalFat,
      saturatedFat: totals.saturatedFat,
      transFat: totals.transFat,
      fiber: totals.fiber,
      sodium: totals.sodium,
      salt: totals.salt,
    );
  }

  Future<DailyConsumptionSummary> loadSummaryForDate(DateTime date) async {
    final safeDate = AppDateUtils.startOfDay(date);
    final waterLogs = await _repository.loadWaterLogsForDate(safeDate);
    final records = await _repository.loadConsumptionRecordsForDate(safeDate);
    final totals = _calculator.totalsForRecords(
      records.where((record) => record.type != 'water').toList(),
    );

    return DailyConsumptionSummary(
      waterMl: waterLogs.fold<int>(0, (total, item) => total + item.amountMl),
      records: records,
      totals: totals,
    );
  }

  double _portionFactor(Product product, double quantity, String unit) {
    final normalizedUnit = unit.toLowerCase();
    final servingUnit = product.servingUnit.toLowerCase();

    if (normalizedUnit == servingUnit && product.servingSize > 0) {
      return quantity / product.servingSize;
    }
    if (normalizedUnit.contains('porcao') ||
        normalizedUnit.contains('porção')) {
      return quantity;
    }
    if (normalizedUnit.contains('scoop')) {
      return quantity;
    }
    return quantity;
  }
}
