import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrkt_app/api/dio_client.dart';
import 'package:mrkt_app/features/auth/bloc/auth_event.dart';
import 'package:mrkt_app/features/auth/bloc/auth_state.dart';
import 'package:mrkt_app/local_storage.dart';
import 'package:mrkt_app/models/network_status.dart';
import 'package:mrkt_app/models/user.model.dart';
import 'package:mrkt_app/service_locator.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState.initial()) {
    final user = LocalStorage.instance().currentUser;
    final authStatus = LocalStorage.instance().authStatus;

    if (user != null || authStatus != null) {
      emit(state.copyWith(user: user, authStatus: authStatus));
    }
    on<LoginEvent>(login);
    on<LogOutEvent>(logOut);
    on<RegisterEvent>(registerAccount);
    on<UpdatingAuthStatusEvent>(updateStatus);
  }

  void updateStatus(UpdatingAuthStatusEvent event, Emitter emit) {
    emit(state.copyWith(authStatus: event.status));
  }

  void login(LoginEvent event, Emitter emit) async {
    // await DioClient.getCoookieFromNetwork();
    if (event.password.isEmpty || event.username.isEmpty) return;
    emit(state.copyWith(netWorkStatus: NetWorkStatus.loading));
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      final dio = getIt.get<DioClient>();
      Map<String, dynamic> response = await dio.request(HttpMethod.post,
          params: {'f': 'Core_Login'},
          requestData: {'user_id': event.username, 'password': event.password});
      final data = response['data'];

      // login failed
      if (data == 'no') {
        emit(state.copyWith(
          netWorkStatus: NetWorkStatus.fail,
        ));
      } else {
        print('-----Login-------');
        print(response);
        final user = User.fromMap(data);
        // save the info to the local storage
        cacheLoggedUser(user);
        emit(state.copyWith(
            user: user,
            netWorkStatus: NetWorkStatus.success,
            authStatus: AuthStatus.logged));
      }
    } catch (e) {
      print(e);
      emit(state.copyWith(
        netWorkStatus: NetWorkStatus.fail,
      ));
    }
  }

  void logOut(LogOutEvent event, Emitter emit) async {
    try {
      final dio = getIt.get<DioClient>();
      await dio.request(HttpMethod.post,
          params: {'f': 'Core_Logout'}, requestData: {});

      emit(state.copyWith(user: User(), authStatus: AuthStatus.logout));
      LocalStorage.instance().removeDataAfterLogout();
    } catch (e) {
      print(e);
    }
  }

  Future<User?> getUserInfo() async {
    try {
      final dio = getIt.get<DioClient>();
      await dio.request(HttpMethod.post,
          params: {'f': 'User_Read'}, requestData: {});

      emit(state.copyWith(user: User(), authStatus: AuthStatus.logout));
      LocalStorage.instance().removeDataAfterLogout();
    } catch (e) {
      print(e);
    }
  }

  void registerAccount(RegisterEvent event, Emitter emit) async {
    emit(state.copyWith(netWorkStatus: NetWorkStatus.loading));
    final requestData = event.data;
    try {
      final dio = getIt.get<DioClient>();
      final response = await dio.request(HttpMethod.post,
          params: {'f': 'User_Create'},
          requestData: {"data": requestData.toMap2()});
      print('register');
      print(response['data']);
      final newUser = event.data.copyWith(id: response["data"]);
      cacheLoggedUser(newUser);
      emit(state.copyWith(
          user: newUser,
          netWorkStatus: NetWorkStatus.success,
          authStatus: AuthStatus.logged));
    } catch (e) {
      emit(state.copyWith(netWorkStatus: NetWorkStatus.fail));
      print(e);
    }
  }

  void cacheLoggedUser(User user) {
    try {
      //save the auth status
      LocalStorage.instance().saveAuthStatus(AuthStatus.logged);
      // save current user
      LocalStorage.instance().saveCurrentUser(user);
      // save list logged user
      LocalStorage.instance().saveUserList(user);
    } catch (e) {
      print("adsasdas");
      print(e);
    }
  }
}
