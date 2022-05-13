// import 'dart:convert';

// import 'package:shared_preferences/shared_preferences.dart';

// import '../../data.dart';

// class SharePrefsStorage {
//   static const hideLandingPage = "isShowLandPage";
//   static const cookie = "cookie";


//   static const currentUserKey = "currentUser";
//   static const loggedUsers = "loggedUsers";

//   static const authStatusKey = "authStatus";

//   final SharedPreferences prefs;
//   static late SharePrefsStorage _instance;
//   Map<String, Map> loggedUserMap;
//   AuthStatus? authStatus;

//   User? currentUser;

//   SharePrefsStorage(
//       {required this.prefs, this.loggedUserMap = const {}, this.authStatus}) {
//     _instance = this;
//     getUser();
//     getAllLoggedUser();
//     getAuthStatus();
//   }

//   factory SharePrefsStorage.instance() => _instance;

//   setHideLandingPage() {
//     saveAuthStatus(AuthStatus.login);
//   }

//   bool? isHideLandingPage() => prefs.getBool(SharePrefsStorage.hideLandingPage);

//   saveAuthStatus(AuthStatus status) {
//     authStatus = status;
//     prefs.setString(SharePrefsStorage.authStatusKey,
//         jsonEncode({"index": status.index, "name": status.name}));
//   }

//   AuthStatus? getAuthStatus() {
//     if (authStatus != null) return authStatus;
//     try {
//       final authStatusStr = prefs.getString(SharePrefsStorage.authStatusKey);
//       final authMap = safeParse(authStatusStr) ?? {};
//       final status = AuthStatus.values[authMap['index']];
//       authStatus = status;
//       print('get auth');
//       print(authStatus);
//       return authStatus;
//     } catch (e) {
//       return null;
//     }
//   }

//   User? getUser() {
//     if (currentUser != null) return currentUser;
//     final userJson = prefs.getString(currentUserKey);
//     if (userJson == null) return null;
//     currentUser = User.fromMap(safeParse(userJson)!);
//     return currentUser;
//   }

//   Future<bool> saveCurrentUser(User user) {
//     currentUser = user;
//     return SharePrefsStorage.instance()
//         .prefs
//         .setString(SharePrefsStorage.currentUserKey, user.toJson());
//   }

//   void removeDataAfterLogout() {
//     currentUser = null;
//     authStatus = AuthStatus.logout;
//     saveAuthStatus(AuthStatus.logout);
//   prefs.remove(currentUserKey);
//   }

//   Future<void> saveUserList(User user) async {
//     print("save user !");
//     try {
//       final userId = user.id ?? '';
//       final allUsers = await getAllLoggedUser();

//       if (!allUsers.containsKey(userId)) {
//         allUsers.putIfAbsent(userId, () => user.toMap3());
//         prefs.setString(SharePrefsStorage.loggedUsers, jsonEncode(allUsers));
//       }
//     } catch (e) {
//       print('save failed');
//     }
//   }

//   Future<Map<String, Map>> getAllLoggedUser() async {
//     print('get all');
//     if (loggedUserMap.isNotEmpty) return loggedUserMap;
//     final loggedUserStr = prefs.getString(SharePrefsStorage.loggedUsers);

//     final Map<String, Map> data =
//         loggedUserStr == null ? {} : Map.castFrom(jsonDecode(loggedUserStr));

//     loggedUserMap = data;
//     return loggedUserMap;
//   }
// }
