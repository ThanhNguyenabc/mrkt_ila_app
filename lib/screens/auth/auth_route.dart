import 'package:flutter/material.dart';
import 'package:mrkt_app/screens/auth/change_password.dart';
import 'package:mrkt_app/screens/auth/forgot_password.dart';

import 'auth_page.dart';
import 'login/login_page.dart';

Map<String, Widget Function(BuildContext)> authRoutes() {
  return {
    LoginPage.route: (_) => const LoginPage(),
    AuthPage.route: (_) => const AuthPage(),
    ChangePasswordPage.route: (_) => const ChangePasswordPage(),
    ForgotPassword.route: (_) => const ForgotPassword()
  };
}
