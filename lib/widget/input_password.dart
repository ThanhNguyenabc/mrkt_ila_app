import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mrkt_app/utils/app_colors.dart';
import 'package:mrkt_app/widget/input_text.dart';

class InputPassword extends StatefulWidget {
  const InputPassword({
    Key? key,
    this.onShowPassword,
    this.hint,
    this.textStyle,
    this.controller,
    this.validator,
  }) : super(key: key);
  final Function(bool)? onShowPassword;
  final String? hint;
  final TextStyle? textStyle;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return InputText(
      validator: widget.validator,
      hint: widget.hint,
      controller: widget.controller,
      obscureText: !isShowPassword,
      rightIcon: isShowPassword
          ? const Icon(
              CupertinoIcons.eye_slash,
              color: AppColors.alto,
            )
          : const Icon(
              CupertinoIcons.eye_solid,
              color: AppColors.alto,
            ),
      onPressRightIcon: () {
        setState(() {
          isShowPassword = !isShowPassword;
        });
      },
      leftIcon: SvgPicture.asset('asset/icons/ic_password.svg'),
    );
  }
}
