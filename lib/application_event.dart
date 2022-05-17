import 'package:equatable/equatable.dart';

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
  final Appearance mode;

  const ChangeAppearanceMode(this.mode);

  @override
  List<Object?> get props => [mode];
}
