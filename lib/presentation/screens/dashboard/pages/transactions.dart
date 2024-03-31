import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SegmentedButton(
            showSelectedIcon: false,
            onSelectionChanged: (p0) => {},
            segments: [
              ButtonSegment(
                value: 'weekly',
                label: Text('Weekly'),
              ),
              ButtonSegment(
                value: 'monthly',
                label: Text('Monthly'),
              ),
              ButtonSegment(
                value: 'yearly',
                label: Text('Yearly'),
              ),
            ],
            selected: {'weekly'},
          ),
          SizedBox(height: 36),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: BarChart(
              BarChartData(
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) =>
                            Text(value.toString())),
                  ),
                  rightTitles: AxisTitles(axisNameSize: 0),
                  topTitles: AxisTitles(axisNameSize: 0),
                ),
                borderData: FlBorderData(show: false),
                gridData: FlGridData(show: false),
                barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                  tooltipMargin: 30,
                  tooltipRoundedRadius: 16,
                  tooltipBgColor: Colors.blue,
                  direction: TooltipDirection.bottom,
                )),
                barGroups: [
                  BarChartGroupData(
                    barRods: [
                      BarChartRodData(
                          toY: 200, width: 16, color: Colors.blue[300])
                    ],
                    x: 1,
                  ),
                  BarChartGroupData(
                    barRods: [
                      BarChartRodData(
                          toY: 300, width: 16, color: Colors.blue[300])
                    ],
                    x: 2,
                  ),
                  BarChartGroupData(
                    barRods: [
                      BarChartRodData(
                          toY: 500, width: 16, color: Colors.blue[300])
                    ],
                    x: 3,
                  ),
                  BarChartGroupData(
                    barRods: [
                      BarChartRodData(
                          toY: 600, width: 16, color: Colors.blue[300])
                    ],
                    x: 4,
                  ),
                  BarChartGroupData(
                    barRods: [
                      BarChartRodData(
                          toY: 300, width: 16, color: Colors.blue[300])
                    ],
                    x: 5,
                  ),
                  BarChartGroupData(
                    barRods: [
                      BarChartRodData(
                          toY: 400, width: 16, color: Colors.blue[300])
                    ],
                    x: 6,
                  ),
                  BarChartGroupData(
                    barRods: [
                      BarChartRodData(
                          toY: 100, width: 16, color: Colors.blue[300])
                    ],
                    x: 7,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24),
          Text(
            'Categories',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Divider(),
        ],
      ),
    );
  }
}
