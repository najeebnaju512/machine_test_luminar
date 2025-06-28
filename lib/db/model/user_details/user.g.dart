// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDetailsHiveAdapter extends TypeAdapter<UserDetailsHive> {
  @override
  final int typeId = 0;

  @override
  UserDetailsHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDetailsHive(
      id: fields[0] as String,
      name: fields[1] as String,
      email: fields[2] as String,
      phoneNo: fields[3] as String,
      accestoken: fields[4] as String,
      refreshtoken: fields[5] as String,
      whatsAppNo: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserDetailsHive obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.phoneNo)
      ..writeByte(4)
      ..write(obj.accestoken)
      ..writeByte(5)
      ..write(obj.refreshtoken)
      ..writeByte(6)
      ..write(obj.whatsAppNo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDetailsHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
