import 'package:flutter/material.dart';
import 'package:pocketbook/services/transaction_service.dart';

class AnalyticsPageController extends ChangeNotifier {
  final TransactionService _transactionService;

  AnalyticsPageController(this._transactionService);

  bool _isLoading = true;

  Map<String, double> _chartData = {};

  AnalyticsMode _mode = AnalyticsMode.today;

  double _totalExpense = 0.0;

  bool get isLoading => _isLoading;

  Map<String, double> get chartData => _chartData;

  AnalyticsMode get mode => _mode;

  double get totalExpense => _totalExpense;

  Future<void> load() async {
    _isLoading = true;

    notifyListeners();

    final today = DateTime.now();

    final duration = (_mode == AnalyticsMode.today)
        ? Duration(hours: today.hour)
        : (_mode == AnalyticsMode.week)
            ? Duration(days: today.weekday)
            : (_mode == AnalyticsMode.month)
                ? Duration(days: today.day)
                : null;

    _chartData = await _transactionService.transactionsAmountByCategory(
      duration: duration,
    );

    _totalExpense = await _transactionService.totalExpenseForDuration(
      duration: duration,
    );

    _isLoading = false;

    notifyListeners();
  }

  void changeMode(AnalyticsMode mode) async {
    _mode = mode;
    notifyListeners();
    await load();
  }
}

enum AnalyticsMode { today, week, month, all }
