import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pocketbook/models/category.dart';
import 'package:pocketbook/services/category_service.dart';

class SelectCategorySheetController extends ChangeNotifier {
  SelectCategorySheetController(this._service) {
    _subscription = _service.listen((_) async {
      await loadCategories();
    });
  }

  late StreamSubscription _subscription;

  late final CategoryService _service;

  List<Category> _categories = [];

  List<Category> _filteredCategories = [];

  List<Category> get categories => UnmodifiableListView(_categories);

  List<Category> get filteredCategories =>
      UnmodifiableListView(_filteredCategories);

  Future<void> loadCategories() async {
    _categories = await _service.allCategories();
    _filteredCategories = _categories;
    notifyListeners();
  }

  Future<void> searchCategories(String query) async {
    _filteredCategories = _categories
        .where(
          (category) => category.name.toLowerCase().contains(
                query,
              ),
        )
        .toList();
    notifyListeners();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
