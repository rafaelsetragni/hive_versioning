import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import 'abstract_model.dart';

abstract class HiveModelAdapter<T extends AbstractModel>
    extends TypeAdapter<T>
{
  T getModelFromVersion(String version, BinaryReader reader);
  void setModelFromVersion(BinaryWriter writer, T obj);

  @override
  @mustCallSuper
  T read(BinaryReader reader) {
    final String modelVersion = reader.readString();
    return getModelFromVersion(modelVersion, reader);
  }

  @override
  @mustCallSuper
  void write(BinaryWriter writer, T obj) {
    setModelFromVersion(writer, obj);
  }
}