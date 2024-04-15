import 'package:flutter/material.dart';
import 'package:pocketbook/presentation/widgets/create_category_dialog.dart';
import 'package:pocketbook/presentation/widgets/empty_widget.dart';
import '../../../models/category.dart';
import 'widgets/category_tile.dart';
import 'controller.dart';
import 'package:provider/provider.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = context.select<CategoriesController, List<Category>>(
      (controller) => controller.categorys,
    );

    final isLoading = context.select<CategoriesController, bool>(
        (controller) => controller.isLoading);

    final isEmpty = context
        .select<CategoriesController, bool>((controller) => controller.isEmpty);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: (isLoading)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : (isEmpty)
              ? const Center(
                  child: EmptyWidget(message: 'No custom categories found'),
                )
              : ListView.builder(
                  itemBuilder: (context, index) => CategoryTile(
                    category: categories[index],
                  ),
                  itemCount: categories.length,
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (_) => const CreateCategoryDialog(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
