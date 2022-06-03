import 'package:data/data.dart';
import 'package:domain/src/app_setting/app_setting_repository.dart';

class AppSettingRepositoryImpl extends AppSetingRepository {
  final AppSettingData appSettingData;
  AppSettingRepositoryImpl({
    required this.appSettingData,
  });

  @override
  Future<void> setAppearanceMode(String mode) =>
      appSettingData.saveAppearanceMode(mode);

  @override
  AppSetting? getAppSetting() {
    return appSettingData.settings;
  }
}
