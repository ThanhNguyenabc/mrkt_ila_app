import 'package:flutter/material.dart';
import 'package:mrkt_app/screens/auth/change_password.dart';
import 'package:mrkt_app/screens/auth/forgot_password.dart';

import 'auth_page.dart';
import 'login/login_page.dart';

Map<String, Widget > authRoutes(RouteSettings settings) {
  return {
    LoginPage.route: const LoginPage(),
    AuthPage.route:  const AuthPage(),
    ChangePasswordPage.route: ChangePasswordPage(),
    ForgotPassword.route: const ForgotPassword()
  };
}
