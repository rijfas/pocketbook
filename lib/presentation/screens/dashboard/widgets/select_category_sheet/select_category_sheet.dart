import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller.dart';
import 'widget.dart';
import '../../../../../services/category_service.dart';

class SelectCategorySheet extends StatelessWidget {
  const SelectCategorySheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SelectCategorySheetController(
        context.read<CategoryService>(),
      )..loadCategories(),
      child: const SelectCategorySheetWidget(),
    );
  }
}
