import 'package:get_it/get_it.dart';
import 'package:mrkt_app/features/auth/bloc/auth_bloc.dart';
import 'package:mrkt_app/features/profile/bloc/profile_bloc.dart';

GetIt getIt = GetIt.instance;

void initDenpendencies() async {
  getIt
    ..registerFactory(() => AuthBloc())
    ..registerFactory(() => ProfileBloc());
}
