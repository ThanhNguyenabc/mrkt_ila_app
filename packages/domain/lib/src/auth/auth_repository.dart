import 'package:data/data.dart';

abstract class AuthRepository {
  Future<Result<User>> login(String username, String password);
  Future<Result<bool>> logout();
  Future<Result<User>> registerNewUser(User user);
  Future<Result<User?>> getUserFromLocal();
  Map getCurrentAuthStatus();
  Future<bool> hideLandingPage();
}
