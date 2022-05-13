import 'package:flutter/material.dart';

import 'auth_page.dart';
import 'login/login_page.dart';


Map<String, Widget Function(BuildContext)> authRoutes() {
  return {
    LoginPage.route: (_) => const LoginPage(),
    AuthPage.route: (_) => const AuthPage(),
  };
}
