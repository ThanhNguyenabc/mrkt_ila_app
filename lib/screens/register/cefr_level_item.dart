import 'package:flutter/material.dart';
import 'package:mrkt_app/utils/app_colors.dart';
import 'package:mrkt_app/utils/constants.dart';
import 'package:mrkt_app/widget/cefr_level_dialog.dart';
import 'package:mrkt_app/widget/index.dart';

class CEFRLevelItem extends StatefulWidget {
  const CEFRLevelItem({Key? key}) : super(key: key);

  @override
  State<CEFRLevelItem> createState() => _CEFRLevelItemState();
}

class _CEFRLevelItemState extends State<CEFRLevelItem> {
  Map selectedItem = CEFRLevels[0];

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
                    onSelectedLevel: (index) {
                      // updateUserInfo();
                      setState(() {
                        selectedItem = CEFRLevels[index]!;
                      });
                    },
                  );
                });
          },
          child: LevelItem(
            levelName: selectedItem['key'],
            backgroundColor: selectedItem['color2'],
            width: 40,
            textSize: 15,
            isShowSubTitle: false,
          ),
        )
      ],
    );
  }
}
