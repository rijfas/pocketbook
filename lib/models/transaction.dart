import 'package:isar/isar.dart';

import 'category.dart';

part 'transaction.g.dart';

@collection
class Transaction {
  Id id = Isar.autoIncrement;

  IsarLink<Category> category = IsarLink<Category>();

  late String name;

  late double amount;

  late DateTime createdAt;
}
