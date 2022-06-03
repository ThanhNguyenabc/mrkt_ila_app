import 'package:flutter/material.dart';
import 'package:mrkt_app/screens/register/create_account.dart';
import 'package:mrkt_app/screens/register/create_child_account.dart';
import 'package:mrkt_app/screens/register/register_account_type.dart';

Map<String, Widget> registerRoutes(RouteSettings settings) {
  return {
    RegisterAccountType.route: const RegisterAccountType(),
    CreatingAccount.route: const CreatingAccount(),
    CreatingChildAccount.route: const CreatingChildAccount()
  };
}
