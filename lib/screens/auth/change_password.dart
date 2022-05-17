import 'package:flutter/material.dart';
import 'package:mrkt_app/screens/auth/forgot_password.dart';
import 'package:mrkt_app/utils/app_colors.dart';
import 'package:mrkt_app/utils/constants.dart';
import 'package:mrkt_app/utils/string_util.dart';
import 'package:mrkt_app/widget/button.dart';
import 'package:mrkt_app/widget/input_password.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);
  static const route = "/change_pw_page";
  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController oldPasswordEdt = TextEditingController();
  TextEditingController newPasswordEdt = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(spacing_16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              InputPassword(
                hint: 'Old password',
                controller: oldPasswordEdt,
                validator: (text) => StringUtil.validatePassword(text),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: spacing_30),
                child: InputPassword(
                  hint: 'New password',
                  controller: newPasswordEdt,
                  validator: (text) =>
                      StringUtil.validateNewPassword(oldPasswordEdt.text, text),
                ),
              ),
              InputPassword(
                hint: 'Confirm new password',
                validator: (text) => StringUtil.validateConfirmPassword(
                    text, newPasswordEdt.text),
              ),
              const SizedBox(
                height: spacing_30,
              ),
              Text(
                "Password must contain minimum 6 characters",
                style: textTheme.headline5,
              ),
              Button(
                margin: const EdgeInsets.only(top: 50, bottom: spacing_20),
                title: "Change Password",
                onPress: () {
                  if (formKey.currentState!.validate()) {}
                },
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushNamed(ForgotPassword.route),
                child: Padding(
                  padding: const EdgeInsets.all(spacing_8),
                  child: Text(
                    "Forgot Password ?",
                    style: textTheme.headline4?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
