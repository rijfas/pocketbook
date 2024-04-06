import 'package:flutter/material.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  @override
  Widget build(BuildContext context) {
    // final List<double> chartData =
    //     context.select<DashboardController, List<double>>(
    //   (controller) => controller.chartData,
    // );
    return Text('trans');
    // return Padding(
    //   padding: const EdgeInsets.all(16.0),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.stretch,
    //     children: [
    //       SegmentedButton(
    //         showSelectedIcon: false,
    //         onSelectionChanged: (p0) => {},
    //         segments: [
    //           ButtonSegment(
    //             value: 'weekly',
    //             label: Text('This Week'),
    //           ),
    //           ButtonSegment(
    //             value: 'monthly',
    //             label: Text('This Month'),
    //           ),
    //           ButtonSegment(
    //             value: 'yearly',
    //             label: Text('All Time'),
    //           ),
    //         ],
    //         selected: {'weekly'},
    //       ),
    //       SizedBox(height: 36),
    //       SizedBox(
    //         width: MediaQuery.of(context).size.width,
    //         height: 200,
    //         child: BarChart(
    //           BarChartData(
    //             titlesData: FlTitlesData(
    //               bottomTitles: AxisTitles(
    //                 sideTitles: SideTitles(
    //                     showTitles: true,
    //                     getTitlesWidget: (value, meta) => Text(
    //                         value.toString() +
    //       )),
    //               ),
    //               rightTitles: AxisTitles(axisNameSize: 0),
    //               topTitles: AxisTitles(axisNameSize: 0),
    //             ),
    //             borderData: FlBorderData(show: false),
    //             gridData: FlGridData(show: false),
    //             barTouchData: BarTouchData(
    //                 touchTooltipData: BarTouchTooltipData(
    //               tooltipMargin: 30,
    //               tooltipRoundedRadius: 16,
    //               tooltipBgColor: Colors.blue,
    //               direction: TooltipDirection.bottom,
    //             )),
    //             barGroups: chartData.asMap().entries
    //                 .map((data) => BarChartGroupData(
    //                       barRods: [
    //                         BarChartRodData(
    //                             toY: data, width: 16, color: Colors.blue[300])
    //                       ],
    //                       x: 1,
    //                     ))
    //                 .toList(),
    //           ),
    //         ),
    //       ),
    //       SizedBox(height: 24),
    //       Text(
    //         'Categories',
    //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    //       ),
    //       Divider(),
    //     ],
    //   ),
    // );
  }
}
