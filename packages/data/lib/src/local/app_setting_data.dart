import 'package:data/data.dart';
import 'package:data/src/local/base_local_database.dart';

const appSettingbox = "app_setting_box";
const appearanceMode = "appearanceMode";
const selectedLanguage = "selectedLanguage";

class AppSettingData extends BaseLocalDatabase<dynamic> {
  AppSettingData() : super(boxName: appSettingbox) {
    instance = this;
  }
  AppSetting? settings;
  static AppSettingData? instance;

  factory AppSettingData.getInstance() => instance ?? AppSettingData();

  Future<void> saveAppearanceMode(String mode) async {
    settings?.copyWith(appearanceMode: mode);
    await put(appearanceMode, mode);
    final result = await get(appearanceMode);
    print("save storage");
    print(result);
    return;
  }

  Future<AppSetting?> getAppSetting() async {
    print("get setting");
    if (settings != null) return settings;
    try {
      final data = await getAll();
      settings = AppSetting.fromMap(data);
      print("get data");
      print(data);
      return settings;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
