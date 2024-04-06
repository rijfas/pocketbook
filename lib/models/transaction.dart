import 'package:isar/isar.dart';

part 'transaction.g.dart';

@collection
class Transaction {
  Id id = Isar.autoIncrement;

  late String category;

  late String name;

  late double amount;

  DateTime createdAt = DateTime.now();

  String get categoryEmoji => category.split(' ')[0];

  String get categoryName => category.substring(2);
}
