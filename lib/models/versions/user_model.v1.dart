import 'package:hive/hive.dart';
import 'package:hive_versioning/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.v1.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class UserModelV1 implements UserModel {

  UserModelV1({
    required this.uuid,
    required this.name,
    this.age
  });

  @override
  @HiveField(1)
  String name;

  @override
  @HiveField(2)
  String uuid;

  @override
  @HiveField(3)
  int? age;

  // Field that adapt the newest requirements for user models
  @override
  String get lastName => name.replaceAllMapped(
      RegExp(r'.*(\w+)$'), (match) => match.group(1) ?? '');

  @override
  Map<String, dynamic> toJson() => _$UserModelV1ToJson(this);

  @override
  factory UserModelV1.fromJson(Map<String, dynamic> json) =>
      _$UserModelV1FromJson(json);
}