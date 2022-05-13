import 'package:data/src/models/user.model.dart';
import 'package:hive/hive.dart';

part "user_table.g.dart";

@HiveType(typeId: 1)
class UserTable {
  @HiveField(1)
  final String? id;

  @HiveField(2)
  final String? password;

  @HiveField(3)
  final String? firstname;

  @HiveField(4)
  final String? lastname;
  @HiveField(5)
  final String? role;
  @HiveField(6)
  final String? nickname;
  @HiveField(7)
  final String? email;
  @HiveField(8)
  final String? birthday;
  @HiveField(9)
  final String? mobile;
  @HiveField(10)
  final String? cefrlevel;

  UserTable({
    this.id,
    this.password,
    this.firstname,
    this.lastname,
    this.role,
    this.nickname,
    this.email,
    this.birthday,
    this.mobile,
    this.cefrlevel,
  });

  factory UserTable.fromModel(User user) => UserTable(
        id: user.id ?? '',
        password: user.password ?? '',
        firstname: user.firstname,
        lastname: user.lastname,
        role: user.role,
        nickname: user.nickname,
        email: user.email,
        birthday: user.birthday,
        mobile: user.mobile,
        cefrlevel: user.cefrlevel,
      );

  UserTable copyWith({
    String? id,
    String? password,
    String? firstname,
    String? lastname,
    String? role,
    String? nickname,
    String? email,
    String? birthday,
    String? mobile,
    String? cefrlevel,
  }) {
    return UserTable(
      id: id ?? this.id,
      password: password ?? this.password,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      role: role ?? this.role,
      nickname: nickname ?? this.nickname,
      email: email ?? this.email,
      birthday: birthday ?? this.birthday,
      mobile: mobile ?? this.mobile,
      cefrlevel: cefrlevel ?? this.cefrlevel,
    );
  }
}
