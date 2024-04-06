import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pocketbook/presentation/screens/dashboard/pages/analytics/controller.dart';
import 'package:pocketbook/utils/constants.dart';
import 'package:provider/provider.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    final chartData =
        context.select<AnalyticsPageController, Map<String, double>>(
      (controller) => controller.chartData,
    );

    return ListView(
      children: chartData.entries.map(
        (e) {
          final index = chartData.keys.toList().indexOf(e.key);
          return ListTile(
            leading: CircleAvatar(
              backgroundColor:
                  Constants.paleColors[index % Constants.paleColors.length],
              child: Text(e.key.split(' ').first),
            ),
            title: Text(
              toBeginningOfSentenceCase(e.key.substring(2).trim()),
            ),
            trailing: Text(
              '₹ ${e.value.toString()}',
              style: TextStyle(fontSize: 16),
            ),
          );
        },
      ).toList(),
    );
  }
}
