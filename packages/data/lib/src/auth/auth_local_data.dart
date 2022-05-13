import 'package:data/data.dart';
import 'package:data/src/local/base_local_database.dart';
import 'package:data/src/local/tables/user_profile.dart';

const userProfileBox = "user_profile_box";
const authStatusKey = "authStatus";
const cookieKey = "cookie";
const currentUser = "current_user";
const loggedUsers = "logged_users";

class AuthLocalData extends BaseLocalDatabase<dynamic> {
  User? user;
  AuthStatus? authStatus;
  static AuthLocalData? instance;

  AuthLocalData() : super(boxName: userProfileBox) {
    instance = this;
  }

  factory AuthLocalData.getInstance() => instance ?? AuthLocalData();

  Future<Result<bool>> saveCurrentUser(User user) async {
    await put(currentUser, UserProfile.fromModel(user));
    return Result.completed(true);
  }

  Future<Result<User?>> getCurrentUser() async {
    if (user != null) return Result.completed(user);
    final data = await get(currentUser) as UserProfile?;
    if (data == null || data.user == null) return Result.error("no found");
    user = User.fromTable(data.user!);

    return Result.completed(user);
  }

  Future<Result<bool>> saveLoggedUser(User user) async {
    await put(loggedUsers, UserProfile.fromModel(user));
    return Result.completed(true);
  }

  Future<Result<String>> getCookieId() async {
    final res = await get(cookieKey);
    print(res.runtimeType);
    return Result.completed(res ?? "");
  }

  Future<Result<bool>> saveCookieId(String cookie) async {
    await put(cookieKey, cookie);
    return Result.completed(true);
  }

  Future<void> saveAuthStatus(AuthStatus authStatus) async {
    put(authStatusKey, {"index": authStatus.index, "name": authStatus.name});
    return;
  }

  Future<Result<AuthStatus?>> getAuthStatus() async {
    if (authStatus != null) return Result.completed(authStatus);
    final data = await get(authStatusKey);
    authStatus = AuthStatus.values[data?['index'] ?? 0];
    return Result.completed(authStatus);
  }

  Future<bool> hideLandingPage() async {
    saveAuthStatus(AuthStatus.login);
    return true;
  }
}
