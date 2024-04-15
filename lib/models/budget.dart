import 'package:isar/isar.dart';
import 'package:pocketbook/models/transaction.dart';

part 'budget.g.dart';

@collection
class Budget {
  Id id = Isar.autoIncrement;

  late double amount;

  late DateTime startDate;

  late DateTime endDate;

  late List<CategoryWiseAmount> categoryWiseAmount;

  @ignore
  Map<String, double> get categoryWiseAmountAsMap => {
        for (final element in categoryWiseAmount)
          element.category: element.amount
      };

  Future<double> spentAmount() async {
    final isar = Isar.getInstance()!;
    final expense = await isar.transactions
        .where()
        .filter()
        .createdAtBetween(startDate, endDate)
        .amountProperty()
        .sum();
    return expense;
  }
}

@embedded
class CategoryWiseAmount {
  late String category;

  late double amount;
}
