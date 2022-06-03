import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mrkt_app/utils/app_colors.dart';
import 'package:mrkt_app/utils/app_theme.dart';

class CustomLineChart extends StatefulWidget {
  const CustomLineChart({Key? key}) : super(key: key);

  @override
  State<CustomLineChart> createState() => _CustomLineChartState();
}

class _CustomLineChartState extends State<CustomLineChart> {
  final chartHeight = 250.0;
  final lineColor = const LinearGradient(colors: [
    AppColors.portage,
    AppColors.melrose,
  ]);

  final bgColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.melrose.withOpacity(0.3), Colors.white],
  );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: width,
            height: chartHeight,
            child: LineChart(
              LineChartData(
                minX: 0.0,
                maxX: width,
                minY: 0.0,
                maxY: chartHeight,
                titlesData: FlTitlesData(
                  show: true,
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  leftTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 30,
                          getTitlesWidget: (double value, TitleMeta title) {
                            var text = "";
                            switch (value.toInt()) {
                              case 100:
                                text = "11.04";
                                break;
                              case 200:
                                text = "14.04";
                                break;
                              case 300:
                                text = "24.04";
                                break;
                              case 350:
                                text = "12.05";
                                break;
                              default:
                            }

                            return Text(
                              text,
                              style: Theme.of(context).textTheme.bodyText1,
                            );
                          })),
                ),
                gridData: FlGridData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                      spots: [
                        FlSpot(0, chartHeight / 3),
                        const FlSpot(100, 100),
                        const FlSpot(200, 180),
                        const FlSpot(300, 90),
                        const FlSpot(350, 240),
                        FlSpot(width, 190),
                      ],
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (p0, p1, p2, p3) {
                          return FlDotCirclePainter(
                              color: AppColors.primaryColor,
                              radius: 4,
                              strokeWidth: 3,
                              strokeColor: Colors.white);
                        },
                      ),
                      barWidth: 5,
                      isCurved: true,
                      gradient: lineColor,
                      belowBarData: BarAreaData(gradient: bgColor, show: true)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
