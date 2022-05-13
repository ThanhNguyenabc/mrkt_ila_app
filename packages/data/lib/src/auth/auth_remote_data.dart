import 'package:data/data.dart';

class AuthRemoteData {
  final AppDio appDio;

  AuthRemoteData(this.appDio);

  Future<Result<User>> login(String username, String password) async {
    try {
      Map<String, dynamic> response = await appDio.postData('Core_Login',
          requestData: {'user_id': username, 'password': password});
      final data = response['data'];
      print("abc");
      print(data);
      // login failed
      if (data == null || data == 'no') {
        return Result.error("No found user");
      } else {
        return Result.completed(User.fromMap(data));
      }
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<bool>> logout() async {
    try {
      await appDio.postData('Core_Logout');
      return Result.completed(true);
    } catch (e) {
      print(e);
    }

    return Result.completed(false);
  }

  Future<Result<User>> registerNewAccount(User user) async {
    try {
      final response = await appDio
          .postData('User_Create', requestData: {"data": user.toMap2()});
      //return user id
      final newUser = user.copyWith(id: response["data"]);
      return Result.completed(newUser);
    } catch (e) {
      print(e);
    }

    return Result.error('Register fail');
  }
}
