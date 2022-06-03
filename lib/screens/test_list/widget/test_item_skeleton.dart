import 'package:flutter/material.dart';
import 'package:mrkt_app/utils/constants.dart';
import 'package:mrkt_app/widget/skeleton.dart';

class TestItemSkeleton extends StatelessWidget {
  const TestItemSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Skeleton(
                width: 150,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: spacing_8),
                child: Skeleton(
                  width: double.infinity,
                  height: 50,
                ),
              ),
              Skeleton(
                width: 150,
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: spacing_10),
          child: Skeleton(
            width: 70,
            height: 70,
            boxShape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
