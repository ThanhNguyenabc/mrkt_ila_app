import 'package:data/data.dart';
import 'package:hive/hive.dart';

part 'app_setting_table.g.dart';

@HiveType(typeId: 2)
class AppSettingTable {
  @HiveField(1)
  final String? appearanceMode;
  @HiveField(2)
  final String? selectedLanguage;

  AppSettingTable({this.appearanceMode, this.selectedLanguage});

  AppSetting toAppSetting() {
    return AppSetting(
        appearanceMode: appearanceMode, selectedLanguage: selectedLanguage);
  }

  factory AppSettingTable.fromModel(AppSetting setting) {
    return AppSettingTable(
        appearanceMode: setting.appearanceMode,
        selectedLanguage: setting.selectedLanguage);
  }

  AppSettingTable copyWith({
    String? appearanceMode,
    String? selectedLanguage,
  }) {
    return AppSettingTable(
      appearanceMode: appearanceMode ?? this.appearanceMode,
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
    );
  }
}
