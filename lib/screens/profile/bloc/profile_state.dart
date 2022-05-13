import 'package:data/data.dart';

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
