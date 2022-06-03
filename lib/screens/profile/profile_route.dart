import 'package:flutter/material.dart';
import 'package:mrkt_app/screens/profile/profile_page.dart';
import 'package:mrkt_app/screens/profile/profile_update.dart';
import 'package:mrkt_app/screens/profile/setting_page.dart';

Map<String, Widget> profileRoutes(RouteSettings settings) {
  return {
    ProfilePage.route: const ProfilePage(),
    ProfileUpdate.route: const ProfileUpdate(),
    SettingPage.route: const SettingPage(),
  };
}
