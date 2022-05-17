import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrkt_app/application_event.dart';
import 'package:mrkt_app/application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(const ApplicationState.init()) {
    on<ChangeAppearanceMode>(
        (event, emit) => emit(state.copyWith(appearanceMode: event.mode)));
    on<ChangeLanguage>((event, emit) => emit(state.copyWith(
        languageType: event.language, locale: locales[event.language])));
  }
}
