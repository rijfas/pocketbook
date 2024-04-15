import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import '../../../../../models/transaction.dart';
import '../../../../../services/transaction_service.dart';

class HomePageController extends ChangeNotifier {
  HomePageController(this._transactionService) {
    _transactionSubscription = _transactionService.listen((_) async {
      load();
    });
  }

  final TransactionService _transactionService;

  bool _isLoading = true;
  double _currentDayExpense = 0.0;
  double _currentMonthExpense = 0.0;
  double _monthlyAverage = 0.0;

  List<Transaction> _recentTransactions = [];
  late StreamSubscription _transactionSubscription;

  bool get isLoading => _isLoading;
  bool get isEmpty => _recentTransactions.isEmpty;
  double get currentDayExpense => _currentDayExpense;
  double get currentMonthExpense => _currentMonthExpense;
  double get monthlyAverage => _monthlyAverage;
  List<Transaction> get recentTransactions =>
      UnmodifiableListView(_recentTransactions);

  Future<void> load() async {
    _currentDayExpense = await _transactionService.totalExpenseForDuration(
      duration: Duration(
        hours: DateTime.now().hour,
      ),
    );

    _currentMonthExpense = await _transactionService.totalExpenseForDuration(
      duration: Duration(
        days: DateTime.now().day,
      ),
    );
    _monthlyAverage = await _transactionService.currentMonthAverageExpense();
    _recentTransactions = await _transactionService.recentTransactions();
    _isLoading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _transactionSubscription.cancel();
    super.dispose();
  }
}
