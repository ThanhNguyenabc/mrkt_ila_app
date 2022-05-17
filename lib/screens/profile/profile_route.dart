import 'package:flutter/material.dart';
import 'package:mrkt_app/screens/profile/profile_page.dart';
import 'package:mrkt_app/screens/profile/profile_update.dart';
import 'package:mrkt_app/screens/profile/setting_page.dart';
import 'package:mrkt_app/screens/auth/change_password.dart';

Map<String, Widget Function(BuildContext)> profileRoutes() {
  return {
    ProfilePage.route: (_) => const ProfilePage(),
    ProfileUpdate.route: (_) => const ProfileUpdate(),
    SettingPage.route: (_) => const SettingPage(),
  };
}
