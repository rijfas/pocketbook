import 'package:flutter/material.dart';
import '../../../models/budget.dart';
import '../../../models/category.dart';
import '../../../services/budget_service.dart';
import '../../../services/category_service.dart';

class CreateBudgetController extends ChangeNotifier {
  CreateBudgetController(
    this._budgetService,
    this._categoryService,
  );

  final BudgetService _budgetService;
  final CategoryService _categoryService;

  Map<Category, double> _categoryWiseAmount = {};

  bool _isLoading = true;

  Map<Category, double> get categoryWiseAmount => _categoryWiseAmount;

  bool get isLoading => _isLoading;

  Future<void> load() async {
    _categoryWiseAmount = Map.fromIterable(
      (await _categoryService.allCategories()),
      value: (_) => 0.0,
    );
    _isLoading = false;
    notifyListeners();
  }

  void setCategoryAmount(Category category, double amount) {
    _categoryWiseAmount[category] = amount;
  }

  Future<void> createBudget({
    required double amount,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final categoryWiseAmount = _categoryWiseAmount.entries
        .map((e) => CategoryWiseAmount()
          ..amount = e.value
          ..category = e.key.toString())
        .toList();
    final budget = Budget()
      ..amount = amount
      ..startDate = startDate
      ..endDate = endDate
      ..categoryWiseAmount = categoryWiseAmount;
    await _budgetService.putBudget(budget);
  }
}
