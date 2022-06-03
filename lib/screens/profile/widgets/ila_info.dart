import 'package:flutter/material.dart';
import 'package:mrkt_app/utils/app_colors.dart';
import 'package:mrkt_app/utils/constants.dart';
import 'package:mrkt_app/widget/border_view.dart';
import 'package:mrkt_app/widget/bottom_action_sheet.dart';

class ILAInfo extends StatelessWidget {
  const ILAInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.headline5;
    final widgets = [
      Text(
        "ILA App Information",
        style: Theme.of(context)
            .textTheme
            .headline3
            ?.copyWith(fontWeight: FontWeight.w600),
      ),
      Text(
        "FAQ",
        style: textTheme,
      ),
      Text(
        "Report a problem",
        style: textTheme,
      ),
      const VersionItem(version: "1.0.0"),
      const AppInfo(),
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onDeleteAccount(context),
        child: Text(
          "Delete account",
          style: textTheme?.copyWith(
            decoration: TextDecoration.underline,
            // color: AppColors.getColorByKey("settingLinks"),
          ),
        ),
      )
    ];
    return BorderView(
      backgroundColor: Theme.of(context).colorScheme.commonColor,
      padding: const EdgeInsets.all(spacing_10),
      child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => widgets[index],
          separatorBuilder: (context, index) => index == 0
              ? const SizedBox(
                  height: spacing_24,
                )
              : const Divider(
                  height: spacing_30,
                ),
          itemCount: widgets.length),
    );
  }

  void onDeleteAccount(BuildContext context) {
    showBottomAction(context, [
      ActionSheetItem(
          titleStyle: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(fontFamily: lightFont, color: Colors.black),
          title: 'Are you sure you want to delete this account?'),
      ActionSheetItem(
        onPress: () {
          // BlocProvider.of<AuthBloc>(context).add(LogOutEvent());
        },
        title: 'Delete account',
        textColor: AppColors.red,
      )
    ]);
  }
}

class VersionItem extends StatelessWidget {
  final String version;

  const VersionItem({Key? key, required this.version}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            "Version",
            style: textTheme.headline5,
          ),
        ),
        Text(
          version,
          style: textTheme.headline6?.copyWith(
            fontWeight: FontWeight.w300,
            // color: AppColors.getColorByKey("settingLinks"),
          ),
        ),
      ],
    );
  }
}

class AppInfo extends StatelessWidget {
  const AppInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "App info",
          style: Theme.of(context).textTheme.headline5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: spacing_10),
          child: GestureDetector(
            child: Text(
              "Privacy policy",
              style: Theme.of(context).textTheme.headline6?.copyWith(
                  // color: AppColors.getColorByKey("settingLinks"),
                  decoration: TextDecoration.underline),
            ),
          ),
        ),
        GestureDetector(
          child: Text(
            "Terms and conditions",
            style: Theme.of(context).textTheme.headline6?.copyWith(
                // color: AppColors.getColorByKey("settingLinks"),
                decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}
