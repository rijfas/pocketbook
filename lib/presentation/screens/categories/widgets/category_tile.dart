import 'package:flutter/material.dart';
import 'package:pocketbook/models/category.dart';
import 'package:pocketbook/presentation/screens/categories/controller.dart';
import 'package:pocketbook/utils/show_alert_dialog.dart';
import 'package:provider/provider.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(category.emoji),
      ),
      title: Text(category.name),
      trailing: IconButton(
        onPressed: () => showAlertDialog(context,
                title: 'Delete category',
                description: 'Delete category $category ?')
            .then((confirmed) async {
          if (confirmed ?? false) {
            await context.read<CategoriesController>().deleteCategory(category);
          }
        }),
        icon: const Icon(Icons.delete),
      ),
    );
  }
}
