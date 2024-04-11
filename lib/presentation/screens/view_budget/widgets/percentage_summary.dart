import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pocketbook/presentation/screens/view_budget/controller.dart';
import 'package:provider/provider.dart';

class PercentageSummary extends StatelessWidget {
  const PercentageSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double spentPercentage = context.select<ViewBudgetController, double>(
      (controller) => controller.spentPercentage,
    );

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 150,
          height: 150,
          child: CircularProgressIndicator(
            backgroundColor: Colors.grey[300],
            value: spentPercentage > 1.0 ? 1.0 : spentPercentage,
          ),
        ),
        Text(
          '${NumberFormat.decimalPattern().format(spentPercentage * 100)}%',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
