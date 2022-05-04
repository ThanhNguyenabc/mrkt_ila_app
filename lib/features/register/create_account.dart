import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mrkt_app/features/auth/auth_page.dart';
import 'package:mrkt_app/features/auth/bloc/auth_bloc.dart';
import 'package:mrkt_app/features/auth/bloc/auth_event.dart';
import 'package:mrkt_app/features/auth/bloc/auth_state.dart';
import 'package:mrkt_app/features/register/create_child_account.dart';
import 'package:mrkt_app/models/network_status.dart';
import 'package:mrkt_app/models/user.model.dart';
import 'package:mrkt_app/utils/app_colors.dart';
import 'package:mrkt_app/utils/constants.dart';
import 'package:mrkt_app/utils/string_util.dart';
import 'package:mrkt_app/widget/button.dart';
import 'package:mrkt_app/widget/cefr_level_dialog.dart';
import 'package:mrkt_app/widget/gradient_backgound.dart';
import 'package:mrkt_app/widget/index.dart';
import 'package:mrkt_app/widget/input_password.dart';
import 'package:mrkt_app/widget/input_text.dart';
import 'package:mrkt_app/widget/loading_dialog.dart';

enum AccountType { normal, child }

class CreatingAccount extends StatefulWidget {
  const CreatingAccount({Key? key}) : super(key: key);
  static const route = '/creating_student_account';

  @override
  State<CreatingAccount> createState() => _CreatingAccountState();
}

class _CreatingAccountState extends State<CreatingAccount> {
  TextEditingController txtFirstName = TextEditingController();
  TextEditingController txtLastName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtConfirmPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String cefrLevel = '';

  @override
  Widget build(BuildContext context) {
    const accountType = AccountType.normal;
    final inputTextStyle =
        Theme.of(context).textTheme.headline4?.copyWith(color: AppColors.gigas);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create account',
          style: Theme.of(context)
              .appBarTheme
              .titleTextStyle
              ?.copyWith(color: AppColors.kleinBlue),
        ),
      ),
      body: GradientBackground(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_16),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                BlocListener<AuthBloc, AuthState>(
                  listenWhen: (previous, current) =>
                      previous.netWorkStatus != current.netWorkStatus,
                  listener: (context, state) {
                    switch (state.netWorkStatus) {
                      case NetWorkStatus.loading:
                        showLoadingDialog();
                        break;
                      case NetWorkStatus.fail:
                        Navigator.of(context).maybePop();
                        break;
                      case NetWorkStatus.success:
                        Navigator.popUntil(
                            context, ModalRoute.withName(AuthPage.route));
                        break;
                      default:
                    }
                  },
                  child: const SizedBox(),
                ),
                const SizedBox(
                  height: 50,
                ),
                if (accountType == AccountType.normal) ...{
                  Row(
                    children: [
                      Flexible(
                        child: InputText(
                          leftIcon:
                              SvgPicture.asset('asset/icons/ic_edit_text.svg'),
                          textStyle: inputTextStyle,
                          controller: txtFirstName,
                          hint: 'First name',
                        ),
                      ),
                      const SizedBox(
                        width: spacing_14,
                      ),
                      Flexible(
                        child: InputText(
                          leftIcon:
                              SvgPicture.asset('asset/icons/ic_edit_text.svg'),
                          textStyle: inputTextStyle,
                          controller: txtLastName,
                          hint: 'Last name',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: spacing_30,
                  )
                },
                InputText(
                  leftIcon: SvgPicture.asset('asset/icons/ic_email.svg'),
                  textStyle: inputTextStyle,
                  controller: txtEmail,
                  hint: 'Email',
                  validator: validateEmail,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: spacing_30),
                  child: InputText(
                    controller: txtPhone,
                    leftIcon: SvgPicture.asset('asset/icons/ic_call.svg'),
                    textStyle: inputTextStyle,
                    hint: 'Phone number',
                  ),
                ),
                InputPassword(
                  textStyle: inputTextStyle,
                  hint: 'Password',
                  controller: txtPassword,
                  validator: validatePassword,
                ),
                const SizedBox(
                  height: spacing_30,
                ),
                InputPassword(
                  controller: txtConfirmPassword,
                  textStyle: inputTextStyle,
                  hint: 'Confirm password',
                  validator: validateConfirmPassword,
                ),
                if (accountType == AccountType.normal) ...{
                  const SizedBox(
                    height: 100,
                  ),
                  Button(
                    radius: radius_40,
                    title: 'Sign Up',
                    onPress: () {
                      if (formKey.currentState!.validate()) {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return CEFRLevelDialog(
                                onSelectedLevel: (index) =>
                                    cefrLevel = CEFRLevels[index]!['level'],
                                buttonTitle: 'Select',
                              );
                            }).then((value) {
                          signUp();
                          // call api
                        });
                      }
                    },
                  )
                } else ...{
                  const SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        navigateChildInfo();
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(spacing_10),
                      child: Text(
                        'Next',
                        style: Theme.of(context).textTheme.headline3?.copyWith(
                            fontFamily: semiBoldFont,
                            color: AppColors.primaryColor),
                      ),
                    ),
                  )
                }
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? validateEmail(String? text) {
    if (text == null) return 'Email is required';
    return StringUtil.validateEmail(text) ? null : 'Invalid email format';
  }

  String? validatePassword(String? text) {
    if (text == null) return 'Passowrd is required';
    return StringUtil.validatePassword(text)
        ? null
        : 'Passowrd must be at least 6 characters';
  }

  String? validateConfirmPassword(String? text) {
    if (text == null) return 'Confirm Passowrd is required';
    return txtPassword.text.compareTo(txtConfirmPassword.text) == 0
        ? null
        : "The password confirmation does not match";
  }

  void signUp() {
    final data = User(
        email: txtEmail.text,
        mobile: txtPhone.text,
        password: txtPassword.text,
        firstname: txtFirstName.text,
        lastname: txtLastName.text);
    BlocProvider.of<AuthBloc>(context).add(RegisterEvent(data: data));
  }

  void navigateChildInfo() {
    final data = User(
      email: txtEmail.text,
      mobile: txtPhone.text,
      password: txtPassword.text,
    );
    Navigator.of(context)
        .pushNamed(CreatingChildAccount.route, arguments: data);
  }
}
