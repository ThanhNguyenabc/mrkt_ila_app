import 'package:flutter/material.dart';
import 'package:mrkt_app/screens/profile/profile_page.dart';
import 'package:mrkt_app/screens/profile/profile_update.dart';
import 'package:mrkt_app/screens/profile/setting_page.dart';

Map<String, WidgetBuilder> profileRoutes() {
  return {
    ProfilePage.route: (_) => const ProfilePage(),
    ProfileUpdate.route: (_) => const ProfileUpdate(),
    SettingPage.route: (_) => const SettingPage(),
  };
}
