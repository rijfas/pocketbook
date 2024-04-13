import 'dart:async';

import 'package:isar/isar.dart';
import 'package:pocketbook/utils/constants.dart';
import '../models/category.dart';

class CategoryService {
  final Isar _isar;

  CategoryService(this._isar);

  StreamSubscription<void> listen(void Function(void)? onData) {
    return _isar.categorys.watchLazy().listen(onData);
  }

  Future<List<Category>> allCategories() async {
    final categories = await _isar.categorys.where().findAll();
    return categories;
  }

  Future<void> createDefaultCategories() async {
    await _isar.writeTxn(() async {
      await _isar.categorys.putAll(
        Constants.generateDefaultCategories(),
      );
    });
  }

  Future<void> putCategory(Category category) async {
    await _isar.writeTxn(() async {
      await _isar.categorys.put(category);
    });
  }

  Future<void> deleteCategory(Category category) async {
    await _isar.writeTxn(() async {
      await _isar.categorys.delete(category.id);
    });
  }
}
