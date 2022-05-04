import 'package:flutter/material.dart';
import 'package:mrkt_app/features/auth/auth_page.dart';
import 'package:mrkt_app/features/auth/bloc/auth_state.dart';
import 'package:mrkt_app/features/register/create_account.dart';
import 'package:mrkt_app/utils/app_colors.dart';
import 'package:mrkt_app/utils/constants.dart';
import 'package:mrkt_app/widget/button.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({Key? key, required this.onSignIn}) : super(key: key);
  final VoidCallback onSignIn;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Button(
          radius: radius_40,
          title: "SIGN IN",
          onPress: onSignIn,
          gradientBg: LinearGradient(colors: [
            AppColors.lorchmara,
            AppColors.violet.withOpacity(0.8),
          ]),
        ),
        const SizedBox(
          height: spacing_20,
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.pushNamed(
            context,
            CreatingAccount.route,
          ),
          child: RichText(
              text: TextSpan(
                  children: [
                TextSpan(
                    text: 'Sign Up',
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                        fontFamily: boldFont, color: AppColors.toryBlue))
              ],
                  text: 'First time here? ',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(fontFamily: lightFont))),
        )
      ],
    );
  }
}
