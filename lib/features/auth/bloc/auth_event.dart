import 'package:mrkt_app/features/auth/bloc/auth_state.dart';
import 'package:mrkt_app/models/base_model.dart';
import 'package:mrkt_app/models/user.model.dart';

abstract class AuthEvent extends BaseModel {}

class LoginEvent extends AuthEvent {
  final String username;
  final String password;

  LoginEvent({
    required this.username,
    required this.password,
  });
  @override
  List<Object?> get props => [username, password];
}

class UpdatingAuthStatusEvent extends AuthEvent {
  final AuthStatus status;
  UpdatingAuthStatusEvent({
    required this.status,
  });

  @override
  List<Object?> get props => [status];
}

class LogOutEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class RegisterEvent extends AuthEvent {
  final User data;
  RegisterEvent({
    required this.data,
  });
  @override
  List<Object?> get props => [data];
}
