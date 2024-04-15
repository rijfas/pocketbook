import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:collection';

import '../../../models/transaction.dart';
import '../../../services/transaction_service.dart';

class TransactionsController extends ChangeNotifier {
  TransactionsController(this._service) {
    _subscription = _service.listen((_) async {
      await load();
    });
  }

  final TransactionService _service;
  late final StreamSubscription _subscription;

  List<Transaction> _transactions = [];

  List<Transaction> get transactions => UnmodifiableListView(_transactions);

  bool _isLoading = true;

  bool get isLoading => _isLoading;

  bool get isEmpty => _transactions.isEmpty;

  Future<void> load() async {
    _transactions = await _service.allTransactions();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> deleteTransaction(Transaction transaction) async {
    await _service.removeTransaction(transaction);
  }

  @override
  void dispose() async {
    await _subscription.cancel();
    super.dispose();
  }
}
