import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mrkt_app/screens/auth/change_password.dart';
import 'package:mrkt_app/utils/constants.dart';
import 'package:mrkt_app/widget/border_view.dart';
import 'package:mrkt_app/widget/custom_switch.dart';

class SecurityView extends StatelessWidget {
  const SecurityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BorderView(
      padding: const EdgeInsets.all(spacing_10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Password and security",
            style: Theme.of(context)
                .textTheme
                .headline3
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: spacing_24,
                left: spacing_20,
                right: spacing_20,
                bottom: spacing_16),
            child: GestureDetector(
              onTap: () => changePassword(context),
              behavior: HitTestBehavior.opaque,
              child: Row(children: [
                SvgPicture.asset('asset/icons/ic_change_pw.svg'),
                const SizedBox(
                  width: spacing_20,
                ),
                Text("Change password",
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(fontWeight: FontWeight.w400)),
                const Spacer(),
                SvgPicture.asset('asset/icons/ic_chevron_next.svg'),
              ]),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(
                top: spacing_16,
                left: spacing_20,
                right: spacing_16,
                bottom: spacing_10),
            child: Row(children: [
              SvgPicture.asset('asset/icons/ic_face_id.svg'),
              const SizedBox(
                width: spacing_20,
              ),
              Text("Login with Fade ID",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(fontWeight: FontWeight.w400)),
              const Spacer(),
              CustomSwitch(onChangeValue: (value) {})
            ]),
          )
        ],
      ),
    );
  }

  changePassword(BuildContext context) =>
      Navigator.of(context).pushNamed(ChangePasswordPage.route);
}
