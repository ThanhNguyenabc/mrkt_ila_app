import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrkt_app/screens/auth/bloc/index.dart';
import 'package:mrkt_app/screens/profile/bloc/profile_event.dart';
import 'package:mrkt_app/screens/profile/bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthBloc authBloc;
  late StreamSubscription<AuthState> authListener;
  ProfileBloc({required this.authBloc})
      : super(ProfileState.initial(authBloc.state.user)) {
    print("init profile");

    authListener = authBloc.stream.listen((newState) {
      if (newState.user != state.user) {
        emit(state.copyWith(user: newState.user));
      }
    });
  }

  @override
  Future<void> close() {
    authListener.cancel();
    return super.close();
  }
}
