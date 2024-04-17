import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pocketbook/utils/constants.dart';
import 'package:pocketbook/utils/formatters.dart';
import 'package:provider/provider.dart';

import '../controller.dart';

class AnalyticsChart extends StatelessWidget {
  const AnalyticsChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final chartData =
        context.select<AnalyticsPageController, Map<String, double>>(
      (controller) => controller.chartData,
    );

    final totalExpense = context.select<AnalyticsPageController, double>(
      (controller) => controller.totalExpense,
    );

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            child: PieChart(
              PieChartData(
                sections: chartData.entries.map(
                  (e) {
                    final index = chartData.keys.toList().indexOf(e.key);
                    return PieChartSectionData(
                      color: Constants
                          .paleColors[index % Constants.paleColors.length],
                      value: e.value,
                      showTitle: false,
                      badgePositionPercentageOffset: 1,
                      badgeWidget: CircleAvatar(
                        child: Text(e.key.split(' ').first),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
          Center(
            child: Text(
              Formatters.formatCurrency(
                totalExpense,
              ),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
