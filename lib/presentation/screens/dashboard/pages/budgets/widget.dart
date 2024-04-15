import 'package:flutter/material.dart';
import 'package:pocketbook/presentation/widgets/empty_widget.dart';
import 'package:provider/provider.dart';
import '../../../../../models/budget.dart';
import 'controller.dart';

import 'widgets/budget_card.dart';

class BudgetsPageWidget extends StatelessWidget {
  const BudgetsPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final budgets = context.select<BudgetsPageController, List<Budget>>(
        (controller) => controller.budgets);

    final isLoading = context.select<BudgetsPageController, bool>(
        (controller) => controller.isLoading);

    final isEmpty = context.select<BudgetsPageController, bool>(
        (controller) => controller.isEmpty);

    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (isEmpty) {
      return const Center(
        child: EmptyWidget(message: 'No budgets found'),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
          crossAxisCount: 2,
          children: budgets
              .map(
                (budget) => BudgetCard(
                  budget: budget,
                ),
              )
              .toList()),
    );
  }
}
