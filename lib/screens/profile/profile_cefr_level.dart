import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mrkt_app/screens/cefr_level/cefr_level_page.dart';
import 'package:mrkt_app/utils/app_colors.dart';
import 'package:mrkt_app/utils/constants.dart';
import 'package:mrkt_app/widget/border_view.dart';
import 'package:mrkt_app/widget/cefr_level_dialog.dart';
import 'package:mrkt_app/widget/index.dart';
import 'package:mrkt_app/widget/radial_bg_painter.dart';

class ProfileCEFRLevel extends StatefulWidget {
  const ProfileCEFRLevel({Key? key, required this.currentLevelIndex})
      : super(key: key);
  final int currentLevelIndex;

  @override
  State<ProfileCEFRLevel> createState() => _ProfileCEFRLevelState();
}

class _ProfileCEFRLevelState extends State<ProfileCEFRLevel> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = widget.currentLevelIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentLevel = CEFRLevels[currentIndex];
    final previousLevel = CEFRLevels[currentIndex - 1];
    final nextLevel = CEFRLevels[currentIndex + 1];
    final size = MediaQuery.of(context).size;

    return BorderView(
      backgroundColor: Theme.of(context).colorScheme.commonColor,
      padding: const EdgeInsets.all(spacing_8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'CEFR Level',
                style: Theme.of(context).textTheme.headline3?.copyWith(
                    fontFamily: semiBoldFont,
                    color: Theme.of(context).colorScheme.primaryTextColor),
              ),
              GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () async {
                    final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CEFRLevelPage(
                                  selectIndex: currentIndex,
                                ))) as Map?;

                    if (result != null) {
                      setState(() {
                        currentIndex = result["selectedIndex"];
                      });
                    }
                  },
                  child: SvgPicture.asset("asset/icons/ic_edit.svg",
                      color: Theme.of(context).colorScheme.editCEFRIconColor))
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: spacing_40, horizontal: size.width / 3 - 90),
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (previousLevel != null)
                  Positioned(
                    child: Row(
                      children: [
                        LevelItem(
                            levelName: previousLevel["key"],
                            isShowSubTitle: false,
                            width: 40,
                            textSize: 18,
                            backgroundColor: previousLevel["color2"]),
                        const SizedBox(
                          width: spacing_16,
                        ),
                        DoubleArrowView(
                          color: currentLevel["color2"] as Color,
                        ),
                      ],
                    ),
                  ),
                Align(
                  child: CustomPaint(
                    painter: RadialBackgroundPainter(
                        radius: 20, color: currentLevel["color2"]),
                    child: LevelItem(
                        levelName: currentLevel["key"],
                        isShowSubTitle: false,
                        backgroundColor: currentLevel["color2"]),
                  ),
                ),
                if (nextLevel != null)
                  Positioned(
                    right: 0,
                    child: Row(
                      children: [
                        DoubleArrowView(
                          color: nextLevel["color2"] as Color,
                        ),
                        const SizedBox(
                          width: spacing_16,
                        ),
                        LevelItem(
                            levelName: nextLevel["key"],
                            isShowSubTitle: false,
                            width: 40,
                            textSize: 18,
                            backgroundColor: nextLevel["color2"])
                      ],
                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DoubleArrowView extends StatelessWidget {
  const DoubleArrowView({Key? key, required this.color}) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    final colorOpacity = color.withOpacity(0.4);
    return Row(
      children: [
        SvgPicture.asset("asset/icons/ic_chevron_next.svg",
            height: 13, color: colorOpacity),
        SvgPicture.asset("asset/icons/ic_chevron_next.svg",
            color: colorOpacity),
      ],
    );
  }
}
