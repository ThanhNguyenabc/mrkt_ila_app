import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mrkt_app/screens/register/create_account.dart';
import 'package:mrkt_app/utils/app_colors.dart';
import 'package:mrkt_app/utils/constants.dart';
import 'package:mrkt_app/widget/gradient_backgound.dart';

class RegisterAccountType extends StatelessWidget {
  const RegisterAccountType({Key? key}) : super(key: key);
  static const route = "/register_page";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Padding(
          padding: const EdgeInsets.only(
              bottom: spacing_40,
              top: 100,
              left: spacing_16,
              right: spacing_16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi !',
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            ?.copyWith(fontFamily: 'Poppins-SemiBold'),
                      ),
                      Text(
                        "Create a new account",
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(color: AppColors.boulder),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    'asset/icons/ic_ila.svg',
                    height: 59,
                  )
                ],
              ),
              const Spacer(),
              Text(
                'Select to continue',
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    ?.copyWith(fontFamily: mediumFont),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 47, bottom: spacing_40),
                child: AccountTypeView(
                    image: 'asset/images/img_parent.png',
                    text: 'Are you a parent ?',
                    onPress: () => Navigator.of(context).pushNamed(
                        CreatingAccount.route,
                        arguments: AccountType.child)),
              ),
              AccountTypeView(
                  image: 'asset/images/img_children.png',
                  text: 'Are you a student ?',
                  onPress: () => Navigator.of(context).pushNamed(
                      CreatingAccount.route,
                      arguments: AccountType.normal)),
              const Spacer(
                flex: 2,
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => Navigator.of(context).maybePop(),
                child: RichText(
                    text: TextSpan(
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(fontFamily: mediumFont),
                        children: [
                          TextSpan(
                              text: 'Sign In',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(
                                      color: AppColors.resolutionBlue,
                                      fontFamily: boldFont))
                        ],
                        text: "Already have an ILA account? ")),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AccountTypeView extends StatelessWidget {
  const AccountTypeView(
      {Key? key,
      required this.image,
      required this.onPress,
      required this.text})
      : super(key: key);
  final String image;
  final VoidCallback onPress;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(image),
          ),
          const SizedBox(
            width: spacing_10,
          ),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(fontFamily: mediumFont),
          )
        ],
      ),
    );
  }
}
