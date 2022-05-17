import 'package:flutter/material.dart';
import 'package:mrkt_app/utils/app_colors.dart';
import 'package:mrkt_app/utils/constants.dart';
import 'package:mrkt_app/widget/cefr_level_dialog.dart';
import 'package:mrkt_app/widget/index.dart';

class CEFRLevelItem extends StatefulWidget {
  const CEFRLevelItem({Key? key, this.onSelectedIndex}) : super(key: key);
  final Function(int)? onSelectedIndex;

  @override
  State<CEFRLevelItem> createState() => _CEFRLevelItemState();
}

class _CEFRLevelItemState extends State<CEFRLevelItem> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'CEFR Level',
            style: Theme.of(context)
                .textTheme
                .headline3
                ?.copyWith(fontFamily: semiBoldFont, color: AppColors.smalt),
          ),
        ),
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return CEFRLevelDialog(
                    initLevelIndex: currentIndex,
                    buttonTitle: "Continue",
                    onSelectedLevel: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                      widget.onSelectedIndex?.call(index);
                    },
                  );
                });
          },
          child: LevelItem(
            levelName: CEFRLevels[currentIndex]['key'],
            backgroundColor: CEFRLevels[currentIndex]['color2'],
            width: 40,
            textSize: 15,
            isShowSubTitle: false,
          ),
        )
      ],
    );
  }
}
