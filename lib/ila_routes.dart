import 'package:flutter/material.dart';
import 'package:mrkt_app/features/auth/auth_route.dart';
import 'package:mrkt_app/features/home/main_page.dart';
import 'package:mrkt_app/features/landing_page/landing_page.dart';
import 'package:mrkt_app/features/profile/profile_route.dart';
import 'package:mrkt_app/features/register/register_route.dart';

class IlaRoute {
  static Map<String, Widget Function(BuildContext)> allRoutes() {
    return {
      LandingPage.route: (_) => const LandingPage(),
      MainPage.route: (_) => const MainPage(),
      ...registerRoutes(),
      ...authRoutes(),
      ...profileRoutes()
    };
  }
}
