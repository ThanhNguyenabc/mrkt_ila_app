import 'package:data/data.dart';
import 'package:data/src/local/tables/user_table.dart';
import 'package:hive/hive.dart';

part 'user_profile.g.dart';

@HiveType(typeId: 0)
class UserProfile {
  @HiveField(1)
  UserTable? user;

  UserProfile({
    this.user,
  });

  factory UserProfile.fromModel(User user) =>
      UserProfile(user: UserTable.fromModel(user));
}
