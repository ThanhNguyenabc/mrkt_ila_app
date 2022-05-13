import 'package:flutter/material.dart';
import 'package:mrkt_app/screens/register/create_account.dart';
import 'package:mrkt_app/screens/register/create_child_account.dart';
import 'package:mrkt_app/screens/register/register_account_type.dart';


Map<String, Widget Function(BuildContext)> registerRoutes() {
  return {
    RegisterAccountType.route: (_) => const RegisterAccountType(),
    CreatingAccount.route: (_) => const CreatingAccount(),
    CreatingChildAccount.route: (_) => const CreatingChildAccount()
  };
}
