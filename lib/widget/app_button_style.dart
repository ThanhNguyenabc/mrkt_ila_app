import 'package:flutter/material.dart';
import 'package:mrkt_app/utils/app_colors.dart';

class AppButtonStyle {
  final Color textColor;
  final Color backgroundColor;
  final Color disabledTextColor;
  final Color disabledBackgroundColor;

  const AppButtonStyle.init({
    required this.textColor,
    required this.backgroundColor,
    required this.disabledTextColor,
    required this.disabledBackgroundColor,
  });

  AppButtonStyle copyWith({
    Color? textColor,
    Color? backgroundColor,
    Color? disabledTextColor,
    Color? disabledBackgroundColor,
    BorderRadius? borderRadius,
  }) {
    return AppButtonStyle.init(
      textColor: textColor ?? this.textColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      disabledTextColor: disabledTextColor ?? this.disabledTextColor,
      disabledBackgroundColor:
          disabledBackgroundColor ?? this.disabledBackgroundColor,
    );
  }

  static const AppButtonStyle primary = AppButtonStyle.init(
    textColor: Colors.white,
    backgroundColor: AppColors.primaryColor,
    disabledTextColor: Colors.white,
    disabledBackgroundColor: AppColors.alto,
  );
}
