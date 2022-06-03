import 'package:domain/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrkt_app/application_event.dart';
import 'package:mrkt_app/application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  final AppSetingRepository repository;
  ApplicationBloc({required this.repository})
      : super(ApplicationState.init(repository.getAppSetting())) {
    on<ChangeAppearanceMode>(changeTheme);
    on<ChangeLanguage>((event, emit) => emit(state.copyWith(
        languageType: event.language, locale: locales[event.language])));
  }

  changeTheme(ChangeAppearanceMode event, Emitter emit) {
    repository.setAppearanceMode(event.mode.name);
    emit(state.copyWith(appearanceMode: event.mode));
  }
}
