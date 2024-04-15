import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import '../../../../../models/budget.dart';
import '../../../../../services/budget_service.dart';

class BudgetsPageController extends ChangeNotifier {
  final BudgetService _budgetService;

  BudgetsPageController(this._budgetService) {
    _budgetSubscription = _budgetService.listen((_) async {
      await load();
    });
  }

  late StreamSubscription _budgetSubscription;

  List<Budget> _budgets = [];

  List<Budget> get budgets => UnmodifiableListView(_budgets);

  bool _isLoading = true;

  bool get isLoading => _isLoading;

  bool get isEmpty => _budgets.isEmpty;

  Future<void> load() async {
    _isLoading = true;
    notifyListeners();
    _budgets = await _budgetService.allBudgets();
    _isLoading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _budgetSubscription.cancel();
    super.dispose();
  }
}
