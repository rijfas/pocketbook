import 'package:isar/isar.dart';

part 'category.g.dart';

@collection
class Category {
  Id id = Isar.autoIncrement;

  late String emoji;

  late String name;

  bool isDefault = false;

  @override
  String toString() {
    return '$emoji $name';
  }
}
