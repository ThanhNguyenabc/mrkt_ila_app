import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarData {
  final int id;
  final String name;
  final double y;
  final Color color;

  BarData(
      {required this.id,
      required this.name,
      required this.y,
      required this.color});
}

final barDataList = [
  BarData(id: 1, name: "name", y: 10, color: Colors.orange),
  BarData(id: 1, name: "name", y: 40, color: Colors.orange),
  BarData(id: 1, name: "name", y: 30, color: Colors.orange),
  BarData(id: 1, name: "name", y: 60, color: Colors.orange),
  BarData(id: 1, name: "name", y: 100, color: Colors.orange),
];

class CustomBarChart extends StatefulWidget {
  const CustomBarChart({Key? key}) : super(key: key);

  @override
  State<CustomBarChart> createState() => _CustomBarChartState();
}

class _CustomBarChartState extends State<CustomBarChart> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final w = constraints.maxWidth;
      return SizedBox(
        width: w,
        height: 250,
        child: BarChart(BarChartData(
            gridData: FlGridData(show: false),
            borderData: FlBorderData(show: false),
            titlesData: FlTitlesData(
                topTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                leftTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false))),
            maxY: 100,
            barGroups: barDataList
                .map((item) => BarChartGroupData(
                    x: item.id,
                    barRods: [BarChartRodData(toY: item.y, color: item.color)]))
                .toList())),
      );
    });
  }
}
