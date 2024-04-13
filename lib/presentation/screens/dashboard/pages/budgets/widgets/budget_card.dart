import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pocketbook/models/budget.dart';
import 'package:pocketbook/utils/routes.dart';

class BudgetCard extends StatelessWidget {
  const BudgetCard({
    super.key,
    required this.budget,
  });

  final Budget budget;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.business_center,
            size: 48,
          ),
          const SizedBox(height: 8),
          const Divider(
            indent: 10,
            endIndent: 10,
          ),
          const SizedBox(height: 8),
          Text(
            DateFormat.yMMMM().format(budget.startDate),
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  NumberFormat.simpleCurrency(locale: 'en_IN')
                      .format(budget.amount),
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pushNamed(
                  Routes.viewBudget,
                  arguments: budget,
                ),
                child: const Text('View'),
              )
            ],
          )
        ],
      ),
    );
  }
}
