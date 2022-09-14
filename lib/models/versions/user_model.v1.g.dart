// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.v1.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelV1Adapter extends TypeAdapter<UserModelV1> {
  @override
  final int typeId = 1;

  @override
  UserModelV1 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModelV1(
      uuid: fields[2] as String,
      name: fields[1] as String,
    )..age = fields[3] as int?;
  }

  @override
  void write(BinaryWriter writer, UserModelV1 obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.uuid)
      ..writeByte(3)
      ..write(obj.age);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelV1Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModelV1 _$UserModelV1FromJson(Map<String, dynamic> json) => UserModelV1(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
    )..age = json['age'] as int?;

Map<String, dynamic> _$UserModelV1ToJson(UserModelV1 instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'age': instance.age,
    };
