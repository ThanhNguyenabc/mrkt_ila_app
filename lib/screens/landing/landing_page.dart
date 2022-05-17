import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mrkt_app/screens/auth/bloc/auth_bloc.dart';
import 'package:mrkt_app/screens/auth/bloc/auth_event.dart';
import 'package:mrkt_app/screens/landing/sign_up_button.dart';
import 'package:mrkt_app/utils/app_colors.dart';
import 'package:mrkt_app/utils/constants.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);
  static const route = '/landing_page';

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  bool isSelectedVieLanguage = false;
  bool isSelectedEngLanguage = false;
  bool isShowSign = false;

  Duration duration = const Duration(milliseconds: 450);
  late AnimationController animationController;
  late Animation<Color?> animation;
  late Animation<Color?> animation2;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 10))
          ..repeat(reverse: true);
    animation = ColorTween(
            begin: AppColors.havelockBlue.withOpacity(0.3),
            end: AppColors.magenta.withOpacity(0.3))
        .animate(animationController);
    animation2 = ColorTween(
            begin: AppColors.magenta.withOpacity(0.2),
            end: AppColors.havelockBlue.withOpacity(0.3))
        .animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(HideLandingPageEvent());
    final child = Padding(
      padding: const EdgeInsets.only(left: 43, right: 43, bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(
            flex: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('asset/icons/ic_ila.svg'),
              const SizedBox(
                width: spacing_12,
              ),
              SvgPicture.asset('asset/icons/ic_student.svg')
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            'Welcome !',
            style: Theme.of(context)
                .textTheme
                .headline1
                ?.copyWith(fontFamily: 'Poppins-SemiBold'),
          ),
          Text(
            'Whatever your dream is, we will help your child become part of the new elite young generation in Vietnam',
            textAlign: TextAlign.justify,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: AppColors.emperor),
          ),
          const SizedBox(
            height: 100,
          ),
          SizedBox(
            width: double.infinity,
            height: 250,
            child: selectLanguageView(context),
          ),
          const Spacer(
            flex: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Product by',
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontWeight: FontWeight.w300, fontFamily: lightFont),
              ),
              const SizedBox(
                width: spacing_4,
              ),
              Text(
                'ILA VIET NAM',
                textAlign: TextAlign.justify,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(fontWeight: FontWeight.w300),
              ),
            ],
          )
        ],
      ),
    );

    return Scaffold(
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return DecoratedBox(
                child: child,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        tileMode: TileMode.mirror,
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                      animation.value!,
                      animation2.value!
                    ],
                        stops: const [
                      0.3,
                      0.8,
                    ])),
              );
            },
            child: child,
          )
        ],
      ),
    );
  }

  Widget selectLanguageView(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        if (!isShowSign)
          Text(
            'Select your language',
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(fontFamily: mediumFont),
          ),
        if (!isShowSign)
          Positioned(
            top: 40,
            child: SizedBox(
              width: 150,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: spacing_20),
                    child: Text(
                      'or',
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            fontFamily: mediumFont,
                          ),
                    ),
                  ),
                  AnimatedAlign(
                    onEnd: showSignIn,
                    duration: duration,
                    curve: Curves.easeInOut,
                    alignment: isSelectedVieLanguage
                        ? Alignment.center
                        : Alignment.topLeft,
                    child: isSelectedEngLanguage
                        ? null
                        : GestureDetector(
                            onTap: () => setState(() {
                              isSelectedVieLanguage = true;
                            }),
                            child: Image.asset(
                              'asset/images/img_vie.png',
                              height: 40,
                            ),
                          ),
                  ),
                  AnimatedAlign(
                    onEnd: showSignIn,
                    duration: duration,
                    curve: Curves.easeInOut,
                    alignment: isSelectedEngLanguage
                        ? Alignment.center
                        : Alignment.bottomRight,
                    child: isSelectedVieLanguage
                        ? null
                        : GestureDetector(
                            onTap: () => setState(() {
                              isSelectedEngLanguage = true;
                            }),
                            child: Image.asset(
                              'asset/images/img_eng.png',
                              height: 40,
                            ),
                          ),
                  )
                ],
              ),
            ),
          ),
        AnimatedScale(
          scale: isShowSign ? 1.0 : 0.0,
          duration: duration,
          alignment: Alignment.topCenter,
          child: SignInButton(
            onSignIn: () => navigateToLoginPage(context),
          ),
        )
      ],
    );
  }

  void showSignIn() => setState(() {
        isShowSign = true;
      });

  void navigateToLoginPage(BuildContext context) {
    BlocProvider.of<AuthBloc>(context)
        .add(UpdatingAuthStatusEvent(status: AuthStatus.login));
  }
}
