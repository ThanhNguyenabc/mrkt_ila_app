import 'package:flutter/material.dart';
import 'package:mrkt_app/utils/app_colors.dart';
import 'package:mrkt_app/utils/constants.dart';
import 'package:mrkt_app/widget/app_button_style.dart';
import 'package:mrkt_app/widget/border_view.dart';
import 'package:mrkt_app/widget/button.dart';
import 'package:mrkt_app/widget/index.dart';

class CEFRLevelDialog extends StatefulWidget {
  const CEFRLevelDialog(
      {Key? key, this.buttonTitle = 'Select', this.onSelectedLevel})
      : super(key: key);
  final String buttonTitle;

  final Function(int)? onSelectedLevel;

  @override
  State<CEFRLevelDialog> createState() => _CEFRLevelDialogState();
}

class _CEFRLevelDialogState extends State<CEFRLevelDialog> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: BorderView(
        padding: const EdgeInsets.all(spacing_8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'CEFR Level',
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  ?.copyWith(fontFamily: semiBoldFont, color: AppColors.smalt),
            ),
            const SizedBox(
              height: spacing_24,
            ),
            SizedBox(
              height: 220,
              child: GridView.builder(
                  itemCount: CEFRLevels.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: spacing_20,
                      crossAxisSpacing: spacing_20),
                  itemBuilder: (context, index) {
                    final item = CEFRLevels[index]!;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: LevelItem(
                          textColor: CEFRLevels[selectedIndex]!['level'] ==
                                  item['level']
                              ? AppColors.alizarinCrimson
                              : Colors.black,
                          levelName: item['level'],
                          backgroundColor: item['color']),
                    );
                  }),
            ),
            Button(
              height: 37,
              title: '',
              margin: const EdgeInsets.symmetric(horizontal: spacing_40),
              style: AppButtonStyle.primary
                  .copyWith(backgroundColor: AppColors.blueChalk),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  widget.onSelectedLevel?.call(selectedIndex);
                  Navigator.of(context).maybePop();
                },
                child: Center(
                    child: Text(
                  widget.buttonTitle,
                  style: Theme.of(context).textTheme.headline3?.copyWith(
                      color: AppColors.electricViolet,
                      fontFamily: semiBoldFont),
                )),
              ),
            ),
            const SizedBox(
              height: spacing_16,
            )
          ],
        ),
      ),
    );
  }
}

class LevelItem extends StatelessWidget {
  const LevelItem({
    Key? key,
    required this.levelName,
    required this.backgroundColor,
    this.width = 60,
    this.isShowSubTitle = true,
    this.textSize,
    this.textColor,
  }) : super(key: key);
  final String levelName;
  final Color? textColor;
  final double width;
  final double? textSize;
  final bool isShowSubTitle;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width,
          height: width,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: backgroundColor),
          child: Center(
            child: Text(
              levelName,
              style: Theme.of(context).textTheme.headline2?.copyWith(
                  fontFamily: phosphateInline,
                  color: Colors.white,
                  fontSize: textSize),
            ),
          ),
        ),
        const SizedBox(
          height: spacing_4,
        ),
        if (isShowSubTitle)
          Text(
            levelName,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: textColor),
          )
      ],
    );
  }
}
