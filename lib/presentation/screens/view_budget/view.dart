import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pocketbook/models/budget.dart';
import 'package:pocketbook/presentation/screens/view_budget/controller.dart';
import 'package:pocketbook/services/budget_service.dart';
import 'package:pocketbook/services/transaction_service.dart';
import 'package:provider/provider.dart';

import 'widgets/budget_summary_row.dart';
import 'widgets/category_wise_summary.dart';
import 'widgets/percentage_summary.dart';

class ViewBudgetView extends StatelessWidget {
  const ViewBudgetView({
    super.key,
    required this.budget,
  });

  final Budget budget;
  @override
  Widget build(BuildContext context) {
    final isLoading = context.select<ViewBudgetController, bool>(
        (controller) => controller.isLoading);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Budget of ${DateFormat.yMMMM().format(budget.startDate)}',
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('Delete'),
                value: 'delete',
              )
            ],
            onSelected: (value) {
              switch (value) {
                case 'delete':
                  showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Delete Budget'),
                      content:
                          Text('Delete the budget?, this cannot be undone'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: Text('cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: Text('delete'),
                        )
                      ],
                    ),
                  ).then(
                    (confirmDelete) {
                      if (confirmDelete ?? false) {
                        context
                            .read<BudgetService>()
                            .deleteBudget(budget)
                            .then(Navigator.of(context).pop);
                      }
                    },
                  );

                  break;
                default:
              }
            },
          ),
        ],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(height: 16),
                  PercentageSummary(),
                  SizedBox(height: 24),
                  BudgetSummaryRow(),
                  SizedBox(height: 8),
                  const Row(
                    children: [
                      Text('Categories'),
                      Spacer(),
                      Text('Spent | Budget'),
                    ],
                  ),
                  const Divider(),
                  CategoryWiseSummary()
                ],
              ),
            ),
    );
  }
}
