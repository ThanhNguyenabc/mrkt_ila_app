import 'dart:convert';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mrkt_app/application_bloc.dart';
import 'package:mrkt_app/application_state.dart';
import 'package:mrkt_app/ila_routes.dart';
import 'package:mrkt_app/screens/auth/auth_page.dart';
import 'package:mrkt_app/screens/auth/bloc/index.dart';
import 'package:mrkt_app/service_locator.dart';
import 'package:mrkt_app/utils/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      providers: [
        BlocProvider(create: (_) => getIt<AuthBloc>()),
        BlocProvider(create: (_) => getIt<ApplicationBloc>()),
      ],
      child: BlocBuilder<ApplicationBloc, ApplicationState>(
          buildWhen: (previous, current) =>
              previous.appearanceMode != current.appearanceMode ||
              previous.languageType != current.languageType,
          builder: (context, state) {
            return MaterialApp(
                navigatorKey: appNavigator,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                supportedLocales: const [
                  Locale('en', 'EN'),
                  Locale('vi', 'VI'),
                ],
                locale: state.currentLocale,
                theme: IlaAppTheme.lightTheme,
                darkTheme: IlaAppTheme.darkTheme,
                themeMode: state.appearanceMode,
                routes: IlaRoute.allRoutes(),
                initialRoute: AuthPage.route
                // home: TestWidget(),
                );
          }),
    );
  }
}
