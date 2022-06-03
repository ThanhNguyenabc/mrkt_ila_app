/// Support for doing something awesome.
///
/// More dartdocs go here.
library data;

import 'dart:convert';

import 'package:data/src/auth/index.dart';
import 'package:data/src/local/app_setting_data.dart';
import 'package:data/src/local/tables/user_profile.dart';
import 'package:data/src/local/tables/user_table.dart';
import 'package:data/utils/database_util.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

export 'src/remote/app_dio.dart';
export 'src/models/models.dart';
export 'src/auth/index.dart';

export './src/local/app_setting_data.dart';

Map<String, dynamic>? safeParse(String? source) {
  if (source == null) return null;
  try {
    return jsonDecode(source);
  } catch (e) {
    return null;
  }
}

Future<void> initDatabase() async {
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  DatabaseUtil.registerAdapter(UserProfileAdapter());
  DatabaseUtil.registerAdapter(UserTableAdapter());
  await Future.wait([
    AuthLocalData.getInstance().getAuthStatus(),
    AuthLocalData.getInstance().getCurrentUser(),
    AppSettingData.getInstance().getAppSetting()
  ]);
  return;
}
