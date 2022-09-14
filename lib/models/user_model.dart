import 'package:hive_versioning/models/abstracts/abstract_model.dart';
import 'package:hive_versioning/models/versions/user_model.v1.dart';
import 'package:hive_versioning/models/versions/user_model.v2.dart';

abstract class UserModel extends AbstractModel {

  factory UserModel({
    required String uuid,
    required String name,
    required String lastName,
    required int age,
    String version = 'V2'
  }){
    switch(version){
      case 'V2': return UserModelV2(uuid: uuid, name: name, lastName: lastName, age: age);
      case 'V1': return UserModelV1(uuid: uuid, name: '$name $lastName', age: age);
    }
    throw UnimplementedError();
  }

  String get uuid;
  String get name;
  String get lastName;
  int? age;
}