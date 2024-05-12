import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller.dart';

class AnalyticsModeButton extends StatelessWidget {
  const AnalyticsModeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mode = context.select<AnalyticsPageController, AnalyticsMode>(
      (controller) => controller.mode,
    );

    return SizedBox(
      width: double.infinity,
      child: SegmentedButton(
        showSelectedIcon: false,
        onSelectionChanged: (selection) =>
            context.read<AnalyticsPageController>().changeMode(
                  selection.firstOrNull!,
                ),
        segments: const [
          ButtonSegment(
            value: AnalyticsMode.today,
            label: Text('Today'),
          ),
          ButtonSegment(
            value: AnalyticsMode.week,
            label: Text('This Week'),
          ),
          ButtonSegment(
            value: AnalyticsMode.month,
            label: Text('This Month'),
          ),
          ButtonSegment(
            value: AnalyticsMode.all,
            label: Text('All'),
          ),
        ],
        selected: {
          mode,
        },
      ),
    );
  }
}
