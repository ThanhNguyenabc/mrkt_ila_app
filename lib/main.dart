import 'dart:convert';

import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrkt_app/ila_routes.dart';
import 'package:mrkt_app/screens/auth/auth_page.dart';
import 'package:mrkt_app/screens/auth/bloc/index.dart';
import 'package:mrkt_app/service_locator.dart';
import 'package:mrkt_app/utils/app_theme.dart';

Map<String, dynamic>? safeParse(String? source) {
  if (source == null) return null;
  try {
    return jsonDecode(source);
  } catch (e) {
    return null;
  }
}

GlobalKey<NavigatorState> appNavigator = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDatabase();
  await initDenpendencies();
  runApp(const IlaApp());
}

class IlaApp extends StatefulWidget {
  const IlaApp({Key? key}) : super(key: key);

  @override
  State<IlaApp> createState() => _IlaAppState();
}

class _IlaAppState extends State<IlaApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => getIt<AuthBloc>())],
      child: MaterialApp(
          navigatorKey: appNavigator,
          theme: lightAppTheme(),
          routes: IlaRoute.allRoutes(),
          initialRoute: AuthPage.route),
    );
  }
}
