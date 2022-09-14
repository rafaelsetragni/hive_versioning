// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.v2.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelV2Adapter extends TypeAdapter<UserModelV2> {
  @override
  final int typeId = 1;

  @override
  UserModelV2 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModelV2(
      uuid: fields[1] as String,
      name: fields[2] as String,
      lastName: fields[3] as String,
    )..age = fields[4] as int?;
  }

  @override
  void write(BinaryWriter writer, UserModelV2 obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.uuid)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.lastName)
      ..writeByte(4)
      ..write(obj.age);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelV2Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModelV2 _$UserModelV2FromJson(Map<String, dynamic> json) => UserModelV2(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      lastName: json['lastName'] as String,
    )..age = json['age'] as int?;

Map<String, dynamic> _$UserModelV2ToJson(UserModelV2 instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'lastName': instance.lastName,
      'age': instance.age,
    };
