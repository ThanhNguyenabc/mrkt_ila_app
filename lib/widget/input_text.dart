import 'package:flutter/material.dart';
import 'package:mrkt_app/utils/app_colors.dart';
import 'package:mrkt_app/utils/constants.dart';

class InputText extends StatelessWidget {
  const InputText({
    Key? key,
    this.hint,
    this.textStyle,
    this.textColor,
    this.leftIcon,
    this.rightIcon,
    this.onPressRightIcon,
  }) : super(key: key);
  final String? hint;
  final TextStyle? textStyle;
  final Color? textColor;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final VoidCallback? onPressRightIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        style: textStyle ??
            Theme.of(context).textTheme.headline4?.copyWith(color: textColor),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: AppColors.alto),
            borderRadius: BorderRadius.circular(40),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: AppColors.alto),
            borderRadius: BorderRadius.circular(40),
          ),
          fillColor: Colors.white,
          hintText: hint,
          prefixIcon: Padding(
              padding: const EdgeInsets.only(
                left: spacing_18,
                right: spacing_10,
              ),
              child: leftIcon),
          suffixIcon: GestureDetector(
            onTap: onPressRightIcon,
            child: Padding(
                padding:
                    const EdgeInsets.only(left: spacing_10, right: spacing_18),
                child: rightIcon),
          ),
          prefixIconConstraints:
              const BoxConstraints(minHeight: 18, minWidth: 18),
          suffixIconConstraints:
              const BoxConstraints(minHeight: 18, minWidth: 18),
        ),
      ),
    );
  }
}
