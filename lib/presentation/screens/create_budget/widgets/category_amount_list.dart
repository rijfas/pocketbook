import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pocketbook/models/category.dart';
import 'package:pocketbook/presentation/screens/create_budget/controller.dart';
import 'package:provider/provider.dart';

class CategoryAmountList extends StatelessWidget {
  const CategoryAmountList({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryWiseAmount = context
        .select<CreateBudgetController, Map<Category, double>>(
          (controller) => controller.categoryWiseAmount,
        )
        .entries;
    return ListView(
      children: categoryWiseAmount
          .map((e) => ListTile(
                leading: CircleAvatar(
                  child: Text(e.key.emoji),
                ),
                title: Text(toBeginningOfSentenceCase(e.key.name)),
                trailing: SizedBox(
                  width: 100,
                  child: TextField(
                    textAlign: TextAlign.end,
                    controller: TextEditingController(
                      text: e.value.toString(),
                    ),
                    onChanged: (value) => context
                        .read<CreateBudgetController>()
                        .setCategoryAmount(e.key, double.parse(value)),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.currency_rupee,
                      ),
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
