import 'package:flutter/material.dart';
import 'package:mrkt_app/features/auth/auth_page.dart';
import 'package:mrkt_app/features/auth/login/login_page.dart';

Map<String, Widget Function(BuildContext)> authRoutes() {
  return {
    LoginPage.route: (_) => const LoginPage(),
    AuthPage.route: (_) => const AuthPage(),
  };
}
