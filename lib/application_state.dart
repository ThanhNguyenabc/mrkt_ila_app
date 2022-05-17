import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:mrkt_app/application_event.dart';

const locales = {
  Language.en: Locale('en', 'EN'),
  Language.vi: Locale('vi', 'VI'),
};

class ApplicationState extends Equatable {
  final Language languageType;
  final Locale currentLocale;
  final Appearance appearanceMode;

  const ApplicationState.init(
      {this.languageType = Language.en,
      this.currentLocale = const Locale('en', 'EN'),
      this.appearanceMode = Appearance.light});

  ApplicationState copyWith(
          {Language? languageType,
          Appearance? appearanceMode,
          Locale? locale}) =>
      ApplicationState.init(
        currentLocale: locale ?? currentLocale,
        languageType: languageType ?? this.languageType,
        appearanceMode: appearanceMode ?? this.appearanceMode,
      );

  @override
  List<Object?> get props => [languageType, appearanceMode];
}
