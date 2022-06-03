import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:data/data.dart';
import 'package:mrkt_app/application_event.dart';

const locales = {
  Language.en: Locale('en', 'EN'),
  Language.vi: Locale('vi', 'VI'),
};

class ApplicationState extends Equatable {
  final Language languageType;
  final Locale currentLocale;
  final ThemeMode appearanceMode;

  const ApplicationState._(
      {this.languageType = Language.en,
      this.currentLocale = const Locale('en', 'EN'),
      this.appearanceMode = ThemeMode.light});

  ApplicationState.init(AppSetting? setting)
      : this._(
            appearanceMode: setting?.appearanceMode == ThemeMode.dark.name
                ? ThemeMode.dark
                : ThemeMode.light);

  ApplicationState copyWith(
          {Language? languageType,
          ThemeMode? appearanceMode,
          Locale? locale}) =>
      ApplicationState._(
        currentLocale: locale ?? currentLocale,
        languageType: languageType ?? this.languageType,
        appearanceMode: appearanceMode ?? this.appearanceMode,
      );

  @override
  List<Object?> get props => [languageType, appearanceMode];
}
