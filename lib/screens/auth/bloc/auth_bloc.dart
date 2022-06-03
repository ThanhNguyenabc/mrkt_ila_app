import 'dart:async';

import 'package:data/data.dart';
import 'package:domain/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrkt_app/screens/auth/bloc/auth_event.dart';
import 'package:mrkt_app/service_locator.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(const AuthState.initial()) {
    final data = authRepository.getCurrentAuthStatus();
    final auth = data['authStatus'];

    if (auth != null) {
      emit(state.copyWith(authStatus: auth, user: data['user']));
    }

    on<HideLandingPageEvent>(hideLandingPage);
    on<LoginEvent>(login);
    on<LogOutEvent>(logOut);
    on<RegisterEvent>(registerAccount);
    on<UpdatingAuthStatusEvent>(updateStatus);
  }
  void updateStatus(UpdatingAuthStatusEvent event, Emitter emit) {
    emit(state.copyWith(authStatus: event.status));
  }

  Future<void> login(LoginEvent event, Emitter emit) async {
    if (event.password.isEmpty || event.username.isEmpty) return;
    emit(state.copyWith(netWorkStatus: NetWorkStatus.loading));
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      final result = await authRepository.login(event.username, event.password);

      // login failed
      if (result.data != null) {
        emit(state.copyWith(
            user: result.data,
            netWorkStatus: NetWorkStatus.success,
            authStatus: AuthStatus.logged));
      } else {
        emit(state.copyWith(
          netWorkStatus: NetWorkStatus.fail,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        netWorkStatus: NetWorkStatus.fail,
      ));
    }
  }

  Future<void> logOut(LogOutEvent event, Emitter emit) async {
    try {
      await authRepository.logout();

      emit(state.copyWith(user: User(), authStatus: AuthStatus.logout));
      // localStorage.removeDataAfterLogout();
    } catch (e) {}
  }

  Future<void> registerAccount(RegisterEvent event, Emitter emit) async {
    emit(state.copyWith(netWorkStatus: NetWorkStatus.loading));
    final requestData = event.data;
    try {
      final dio = getIt.get<AppDio>();
      final response = await dio
          .postData('User_Create', requestData: {"data": requestData.toMap2()});
      final newUser = event.data.copyWith(id: response["data"]);
      // cacheLoggedUser(newUser);
      emit(state.copyWith(
          user: newUser,
          netWorkStatus: NetWorkStatus.success,
          authStatus: AuthStatus.logged));
    } catch (e) {
      emit(state.copyWith(netWorkStatus: NetWorkStatus.fail));
      print(e);
    }
  }

  Future<void> hideLandingPage(HideLandingPageEvent event, Emitter emit) async {
    authRepository.hideLandingPage();
  }
}
