import 'package:flutter/material.dart';
import 'package:pocketbook/presentation/screens/dashboard/pages/analytics/widgets/categories_list.dart';

import 'widgets/analytics_chart.dart';
import 'widgets/analytics_mode_button.dart';

class AnalyticsPageWidget extends StatelessWidget {
  const AnalyticsPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        bottom: 0.0,
        right: 16.0,
        left: 16.0,
      ),
      child: Column(
        children: const [
          AnalyticsModeButton(),
          SizedBox(height: 8),
          Row(
            children: [
              const Text(
                'Analytics',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Divider(),
          SizedBox(height: 24),
          AnalyticsChart(),
          SizedBox(height: 24),
          Row(
            children: [
              const Text(
                'Categories',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Divider(),
          Expanded(child: CategoriesList())
        ],
      ),
    );
  }
}
