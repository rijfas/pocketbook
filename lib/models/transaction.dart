import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:pocketbook/utils/formatters.dart';

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

  @override
  String toString() {
    return '$category : ${Formatters.formatCurrency(amount)} on $createdAt';
  }
}
