import 'package:flutter/material.dart';
import 'package:mrkt_app/utils/app_colors.dart';
import 'package:mrkt_app/utils/constants.dart';
import 'package:mrkt_app/widget/border_view.dart';
import 'package:mrkt_app/widget/custom_switch.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BorderView(
        backgroundColor: Theme.of(context).colorScheme.commonColor,
      padding: const EdgeInsets.only(
          top: spacing_14,
          bottom: spacing_14,
          left: spacing_10,
          right: spacing_24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Notifications",
            style: Theme.of(context)
                .textTheme
                .headline3
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          CustomSwitch(onChangeValue: (value) {})
        ],
      ),
    );
  }
}
