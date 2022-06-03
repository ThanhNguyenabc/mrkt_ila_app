import 'dart:convert';

import 'package:data/data.dart';

class AppSetting extends BaseModel {
  final String? appearanceMode;
  final String? selectedLanguage;
  AppSetting({
    this.appearanceMode,
    this.selectedLanguage,
  });

  @override
  List<Object?> get props => [appearanceMode, selectedLanguage];

  AppSetting copyWith({
    String? appearanceMode,
    String? selectedLanguage,
  }) {
    return AppSetting(
      appearanceMode: appearanceMode ?? this.appearanceMode,
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'appearanceMode': appearanceMode,
      'selectedLanguage': selectedLanguage,
    };
  }

  factory AppSetting.fromMap(Map<dynamic, dynamic> map) {
    return AppSetting(
      appearanceMode: map['appearanceMode'],
      selectedLanguage: map['selectedLanguage'],
    );
  }
}
