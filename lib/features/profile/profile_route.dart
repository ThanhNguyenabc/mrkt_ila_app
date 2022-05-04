import 'package:flutter/material.dart';
import 'package:mrkt_app/features/profile/profile_page.dart';
import 'package:mrkt_app/features/profile/profile_update.dart';

Map<String, Widget Function(BuildContext)> profileRoutes() {
  return {
    ProfilePage.route: (_) => const ProfilePage(),
    ProfileUpdate.route: (_) => const ProfileUpdate()
  };
}
