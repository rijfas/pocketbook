import 'package:isar/isar.dart';
import 'dart:async';

import '../models/budget.dart';

class BudgetService {
  final Isar _isar;

  BudgetService(this._isar);

  StreamSubscription<void> listen(void Function(void)? onData) {
    return _isar.budgets.watchLazy().listen(onData);
  }

  Future<List<Budget>> allBudgets() async {
    final budgets = await _isar.budgets.where().findAll();
    return budgets;
  }

  Future<void> putBudget(Budget budget) async {
    await _isar.writeTxn(() async {
      await _isar.budgets.put(budget);
    });
  }

  Future<void> deleteBudget(Budget budget) async {
    await _isar.writeTxn(() async {
      await _isar.budgets.delete(budget.id);
    });
  }
}
