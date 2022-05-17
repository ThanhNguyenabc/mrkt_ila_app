import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mrkt_app/utils/constants.dart';
import 'package:mrkt_app/widget/app_button_style.dart';

class Button extends StatelessWidget {
  const Button(
      {Key? key,
      this.onPress,
      required this.title,
      this.radius = radius_10,
      this.style = AppButtonStyle.primary,
      this.child,
      this.letterSpacing,
      this.width,
      this.gradientBg,
      this.margin,
      this.height = 50})
      : super(key: key);

  final VoidCallback? onPress;
  final String title;
  final AppButtonStyle style;
  final double radius;
  final double? letterSpacing;
  final Gradient? gradientBg;
  final Widget? child;
  final double? width;
  final double height;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: margin,
      width: width ?? size.width,
      height: height,
      decoration: BoxDecoration(
          color: gradientBg == null ? style.backgroundColor : null,
          borderRadius: BorderRadius.circular(radius),
          gradient: gradientBg),
      child: child ??
          CupertinoButton(
            onPressed: onPress,
            color: Colors.transparent,
            padding: const EdgeInsets.all(spacing_10),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline2?.copyWith(
                    letterSpacing: letterSpacing,
                    color: style.textColor,
                    fontFamily: mediumFont,
                  ),
            ),
          ),
    );
  }
}
