import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mrkt_app/utils/constants.dart';
import 'package:mrkt_app/widget/button.dart';
import 'package:mrkt_app/widget/gradient_backgound.dart';
import 'package:mrkt_app/widget/input_text.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);
  static const route = "/forgot_password";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: GradientBackground(
        child: Padding(
          padding: const EdgeInsets.all(spacing_16),
          child: Column(
            children: [
              Text(
                "Don’t worry. We’ll send you an email with a reset link",
                style: Theme.of(context).textTheme.headline5,
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: spacing_30, bottom: size.height / 4),
                child: InputText(
                  hint: "Email",
                  leftIcon: SvgPicture.asset("asset/icons/ic_email.svg"),
                ),
              ),
              Button(
                title: 'Confirm Email',
                radius: radius_50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
