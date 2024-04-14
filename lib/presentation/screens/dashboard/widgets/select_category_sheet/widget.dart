import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../models/category.dart';
import '../../../../widgets/create_category_dialog.dart';
import 'controller.dart';

class SelectCategorySheetWidget extends StatelessWidget {
  const SelectCategorySheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final categories =
        context.select<SelectCategorySheetController, List<Category>>(
      (controller) => controller.filteredCategories,
    );

    return SingleChildScrollView(
      padding: MediaQuery.of(context).viewInsets,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Choose Category',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const Divider(),
            const SizedBox(height: 8),
            TextField(
              autofocus: true,
              onChanged: (query) async {
                await context
                    .read<SelectCategorySheetController>()
                    .searchCategories(query);
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                labelText: 'Search Category',
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8.0,
              children: [
                ...categories.map((category) {
                  return ActionChip(
                    label: Text(category.toString()),
                    onPressed: () {
                      Navigator.of(context).pop(category);
                    },
                  );
                }).toList(),
                ActionChip(
                  label: const Text('+ New'),
                  onPressed: () {
                    showDialog<Category>(
                      context: context,
                      builder: (_) => const CreateCategoryDialog(),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
