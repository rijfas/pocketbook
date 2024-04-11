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
    Duration? duration,
  }) async {
    final DateTime now = DateTime.now();

    final DateTime? dateStart =
        (duration != null) ? now.subtract(duration) : null;

    final transactions = (dateStart != null)
        ? await _isar.transactions
            .where()
            .filter()
            .createdAtGreaterThan(dateStart)
            .findAll()
        : await _isar.transactions.where().findAll();

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

  Future<double> totalExpenseBetween({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final expense = await _isar.transactions
        .where()
        .filter()
        .createdAtBetween(startDate, endDate)
        .amountProperty()
        .sum();
    return expense;
  }

  Future<Map<String, double>> categoryWiseSpentBetween({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final transactions = await _isar.transactions
        .where()
        .filter()
        .createdAtBetween(startDate, endDate)
        .findAll();

    Map<String, double> categoryWiseSpentMap = {};

    for (final transaction in transactions) {
      if (categoryWiseSpentMap.containsKey(transaction.category)) {
        categoryWiseSpentMap[transaction.category] =
            categoryWiseSpentMap[transaction.category]! + transaction.amount;
      } else {
        categoryWiseSpentMap[transaction.category] = transaction.amount;
      }
    }

    return categoryWiseSpentMap;
  }

  Future<double> totalExpenseForDuration({
    Duration? duration,
  }) async {
    final DateTime now = DateTime.now();
    final DateTime? dateStart =
        (duration != null) ? now.subtract(duration) : null;

    final expense = (dateStart != null)
        ? await _isar.transactions
            .where()
            .filter()
            .createdAtGreaterThan(dateStart)
            .amountProperty()
            .sum()
        : await _isar.transactions.where().amountProperty().sum();

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
