// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_setting_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppSettingTableAdapter extends TypeAdapter<AppSettingTable> {
  @override
  final int typeId = 2;

  @override
  AppSettingTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppSettingTable(
      appearanceMode: fields[1] as String?,
      selectedLanguage: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AppSettingTable obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.appearanceMode)
      ..writeByte(2)
      ..write(obj.selectedLanguage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppSettingTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
