import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pocketbook/presentation/screens/view_budget/controller.dart';
import 'package:provider/provider.dart';

class BudgetSummaryRow extends StatelessWidget {
  const BudgetSummaryRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final totalSpent = context.select<ViewBudgetController, double>(
      (controller) => controller.spentAmount,
    );

    final totalBudget = context.select<ViewBudgetController, double>(
      (controller) => controller.budgetAmount,
    );

    return Row(children: [
      Expanded(
        child: Column(
          children: [
            const Text('Total Spent'),
            Text(
              NumberFormat.simpleCurrency(locale: 'en_IN').format(totalSpent),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
      const SizedBox(
        height: 52,
        child: VerticalDivider(
          thickness: 2,
        ),
      ),
      Expanded(
        child: Column(
          children: [
            const Text('Total Budget'),
            Text(
              NumberFormat.simpleCurrency(locale: 'en_IN').format(totalBudget),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    ]);
  }
}