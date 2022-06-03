import 'package:flutter/material.dart';
import 'package:data/data.dart';
import 'package:mrkt_app/utils/constants.dart';
import 'test_item.dart';
import 'test_item_skeleton.dart';

class TestModule extends StatelessWidget {
  final String title;
  final List<TestModel> data;
  const TestModule({Key? key, required this.data, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widgets = data.isEmpty == true
        ? const [TestItemSkeleton(), TestItemSkeleton()]
        : data.map((TestModel item) => TestItem(data: item)).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: spacing_20),
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        ...widgets
      ],
    );
  }
}
