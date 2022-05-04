import 'package:flutter/material.dart';
import 'package:mrkt_app/utils/app_colors.dart';
import 'package:mrkt_app/utils/constants.dart';

class InputText extends StatelessWidget {
  const InputText(
      {Key? key,
      this.hint,
      this.textStyle,
      this.textColor,
      this.leftIcon,
      this.rightIcon,
      this.onPressRightIcon,
      this.controller,
      this.backgroundColor = Colors.white,
      this.obscureText = false,
      this.isEnable,
      this.validator,
      this.errorText,
      this.onChanged,
      this.borderRadius = radius_40})
      : super(key: key);
  final String? hint;
  final TextStyle? textStyle;
  final Color backgroundColor;
  final Color? textColor;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final VoidCallback? onPressRightIcon;
  final TextEditingController? controller;
  final bool obscureText;
  final double borderRadius;
  final bool? isEnable;
  final String? errorText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  
  @override
  Widget build(BuildContext context) {
    final style = textStyle ??
        Theme.of(context).textTheme.headline4?.copyWith(color: textColor);
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      style: style,
      enabled: isEnable,
      cursorColor: AppColors.gray90,
      decoration: InputDecoration(
        errorText: errorText,
        contentPadding: const EdgeInsets.symmetric(horizontal: spacing_16),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: AppColors.alto),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: AppColors.alto),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: AppColors.alto),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: AppColors.alto),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: AppColors.alto),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        fillColor: backgroundColor,
        filled: true,
        hintText: hint,
        hintStyle: style?.copyWith(color: AppColors.alto),
        prefixIcon: leftIcon != null
            ? Padding(
                padding: const EdgeInsets.only(
                  left: spacing_18,
                  right: spacing_10,
                ),
                child: leftIcon)
            : null,
        suffixIcon: GestureDetector(
          onTap: onPressRightIcon,
          child: Padding(
              padding: const EdgeInsets.only(right: spacing_16),
              child: rightIcon),
        ),
        prefixIconConstraints:
            const BoxConstraints(minHeight: 18, minWidth: 18),
        suffixIconConstraints:
            const BoxConstraints(minHeight: 18, minWidth: 18),
      ),
    );
  }
}
