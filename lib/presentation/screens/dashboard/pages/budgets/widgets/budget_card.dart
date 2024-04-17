import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pocketbook/models/budget.dart';
import 'package:pocketbook/utils/formatters.dart';
import 'package:pocketbook/utils/routes.dart';

class BudgetCard extends StatefulWidget {
  const BudgetCard({
    super.key,
    required this.budget,
  });

  final Budget budget;

  @override
  State<BudgetCard> createState() => _BudgetCardState();
}

class _BudgetCardState extends State<BudgetCard> {
  double _spentAmount = 0.0;

  @override
  void initState() {
    super.initState();
    widget.budget.spentAmount().then((value) {
      setState(() {
        _spentAmount = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 96,
                  width: 96,
                  child: CircularProgressIndicator(
                    value: _spentAmount / widget.budget.amount,
                    backgroundColor: Colors.grey[400],
                    strokeWidth: 6,
                  ),
                ),
                Text(
                  '${NumberFormat.compact().format(
                    _spentAmount * 100 / widget.budget.amount,
                  )}%',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ],
              alignment: Alignment.center,
            ),
            const SizedBox(height: 16),
            Text(
              '${Formatters.dateWithYearMonth(widget.budget.startDate)} - ${Formatters.dateWithYearMonth(widget.budget.endDate)}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${Formatters.formatCurrency(_spentAmount)} / ${Formatters.formatCurrency(widget.budget.amount)}',
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
                    arguments: widget.budget,
                  ),
                  child: const Text('View'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
