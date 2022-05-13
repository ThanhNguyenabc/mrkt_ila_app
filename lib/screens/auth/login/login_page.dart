import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mrkt_app/screens/auth/bloc/index.dart';
import 'package:mrkt_app/screens/register/create_account.dart';
import 'package:mrkt_app/utils/app_colors.dart';
import 'package:mrkt_app/utils/constants.dart';
import 'package:mrkt_app/widget/button.dart';
import 'package:mrkt_app/widget/input_password.dart';
import 'package:mrkt_app/widget/input_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static String route = "/login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController userIdController = TextEditingController();

  final TextEditingController pwController = TextEditingController();
  bool isShowPassword = false;
  @override
  void dispose() {
    userIdController.dispose();
    pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final authBloc = BlocProvider.of<AuthBloc>(context);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: size.height / 2 + 100,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                    AppColors.havelockBlue.withOpacity(0.3),
                    Colors.white.withOpacity(0.01)
                  ],
                      stops: const [
                    0.1,
                    0.9
                  ])),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                bottom: 40, top: 100, left: spacing_16, right: spacing_16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome !',
                          style: Theme.of(context)
                              .textTheme
                              .headline1
                              ?.copyWith(fontFamily: 'Poppins-SemiBold'),
                        ),
                        Text(
                          "Sign in to continue",
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
                const SizedBox(
                  height: 55,
                ),
                InputText(
                  controller: userIdController,
                  hint: 'Email or UserId or Mobile',
                  textColor: AppColors.gigas,
                  leftIcon: SvgPicture.asset('asset/icons/ic_email.svg'),
                ),
                const SizedBox(
                  height: spacing_30,
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  buildWhen: (previous, current) =>
                      previous.netWorkStatus != current.netWorkStatus,
                  builder: (context, state) {
                    return InputPassword(
                      controller: pwController,
                      hint: 'Password',
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: spacing_20, top: 100),
                  child: BlocConsumer<AuthBloc, AuthState>(
                    listenWhen: (previous, current) =>
                        previous.netWorkStatus != current.netWorkStatus,
                    listener: (context, state) {
                      if (state.netWorkStatus == NetWorkStatus.fail) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                          "Something has wrong",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(color: Colors.redAccent),
                        )));
                      }
                    },
                    buildWhen: (previous, current) =>
                        previous.netWorkStatus != current.netWorkStatus,
                    builder: (context, state) {
                      final status = state.netWorkStatus;
                      return Button(
                        width: status == NetWorkStatus.loading ? 200 : null,
                        letterSpacing: 5,
                        onPress: () {
                          authBloc.add(LoginEvent(
                              username: userIdController.text,
                              password: pwController.text));
                        },
                        title: "LOGIN",
                        child: status == NetWorkStatus.loading
                            ? const LoginLoading()
                            : null,
                        radius: radius_50,
                      );
                    },
                  ),
                ),
                Text(
                  "Forgot Password ?",
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: AppColors.resolutionBlue,
                      fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, CreatingAccount.route),
                  child: RichText(
                      text: TextSpan(
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(color: AppColors.gray),
                          children: [
                            TextSpan(
                                text: 'Sign Up',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    ?.copyWith(
                                        color: AppColors.resolutionBlue,
                                        fontFamily: boldFont))
                          ],
                          text: "Don't you have an account ? ")),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoginLoading extends StatelessWidget {
  const LoginLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(
              strokeWidth: 2.0,
              color: Colors.white,
            )),
        const SizedBox(
          width: spacing_16,
        ),
        Text(
          'Logging ...',
          style: Theme.of(context).textTheme.headline4?.copyWith(
                color: Colors.white,
              ),
        ),
      ],
    );
  }
}
