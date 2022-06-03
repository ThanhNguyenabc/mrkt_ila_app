import 'package:data/data.dart';

abstract class AppSetingRepository {
  AppSetting? getAppSetting();
  Future<void> setAppearanceMode(String mode);
}
