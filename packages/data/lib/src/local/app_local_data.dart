import 'package:data/data.dart';
import 'package:data/src/local/base_local_database.dart';

const applicationBox = "application_box";
const authStatusKey = "authStatus";

class AppLocalData extends BaseLocalDatabase<dynamic> {
  AppLocalData() : super(boxName: applicationBox);

  Future<void> saveAuthStatus(AuthStatus authStatus) async {
    put(authStatusKey, {"index": authStatus.index, "name": authStatus.name});
    return;
  }

  Future<AuthStatus?> getAuthStatus(AuthStatus authStatus) async {
    final data = await get(authStatusKey);
    return AuthStatus.values[data['index']];
  }
}
