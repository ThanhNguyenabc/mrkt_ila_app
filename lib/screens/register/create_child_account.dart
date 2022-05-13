import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrkt_app/screens/auth/auth_page.dart';
import 'package:mrkt_app/screens/auth/bloc/index.dart';
import 'package:mrkt_app/screens/register/child_info_item.dart';
import 'package:mrkt_app/utils/app_colors.dart';
import 'package:mrkt_app/utils/constants.dart';
import 'package:mrkt_app/widget/button.dart';
import 'package:mrkt_app/widget/gradient_backgound.dart';
import 'package:mrkt_app/widget/loading_dialog.dart';

class CreatingChildAccount extends StatefulWidget {
  const CreatingChildAccount({Key? key}) : super(key: key);
  static const route = "/creating_child_account";
  @override
  State<CreatingChildAccount> createState() => _CreatingChildAccountState();
}

class _CreatingChildAccountState extends State<CreatingChildAccount> {
  Map<int, User> listChildInfo = {};

  @override
  Widget build(BuildContext context) {
    var userInfo = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Child Info',
          style: Theme.of(context)
              .appBarTheme
              .titleTextStyle
              ?.copyWith(color: AppColors.kleinBlue),
        ),
      ),
      body: GradientBackground(
          child: Padding(
        padding: const EdgeInsets.all(spacing_16),
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
            Flexible(
                flex: 3,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ChildInfoItem(
                        onUserInfoChanged: (user) {
                          print(user.birthday);
                          print(user.nickname);
                          userInfo.birthday = user.birthday;
                          userInfo.cefrlevel = user.cefrlevel;
                          userInfo.nickname = user.nickname;
                          userInfo.lastname = user.lastname;
                          userInfo.firstname = user.firstname;
                        },
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          height: spacing_16,
                        ),
                    itemCount: 1)),
            const SizedBox(
              height: 100,
            ),
            Button(
                radius: radius_40,
                title: 'Sign Up',
                onPress: () {
                  BlocProvider.of<AuthBloc>(context)
                      .add(RegisterEvent(data: userInfo));
                }),
            const Spacer(
              flex: 2,
            )
          ],
        ),
      )),
    );
  }
}
