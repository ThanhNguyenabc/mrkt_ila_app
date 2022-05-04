import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mrkt_app/utils/app_colors.dart';
import 'package:mrkt_app/utils/constants.dart';

class ActionSheetItem extends StatelessWidget {
  const ActionSheetItem(
      {Key? key,
      this.onPress,
      required this.title,
      this.titleStyle,
      this.iconName,
      this.fontFamily = lightFont,
      this.textColor = AppColors.primaryColor})
      : super(key: key);
  final VoidCallback? onPress;
  final String? iconName;
  final String title;
  final TextStyle? titleStyle;
  final Color? textColor;
  final String fontFamily;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPress != null) Navigator.of(context).maybePop();
        onPress?.call();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: spacing_16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              radius_10,
            ),
            color: Colors.white),
        child: Stack(
          children: [
            if (iconName != null) ...[
              Padding(
                padding: const EdgeInsets.only(
                  left: 70,
                ),
                child: SvgPicture.asset(
                  iconName!,
                ),
              ),
            ],
            Align(
              child: Text(
                title,
                style: titleStyle ??
                    Theme.of(context)
                        .textTheme
                        .headline3
                        ?.copyWith(color: textColor, fontFamily: fontFamily),
              ),
            )
          ],
        ),
      ),
    );
  }
}

showBottomAction(BuildContext context, List<ActionSheetItem> actions) {
  showCupertinoModalPopup(
      context: context,
      builder: (_) {
        return CupertinoActionSheet(
          actions: actions,
          cancelButton: ActionSheetItem(
            onPress: () {},
            title: 'Cancel',
            fontFamily: semiBoldFont,
          ),
        );
      });
}
