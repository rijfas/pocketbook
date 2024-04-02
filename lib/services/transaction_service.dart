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

  Future<List<Transaction>> recentTransaction({int limit = 5}) async {
    final transactions = await _isar.transactions
        .where()
        .sortByCreatedAt()
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

  Future<double> totalExpense() async {
    final expense = await _isar.transactions.where().amountProperty().sum();
    return expense;
  }
}
