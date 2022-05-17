import 'package:flutter/material.dart';
import 'package:mrkt_app/screens/cefr_level/CEFR_level_page.dart';
import 'package:mrkt_app/utils/app_colors.dart';
import 'package:mrkt_app/utils/constants.dart';
import 'package:mrkt_app/widget/app_button_style.dart';
import 'package:mrkt_app/widget/border_view.dart';
import 'package:mrkt_app/widget/button.dart';
import 'package:mrkt_app/widget/index.dart';

class CEFRLevelDialog extends StatefulWidget {
  const CEFRLevelDialog({
    Key? key,
    this.buttonTitle = 'Select',
    this.onSelectedLevel,
  }) : super(key: key);
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
            Row(
              children: [
                Text(
                  'CEFR Level',
                  style: Theme.of(context).textTheme.headline3?.copyWith(
                      fontFamily: semiBoldFont, color: AppColors.smalt),
                ),
                const Spacer(),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () async {
                    final result = await Navigator.of(context)
                        .pushNamed(CEFRLevelPage.route) as Map;
                    setState(() {
                      selectedIndex = result["selectedIndex"];
                    });
                  },
                  child: Text(
                    "detail",
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(color: AppColors.electricViolet),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: spacing_24,
            ),
            SizedBox(
              height: 250,
              child: GridView.builder(
                  itemCount: CEFRLevels.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: spacing_16,
                      crossAxisSpacing: spacing_16),
                  itemBuilder: (context, index) {
                    final item = CEFRLevels[index]!;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.only(top: spacing_10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(radius_10),
                            color: index == selectedIndex
                                ? AppColors.seashell
                                : Colors.white),
                        child: LevelItem(
                            levelName: item['key'],
                            backgroundColor: item['color2']),
                      ),
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
      mainAxisSize: MainAxisSize.min,
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
