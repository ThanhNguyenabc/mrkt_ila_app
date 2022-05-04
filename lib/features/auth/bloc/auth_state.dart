import 'package:mrkt_app/models/base_model.dart';
import 'package:mrkt_app/models/network_status.dart';
import 'package:mrkt_app/models/user.model.dart';

enum AuthStatus { initial, register, login, logged, logout }

class AuthState extends BaseModel {
  const AuthState._(
      {this.user, this.authStatus = AuthStatus.initial, this.netWorkStatus});
  const AuthState.initial() : this._();

  AuthState copyWith(
      {User? user, AuthStatus? authStatus, NetWorkStatus? netWorkStatus}) {
    return AuthState._(
      netWorkStatus: netWorkStatus ?? this.netWorkStatus,
      user: user ?? this.user,
      authStatus: authStatus ?? this.authStatus,
    );
  }

  final User? user;
  final AuthStatus authStatus;
  final NetWorkStatus? netWorkStatus;

  @override
  List<Object?> get props => [
        netWorkStatus,
        user,
        authStatus,
      ];
}
