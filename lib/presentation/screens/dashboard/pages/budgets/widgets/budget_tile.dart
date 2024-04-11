import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pocketbook/models/budget.dart';
import 'package:pocketbook/utils/routes.dart';

class BudgetTile extends StatelessWidget {
  const BudgetTile({
    super.key,
    required this.budget,
  });

  final Budget budget;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context).pushNamed(
        Routes.viewBudget,
        arguments: budget,
      ),
      leading: const CircleAvatar(
        child: Icon(Icons.business_center_rounded),
      ),
      title: Text(
        DateFormat.yMMMM().format(budget.startDate),
      ),
      subtitle: Text(
        NumberFormat.simpleCurrency(locale: 'en_IN').format(budget.amount),
      ),
      trailing: Text('30%'),
    );
  }
}
