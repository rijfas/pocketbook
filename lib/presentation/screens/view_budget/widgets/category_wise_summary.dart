import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pocketbook/models/budget.dart';
import 'package:pocketbook/presentation/screens/view_budget/controller.dart';
import 'package:pocketbook/utils/formatters.dart';
import 'package:provider/provider.dart';

class CategoryWiseSummary extends StatelessWidget {
  const CategoryWiseSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<CategoryWiseAmount> budgetCategoryWiseAmount =
        context.select<ViewBudgetController, List<CategoryWiseAmount>>(
            (controller) => controller.budgetCategoryWiseAmount);

    final Map<String, double> spentCategoryWiseAmount =
        context.select<ViewBudgetController, Map<String, double>>(
            (controller) => controller.spentCategoryWiseAmount);

    return Expanded(
      child: ListView.builder(
        itemCount: budgetCategoryWiseAmount.length,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            child: Text(budgetCategoryWiseAmount[index].category.split(' ')[0]),
          ),
          title: Text(
            toBeginningOfSentenceCase(
              budgetCategoryWiseAmount[index].category.substring(2).trim(),
            ),
          ),
          trailing: Text(
            '${Formatters.formatCurrency(
              (spentCategoryWiseAmount
                      .containsKey(budgetCategoryWiseAmount[index].category))
                  ? spentCategoryWiseAmount[
                      budgetCategoryWiseAmount[index].category]
                  : 0.0,
            )} | ${Formatters.formatCurrency(budgetCategoryWiseAmount[index].amount)}',
          ),
        ),
      ),
    );
  }
}
