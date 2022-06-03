import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrkt_app/screens/home/main_page.dart';
import 'package:mrkt_app/screens/landing/landing_page.dart';
import 'package:mrkt_app/screens/register/create_account.dart';

import 'bloc/auth_bloc.dart';
import 'bloc/auth_state.dart';
import 'login/login_page.dart';

class AuthPageParams {
  AuthStatus? status;
  AuthPageParams({
    this.status,
  });
}

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key, this.params}) : super(key: key);
  static const route = '/';
  final AuthPageParams? params;
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  Map<AuthStatus, Widget> screens = {
    AuthStatus.initial: const LandingPage(),
    AuthStatus.logged: const MainPage(),
    AuthStatus.login: const LoginPage(),
    AuthStatus.logout: const LoginPage(),
    AuthStatus.register: const CreatingAccount(),
  };

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);

    return BlocBuilder<AuthBloc, AuthState>(
      bloc: authBloc,
      buildWhen: (previous, current) =>
          previous.authStatus != current.authStatus,
      builder: (context, state) {
        return screens[state.authStatus] ?? screens[AuthStatus.login]!;
      },
    );
  }
}
