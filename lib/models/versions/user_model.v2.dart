import 'package:hive/hive.dart';
import 'package:hive_versioning/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.v2.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class UserModelV2 implements UserModel {

  UserModelV2({
    required this.uuid,
    required this.name,
    required this.lastName,
    this.age
  });

  @override
  @HiveField(1)
  String uuid;

  @override
  @HiveField(2)
  String name;

  @override
  @HiveField(3)
  String lastName;

  @override
  @HiveField(4)
  int? age;

  @override
  Map<String, dynamic> toJson() => _$UserModelV2ToJson(this);

  @override
  factory UserModelV2.fromJson(Map<String, dynamic> json) =>
      _$UserModelV2FromJson(json);
}