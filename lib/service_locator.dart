import 'package:get_it/get_it.dart';
import 'package:mrkt_app/api/dio_client.dart';
import 'package:mrkt_app/features/auth/bloc/auth_bloc.dart';
import 'package:mrkt_app/features/profile/bloc/profile_bloc.dart';

GetIt getIt = GetIt.instance;

void initDenpendencies() async {
  getIt
    ..registerSingleton(DioClient.instance())
    ..registerSingleton(AuthBloc())
    ..registerFactory(() => ProfileBloc(authBloc: getIt.get<AuthBloc>()));
}
