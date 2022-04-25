import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mrkt_app/utils/constants.dart';
import 'package:mrkt_app/widget/app_button_style.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    this.onPress,
    required this.title,
    this.radius = radius_10,
    this.style = AppButtonStyle.primary,
    this.letterSpacing,
    this.gradientBg,
  }) : super(key: key);
  final VoidCallback? onPress;
  final String title;
  final AppButtonStyle style;
  final double radius;
  final double? letterSpacing;
  final Gradient? gradientBg;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 50,
      decoration: BoxDecoration(
          color: gradientBg == null ? style.backgroundColor : null,
          borderRadius: BorderRadius.circular(radius),
          gradient: gradientBg),
      child: CupertinoButton(
        onPressed: onPress,
        color: Colors.transparent,
        padding: const EdgeInsets.all(spacing_10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline2?.copyWith(
              letterSpacing: letterSpacing,
              color: style.textColor,
              fontFamily: semiBoldFont,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
