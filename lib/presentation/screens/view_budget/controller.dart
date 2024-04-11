import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pocketbook/models/budget.dart';
import 'package:pocketbook/services/transaction_service.dart';

class ViewBudgetController extends ChangeNotifier {
  final Budget _budget;

  final TransactionService _transactionService;

  ViewBudgetController(
    this._transactionService,
    this._budget,
  );

  double _spentPercentage = 0.0;

  double _spentAmount = 0.0;

  double _budgetAmount = 0.0;

  Map<String, double> _spentCategoryWiseAmount = {};

  List<CategoryWiseAmount> _budgetCategoryWiseAmount = [];

  bool _isLoading = true;

  double get spentPercentage => _spentPercentage;

  double get spentAmount => _spentAmount;

  double get budgetAmount => _budgetAmount;

  Map<String, double> get spentCategoryWiseAmount =>
      UnmodifiableMapView(_spentCategoryWiseAmount);

  List<CategoryWiseAmount> get budgetCategoryWiseAmount =>
      UnmodifiableListView(_budgetCategoryWiseAmount);

  bool get isLoading => _isLoading;

  Future<void> load() async {
    _spentAmount = await _transactionService.totalExpenseBetween(
      startDate: _budget.startDate,
      endDate: _budget.endDate,
    );

    _spentCategoryWiseAmount =
        await _transactionService.categoryWiseSpentBetween(
      startDate: _budget.startDate,
      endDate: _budget.endDate,
    );

    _budgetCategoryWiseAmount = _budget.categoryWiseAmount;

    _budgetAmount = _budget.amount;

    _spentPercentage = _spentAmount / _budgetAmount;

    _isLoading = false;

    notifyListeners();
  }
}
