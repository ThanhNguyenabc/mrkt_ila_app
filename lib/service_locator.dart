import 'package:data/data.dart';
import 'package:domain/repository.dart';
import 'package:get_it/get_it.dart';
import 'package:mrkt_app/application_bloc.dart';
import 'package:mrkt_app/screens/profile/bloc/profile_bloc.dart';
import 'package:mrkt_app/screens/test_list/bloc/test_bloc.dart';
import 'screens/auth/bloc/index.dart';

GetIt getIt = GetIt.instance;

Future<void> initDenpendencies() async {
  getIt
    ..registerSingleton(AuthLocalData.getInstance())
    ..registerSingleton(AppSettingData.getInstance())
    ..registerFactory(() => AppSettingRepositoryImpl(appSettingData: getIt()))
    ..registerSingleton(
        ApplicationBloc(repository: getIt<AppSettingRepositoryImpl>()))
    ..registerSingleton(AppDio.getInstance(getIt()));

  // init repo
  getIt
    ..registerFactory(() => AuthRemoteData(getIt()))
    ..registerFactory(() =>
        AuthRepositoryImpl(getIt<AuthRemoteData>(), getIt<AuthLocalData>()));

  // init bloc
  getIt
    ..registerSingleton(AuthBloc(authRepository: getIt<AuthRepositoryImpl>()))
    ..registerFactory(() => ProfileBloc(authBloc: getIt.get<AuthBloc>()))
    ..registerFactory(() => TestListBloc());
}
