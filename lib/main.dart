import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrkt_app/api/dio_client.dart';
import 'package:mrkt_app/features/auth/auth_page.dart';
import 'package:mrkt_app/features/auth/bloc/auth_bloc.dart';
import 'package:mrkt_app/ila_routes.dart';
import 'package:mrkt_app/local_storage.dart';
import 'package:mrkt_app/service_locator.dart';
import 'package:mrkt_app/utils/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  final prefs = await SharedPreferences.getInstance();
  LocalStorage(prefs: prefs);
  initDenpendencies();

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
    DioClient.getCookieId();
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
