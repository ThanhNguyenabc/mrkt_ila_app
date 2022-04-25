import 'package:flutter/material.dart';
import 'package:mrkt_app/features/home/home_page.dart';
import 'package:mrkt_app/features/landing_page/landing_page.dart';
import 'package:mrkt_app/features/profile/profile_page.dart';
import 'package:mrkt_app/ila_routes.dart';
import 'package:mrkt_app/service_locator.dart';
import 'package:mrkt_app/utils/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDenpendencies();
  runApp(const IlaApp());
}

class IlaApp extends StatelessWidget {
  const IlaApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightAppTheme(),
      routes: IlaRoute.allRoutes(),
      initialRoute: ProfilePage.route,
    );
  }
}
