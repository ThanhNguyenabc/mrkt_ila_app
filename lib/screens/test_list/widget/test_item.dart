import 'package:flutter/material.dart';
import 'package:mrkt_app/utils/app_colors.dart';
import 'package:mrkt_app/utils/constants.dart';
import 'package:mrkt_app/widget/border_view.dart';
import 'package:mrkt_app/widget/circular_progressbar.dart';
import 'package:data/data.dart';

class TestItem extends StatelessWidget {
  const TestItem({Key? key, required this.data}) : super(key: key);
  final TestModel data;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final percent = data.completion ?? 0;
    return BorderView(
      backgroundColor: Theme.of(context).colorScheme.commonColor,
      margin: const EdgeInsets.only(top: spacing_10),
      height: 110,
      padding: const EdgeInsets.symmetric(
          vertical: spacing_8, horizontal: spacing_16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Test ${data.id}",
                  style: textTheme.headline4
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: spacing_8),
                  padding: const EdgeInsets.all(spacing_4),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.testListItemDesBgColor,
                      borderRadius: BorderRadius.circular(radius_4)),
                  child: Text(
                    data.testName ?? "",
                    style: textTheme.headline4?.copyWith(color: Colors.white),
                  ),
                ),
                Text(
                  data.date ?? "",
                  style: textTheme.headline5,
                ),
              ],
            ),
          ),
          CircularProgressBar(
            percentage: percent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (percent > 0) ...{
                  Text(
                    "${data.completion}%",
                    style: textTheme.headline4
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Score",
                    style: textTheme.headline5?.copyWith(height: 0.8),
                  )
                } else
                  Text(
                    "No result yet ",
                    textAlign: TextAlign.center,
                    style: textTheme.headline6,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
