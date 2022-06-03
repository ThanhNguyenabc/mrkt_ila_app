import 'package:flutter/material.dart';
import 'package:mrkt_app/screens/auth/auth_route.dart';
import 'package:mrkt_app/screens/cefr_level/CEFR_level_page.dart';
import 'package:mrkt_app/screens/home/main_page.dart';
import 'package:mrkt_app/screens/landing/landing_page.dart';
import 'package:mrkt_app/screens/profile/profile_route.dart';
import 'package:mrkt_app/screens/register/register_route.dart';
import 'package:mrkt_app/widget/web_in_app.dart';

class IlaRoute {
  static Map<String, WidgetBuilder> allRoutes() {
    return {
      LandingPage.route: (_) => const LandingPage(),
      MainPage.route: (_) => const MainPage(),
      CEFRLevelPage.route: (_) => const CEFRLevelPage(),
      WebInApp.route: (context) => WebInApp(
            params:
                ModalRoute.of(context)?.settings.arguments as WebInAppParams?,
          ),
      ...registerRoutes(),
      ...authRoutes(),
      ...profileRoutes()
    };
  }
}
