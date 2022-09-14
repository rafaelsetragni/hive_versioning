import 'package:hive/hive.dart';
import 'package:hive_versioning/models/abstracts/hive_model_adapter.dart';
import 'package:hive_versioning/models/user_model.dart';
import 'package:hive_versioning/models/versions/user_model.v1.dart';

import '../versions/user_model.v2.dart';

class UserModelAdapter extends HiveModelAdapter<UserModel> {

  // Must be the same as main model
  @override
  int get typeId => 1;

  final v1Adapter = UserModelV1Adapter();
  final v2Adapter = UserModelV2Adapter();

  @override
  UserModel getModelFromVersion(String version, BinaryReader reader) {
    switch(version){
      case 'V2': return v2Adapter.read(reader);
      case 'V1': return v1Adapter.read(reader);
    }
    throw UnimplementedError();
  }

  @override
  void setModelFromVersion(BinaryWriter writer, UserModel obj) {
    if(obj is UserModelV2) {
      writer.writeString('V2');
      return v2Adapter.write(writer, obj);
    }
    if(obj is UserModelV1) {
      writer.writeString('V1');
      return v1Adapter.write(writer, obj);
    }
    throw UnimplementedError();
  }

}