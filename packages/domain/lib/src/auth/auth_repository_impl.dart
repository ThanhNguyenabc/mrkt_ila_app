import 'package:data/data.dart';
import 'package:domain/repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthLocalData authLocalData;
  final AuthRemoteData authRemoteData;

  AuthRepositoryImpl(this.authRemoteData, this.authLocalData);

  @override
  Future<Result<bool>> logout() async {
    return authRemoteData.logout();
  }

  @override
  Future<Result<User>> login(String username, String password) async {
    final result = await authRemoteData.login(username, password);
    if (result.data != null) cacheUser(result.data!);
    return result;
  }

  @override
  Future<Result<User>> registerNewUser(User user) async {
    final res = await authRemoteData.registerNewAccount(user);
    if (res.data != null) cacheUser(res.data!);
    return res;
  }

  @override
  Future<Result<User?>> getUserFromLocal() {
    return authLocalData.getCurrentUser();
  }

  Future<void> cacheUser(User user) {
    authLocalData.saveAuthStatus(AuthStatus.logged);
    return authLocalData.saveCurrentUser(user);
  }

  @override
  Future<bool> hideLandingPage() async {
    return authLocalData.hideLandingPage();
  }

  @override
  Map getCurrentAuthStatus() {
    return {
      "authStatus": authLocalData.authStatus,
      "user": authLocalData.user,
    };
  }
}
