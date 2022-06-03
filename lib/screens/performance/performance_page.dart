import 'package:flutter/material.dart';
import 'package:mrkt_app/utils/app_colors.dart';
import 'package:mrkt_app/utils/constants.dart';
import 'package:mrkt_app/widget/border_view.dart';
import 'package:mrkt_app/widget/custom_bar_chart.dart';
import 'package:mrkt_app/widget/custom_line_chart.dart';

class Data {
  final int id;
  final String name;
  final double y;
  final Color color;

  Data(
      {required this.id,
      required this.name,
      required this.y,
      required this.color});
}

final barData = [
  Data(id: 1, name: "name", y: 10, color: Colors.orange),
  Data(id: 1, name: "name", y: 40, color: Colors.blue),
  Data(id: 1, name: "name", y: 30, color: Colors.orange),
  Data(id: 1, name: "name", y: 60, color: Colors.orange),
  Data(id: 1, name: "name", y: 100, color: Colors.orange),
];

class PerformancePage extends StatefulWidget {
  const PerformancePage({Key? key}) : super(key: key);

  @override
  State<PerformancePage> createState() => _PerformancePageState();
}

class _PerformancePageState extends State<PerformancePage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(spacing_16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Text(
              "Performance Test",
              style: textTheme.headline2?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return const PerformanceItem(
                          chart: CustomLineChart(), title: "Overall");
                    }
                    return const PerformanceItem(
                        chart: CustomBarChart(), title: "Core Skills");
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: spacing_10,
                      ),
                  itemCount: 2))
        ],
      ),
    );
  }
}

class PerformanceItem extends StatelessWidget {
  const PerformanceItem({Key? key, required this.chart, this.title})
      : super(key: key);
  final Widget chart;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BorderView(
      backgroundColor: Theme.of(context).colorScheme.commonColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title ?? "",
              style: textTheme.headline3?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_8),
            child: Text(
              "Lorem ipsum dolor sit amet",
              style: textTheme.headline6,
            ),
          ),
          chart
        ],
      ),
    );
  }
}
