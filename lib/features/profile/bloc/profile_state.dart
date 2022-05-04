import 'package:mrkt_app/models/base_model.dart';
import 'package:mrkt_app/models/user.model.dart';

class ProfileState extends BaseModel {
  const ProfileState._({this.user});
  const ProfileState.initial(User? user) : this._(user: user);

  final User? user;

  @override
  List<Object?> get props => [user];

  ProfileState copyWith({
    User? user,
  }) {
    return ProfileState._(
      user: user ?? this.user,
    );
  }
}
