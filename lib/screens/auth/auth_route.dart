import 'package:flutter/material.dart';
import 'package:mrkt_app/screens/auth/change_password.dart';
import 'package:mrkt_app/screens/auth/forgot_password.dart';

import 'auth_page.dart';
import 'login/login_page.dart';

Map<String, WidgetBuilder> authRoutes() {
  return {
    LoginPage.route: (context) => const LoginPage(),
    AuthPage.route: (context) => const AuthPage(),
    ChangePasswordPage.route: (context) => const ChangePasswordPage(),
    ForgotPassword.route: (context) => const ForgotPassword()
  };
}
