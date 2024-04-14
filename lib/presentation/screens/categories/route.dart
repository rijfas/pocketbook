import 'package:flutter/material.dart';
import 'package:pocketbook/services/category_service.dart';
import 'controller.dart';
import 'package:provider/provider.dart';

import 'view.dart';

class Categories extends MaterialPageRoute {
  Categories({Key? key})
      : super(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => CategoriesController(
              context.read<CategoryService>(),
            )..load(),
            child: const CategoriesView(),
          ),
        );
}
