import 'package:flutter/material.dart';
import 'package:pocketbook/models/category.dart';
import 'package:pocketbook/services/category_service.dart';
import 'dart:async';
import 'dart:collection';

class CategoriesController extends ChangeNotifier {
  CategoriesController(this._service) {
    _subscription = _service.listen((_) async {
      await load();
    });
  }

  final CategoryService _service;
  late final StreamSubscription _subscription;

  List<Category> _categorys = [];

  List<Category> get categorys => UnmodifiableListView(_categorys);

  Future<void> load() async {
    _categorys = await _service.customCategories();
    notifyListeners();
  }

  Future<void> deleteCategory(Category category) async {
    await _service.deleteCategory(category);
  }

  @override
  void dispose() async {
    await _subscription.cancel();
    super.dispose();
  }
}
