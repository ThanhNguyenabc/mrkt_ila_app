import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mrkt_app/screens/auth/bloc/index.dart';
import 'package:mrkt_app/screens/profile/bloc/profile_bloc.dart';
import 'package:mrkt_app/screens/profile/bloc/profile_state.dart';
import 'package:mrkt_app/screens/profile/profile_cefr_level.dart';
import 'package:mrkt_app/screens/profile/profile_header.dart';
import 'package:mrkt_app/screens/profile/setting_page.dart';
import 'package:mrkt_app/service_locator.dart';
import 'package:mrkt_app/utils/app_colors.dart';
import 'package:mrkt_app/utils/constants.dart';
import 'package:mrkt_app/widget/border_view.dart';
import 'package:mrkt_app/widget/bottom_action_sheet.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const route = "/profile_page";

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final widgets = [
      const ProfileHeader(),
      const ProfileCEFRLevel(
        currentLevelIndex: 3,
      ),
      const LogOutBtn()
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(spacing_16),
        child: BlocProvider(
          create: (_) => getIt<ProfileBloc>(),
          child: Column(
            children: [
              GestureDetector(
                // onTap: () => showBottomUserList(context),
                behavior: HitTestBehavior.opaque,
                child: Row(
                  children: [
                    BlocBuilder<ProfileBloc, ProfileState>(
                        builder: (context, state) {
                      return Text(
                        state.user?.getFullName() ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(fontFamily: semiBoldFont),
                      );
                    }),
                    const SizedBox(
                      width: spacing_10,
                    ),
                    SvgPicture.asset(
                      'asset/icons/ic_chevron_down.svg',
                      color: Theme.of(context).iconTheme.color,
                    ),
                    const Spacer(),
                    GestureDetector(
                        onTap: () =>
                            Navigator.of(context).pushNamed(SettingPage.route),
                        child: SvgPicture.asset(
                          'asset/icons/ic_setting.svg',
                          color: Theme.of(context).iconTheme.color,
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: spacing_14,
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return widgets[index];
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          height: spacing_16,
                        ),
                    itemCount: widgets.length),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showBottomUserList(BuildContext context) {
    // final allUser = SharePrefsStorage.instance().loggedUserMap;
    // final List<Widget> loggedUser = [];

    // allUser.forEach((key, value) {
    //   final isCurrentUser =
    //       SharePrefsStorage.instance().currentUser?.id == value['id'];
    //   loggedUser.add(UserItem(
    //     isCurrentLogin: isCurrentUser,
    //     onPress: () {
    //       BlocProvider.of<AuthBloc>(context).add(
    //           LoginEvent(username: value['id'], password: value['password']));
    //       Navigator.of(context).maybePop();
    //     },
    //     title: '${value['firstname']} ${value['lastname']}',
    //     iconPath: 'asset/icons/ic_user.svg',
    //   ));
    // });
    // loggedUser.add(UserItem(
    //   onPress: () {
    //     Navigator.of(context).maybePop();
    //     BlocProvider.of<AuthBloc>(context).add(LogOutEvent());
    //   },
    //   title: 'Add new account',
    //   iconPath: 'asset/icons/ic_add_new.svg',
    // ));

    // showModalBottomSheet(
    //     constraints: const BoxConstraints(maxHeight: 400),
    //     context: context,
    //     builder: (context) {
    //       return Padding(
    //         padding: const EdgeInsets.only(bottom: 50),
    //         child: ListView.separated(
    //             padding: const EdgeInsets.symmetric(
    //                 horizontal: spacing_24, vertical: spacing_30),
    //             itemBuilder: (context, index) {
    //               return loggedUser[index];
    //             },
    //             separatorBuilder: (_, index) => const SizedBox(
    //                   height: spacing_40,
    //                 ),
    //             itemCount: loggedUser.length),
    //       );
    //     });
  }
}

class LogOutBtn extends StatelessWidget {
  const LogOutBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.commonColor;
    print("render log out btn");
    return GestureDetector(
      onTap: () {
        showBottomAction(context, [
          ActionSheetItem(
              titleStyle: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontFamily: lightFont, color: Colors.black),
              title: 'Are you sure you want to log out?'),
          ActionSheetItem(
            onPress: () {
              BlocProvider.of<AuthBloc>(context).add(LogOutEvent());
            },
            title: 'Log out',
            textColor: AppColors.red,
          )
        ]);
      },
      child: BorderView(
        padding: const EdgeInsets.symmetric(vertical: spacing_12),
        backgroundColor: textColor,
        child: Center(
            child: Text(
          'Log out',
          style: Theme.of(context)
              .textTheme
              .headline3
              ?.copyWith(fontFamily: mediumFont, color: Theme.of(context).colorScheme.primaryTextColor),
        )),
      ),
    );
  }
}
