import 'package:hive/hive.dart';

class DatabaseUtil {
  static void registerAdapter<Type>(TypeAdapter<Type> adapter) {
    try {
      Hive.registerAdapter(adapter);
    } on HiveError catch (error) {
      print(error);
    }
  }
}
