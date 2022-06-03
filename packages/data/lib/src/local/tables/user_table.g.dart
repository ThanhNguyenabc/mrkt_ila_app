// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserTableAdapter extends TypeAdapter<UserTable> {
  @override
  final int typeId = 1;

  @override
  UserTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserTable(
      id: fields[1] as String?,
      password: fields[2] as String?,
      firstname: fields[3] as String?,
      lastname: fields[4] as String?,
      role: fields[5] as String?,
      nickname: fields[6] as String?,
      email: fields[7] as String?,
      birthday: fields[8] as String?,
      mobile: fields[9] as String?,
      cefrlevel: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserTable obj) {
    writer
      ..writeByte(10)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.firstname)
      ..writeByte(4)
      ..write(obj.lastname)
      ..writeByte(5)
      ..write(obj.role)
      ..writeByte(6)
      ..write(obj.nickname)
      ..writeByte(7)
      ..write(obj.email)
      ..writeByte(8)
      ..write(obj.birthday)
      ..writeByte(9)
      ..write(obj.mobile)
      ..writeByte(10)
      ..write(obj.cefrlevel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
