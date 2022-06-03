import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum Language { vi, en }

enum Appearance { light, dark }

abstract class ApplicationEvent extends Equatable {
  const ApplicationEvent();
}

class ChangeLanguage extends ApplicationEvent {
  final Language language;

  const ChangeLanguage(this.language);

  @override
  List<Object?> get props => [language];
}

class ChangeAppearanceMode extends ApplicationEvent {
  final ThemeMode mode;

  const ChangeAppearanceMode(this.mode);

  @override
  List<Object?> get props => [mode];
}
