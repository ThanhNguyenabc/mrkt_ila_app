import 'package:flutter/material.dart';
import 'package:mrkt_app/screens/profile/widgets/appearance_mode.dart';
import 'package:mrkt_app/screens/profile/widgets/ila_info.dart';
import 'package:mrkt_app/screens/profile/widgets/language_view.dart';
import 'package:mrkt_app/screens/profile/widgets/notification_view.dart';
import 'package:mrkt_app/screens/profile/widgets/security_view.dart';
import 'package:mrkt_app/utils/constants.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);
  static const route = "/setting_page";
  final widgets = const [
    LanguageView(),
    AppearanceMode(),
    SecurityView(),
    NotificationView(),
    ILAInfo()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: SafeArea(
        child: ListView.separated(
            padding: const EdgeInsets.all(spacing_16),
            itemBuilder: (context, index) => widgets[index],
            separatorBuilder: (context, index) => const SizedBox(
                  height: spacing_16,
                ),
            itemCount: widgets.length),
      ),
    );
  }
}
