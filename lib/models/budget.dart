import 'package:isar/isar.dart';

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
}

@embedded
class CategoryWiseAmount {
  late String category;

  late double amount;
}
