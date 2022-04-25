import 'package:flutter/material.dart';
import 'package:mrkt_app/utils/constants.dart';

class BorderView extends StatelessWidget {
  const BorderView(
      {Key? key,
      this.child,
      this.padding,
      this.margin,
      this.height,
      this.width,
      this.borderColor = Colors.white,
      this.backgroundColor = Colors.white,
      this.borderRadius})
      : super(key: key);
  final Widget? child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  final Color borderColor;
  final double? height;
  final double? width;

  final Color backgroundColor;

  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: margin,
      height: height,
      padding: padding,
      width: width,
      decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1), blurRadius: radius_10)
          ],
          borderRadius: borderRadius ?? BorderRadius.circular(radius_10)),
    );
  }
}
