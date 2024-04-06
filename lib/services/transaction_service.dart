import 'dart:async';

import 'package:isar/isar.dart';

import '../models/transaction.dart';

class TransactionService {
  late final Isar _isar;

  TransactionService(this._isar);

  StreamSubscription<void> listen(void Function(void)? onData) {
    return _isar.transactions.watchLazy().listen(onData);
  }

  Future<List<Transaction>> allTransactions() async {
    final transactions = await _isar.transactions.where().findAll();
    return transactions;
  }

  Future<Map<String, double>> transactionsAmountByCategory({
    Duration duration = const Duration(days: 7),
  }) async {
    final DateTime now = DateTime.now();

    final DateTime dateStart = now.subtract(duration);

    final transactions = await _isar.transactions
        .where()
        .filter()
        .createdAtGreaterThan(dateStart)
        .findAll();

    Map<String, double> transactionsMap = {};

    for (final transaction in transactions) {
      if (transactionsMap.containsKey(transaction.category)) {
        transactionsMap[transaction.category] =
            transactionsMap[transaction.category]! + transaction.amount;
      } else {
        transactionsMap[transaction.category] = transaction.amount;
      }
    }

    return transactionsMap;
  }

  Future<List<Transaction>> recentTransactions({int limit = 5}) async {
    final transactions = await _isar.transactions
        .where()
        .sortByCreatedAtDesc()
        .limit(limit)
        .findAll();
    return transactions;
  }

  Future<void> addTranasction(Transaction transaction) async {
    await _isar.writeTxn(() async {
      await _isar.transactions.put(transaction);
    });
  }

  Future<void> removeTransaction(Transaction transaction) async {
    await _isar.writeTxn(() async {
      await _isar.transactions.delete(transaction.id);
    });
  }

  Future<double> totalExpenseForDuration({
    Duration duration = const Duration(hours: 23),
  }) async {
    final DateTime dateStart = DateTime.now().subtract(
      duration,
    );

    final expense = await _isar.transactions
        .where()
        .filter()
        .createdAtGreaterThan(dateStart)
        .amountProperty()
        .sum();
    return expense;
  }

  Future<double> currentMonthAverageExpense() async {
    final DateTime dateStart = DateTime.now().subtract(
      const Duration(days: 30),
    );

    final expense = await _isar.transactions
        .where()
        .filter()
        .createdAtGreaterThan(dateStart)
        .amountProperty()
        .average();

    return expense;
  }
}
