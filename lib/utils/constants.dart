import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pocketbook/models/category.dart';

sealed class Constants {
  static final List<Color> paleColors = [
    Colors.cyan[300]!,
    Colors.blue[300]!,
    Colors.green[300]!,
    Colors.yellow[300]!,
    Colors.orange[300]!,
    Colors.red[300]!,
    Colors.purple[300]!,
    Colors.pink[300]!,
    Colors.teal[300]!,
    Colors.indigo[300]!,
    Colors.lime[300]!,
    Colors.amber[300]!,
    Colors.deepOrange[300]!,
    Colors.deepPurple[300]!,
    Colors.lightGreen[300]!,
    Colors.lightBlue[300]!,
    Colors.brown[300]!,
    Colors.grey[300]!,
  ];

  static List<Category> generateDefaultCategories() {
    return [
      Category()
        ..emoji = '💰'
        ..name = 'Groceries'
        ..isDefault = true,
      Category()
        ..emoji = '🍔'
        ..name = 'Dining Out'
        ..isDefault = true,
      Category()
        ..emoji = '🛒'
        ..name = 'Shopping'
        ..isDefault = true,
      Category()
        ..emoji = '🚗'
        ..name = 'Transportation'
        ..isDefault = true,
      Category()
        ..emoji = '🏠'
        ..name = 'Rent'
        ..isDefault = true,
      Category()
        ..emoji = '📱'
        ..name = 'Phone Bill'
        ..isDefault = true,
      Category()
        ..emoji = '💻'
        ..name = 'Internet Bill'
        ..isDefault = true,
      Category()
        ..emoji = '📺'
        ..name = 'TV Subscription'
        ..isDefault = true,
      Category()
        ..emoji = '📱'
        ..name = 'Mobile Recharge'
        ..isDefault = true,
      Category()
        ..emoji = '🎁'
        ..name = 'Gifts'
        ..isDefault = true,
      Category()
        ..emoji = '📚'
        ..name = 'Education'
        ..isDefault = true,
      Category()
        ..emoji = '💼'
        ..name = 'Work Expenses'
        ..isDefault = true,
      Category()
        ..emoji = '💊'
        ..name = 'Medical'
        ..isDefault = true,
      Category()
        ..emoji = '🚑'
        ..name = 'Healthcare'
        ..isDefault = true,
      Category()
        ..emoji = '🛠️'
        ..name = 'Utilities'
        ..isDefault = true,
      Category()
        ..emoji = '✈️'
        ..name = 'Travel'
        ..isDefault = true,
      Category()
        ..emoji = '🏥'
        ..name = 'Insurance'
        ..isDefault = true,
      Category()
        ..emoji = '🎉'
        ..name = 'Entertainment'
        ..isDefault = true,
      Category()
        ..emoji = '🎨'
        ..name = 'Hobbies'
        ..isDefault = true,
      Category()
        ..emoji = '💸'
        ..name = 'Savings'
        ..isDefault = true
    ];
  }

  static Color randomColor() => paleColors[Random().nextInt(paleColors.length)];
}
