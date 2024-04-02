import 'package:isar/isar.dart';

part 'category.g.dart';

@collection
class Category {
  Id id = Isar.autoIncrement;

  late String emoji;

  late String name;

  @override
  String toString() {
    return '$emoji $name';
  }
}
