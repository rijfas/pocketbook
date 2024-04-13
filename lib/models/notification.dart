import 'package:isar/isar.dart';

part 'notification.g.dart';

@collection
class Notification {
  Id id = Isar.autoIncrement;

  late double amount;

  late String category;

  DateTime createdAt = DateTime.now();
}
