import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:pocketbook/presentation/screens/dashboard/pages/home/controller.dart';
import 'package:provider/provider.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currentDayExpense = context.select<HomePageController, double>(
      (controller) => controller.currentDayExpense,
    );

    final currentMonthExpense = context.select<HomePageController, double>(
      (controller) => controller.currentMonthExpense,
    );

    final monthlyAverage = context.select<HomePageController, double>(
      (controller) => controller.monthlyAverage,
    );

    return Card(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Today\'s Expense',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                AnimatedFlipCounter(
                  infix: '₹',
                  value: currentDayExpense,
                  curve: Curves.easeIn,
                  fractionDigits: 2,
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 4),
                (currentDayExpense > monthlyAverage)
                    ? Icon(
                        Icons.arrow_upward_rounded,
                        color: Colors.red,
                        size: 36,
                      )
                    : Icon(
                        Icons.arrow_downward_rounded,
                        color: Colors.green,
                        size: 36,
                      ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Current Month Expense',
                  style: TextStyle(color: Colors.grey[100]),
                ),
                AnimatedFlipCounter(
                  infix: '₹',
                  value: currentMonthExpense,
                  curve: Curves.easeIn,
                  fractionDigits: 2,
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Daily Average',
                  style: TextStyle(color: Colors.grey[100]),
                ),
                AnimatedFlipCounter(
                  infix: '₹',
                  value: monthlyAverage,
                  curve: Curves.easeIn,
                  fractionDigits: 2,
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
