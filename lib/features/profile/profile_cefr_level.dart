import 'package:flutter/material.dart';
import 'package:mrkt_app/utils/app_colors.dart';
import 'package:mrkt_app/utils/constants.dart';
import 'package:mrkt_app/widget/border_view.dart';

class ProfileCEFRLevel extends StatelessWidget {
  const ProfileCEFRLevel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BorderView(
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
                    fontFamily: semiBoldFont, color: AppColors.smalt),
              ),
              Text(
                'Change',
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: AppColors.electricViolet, fontFamily: mediumFont),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 33, vertical: spacing_20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                LevelItem(levelName: "A2", backgroundColor: AppColors.saffron),
                LevelItem(levelName: "B2", backgroundColor: AppColors.niagara),
                LevelItem(levelName: "C2", backgroundColor: AppColors.scooter)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 33, right: 33, top: spacing_20, bottom: spacing_20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                LevelItem(
                    levelName: "A1",
                    backgroundColor: AppColors.alizarinCrimson),
                LevelItem(
                    levelName: "B1", backgroundColor: AppColors.fruitSalad),
                LevelItem(levelName: "C1", backgroundColor: AppColors.violet)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LevelItem extends StatelessWidget {
  const LevelItem(
      {Key? key, required this.levelName, required this.backgroundColor})
      : super(key: key);
  final String levelName;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: backgroundColor),
          child: Center(
            child: Text(
              levelName,
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  ?.copyWith(fontFamily: phosphateInline, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: spacing_4,
        ),
        Text(
          levelName,
          style: Theme.of(context).textTheme.headline6,
        )
      ],
    );
  }
}
