// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CourseAdapter extends TypeAdapter<Course> {
  @override
  final typeId = 1;

  @override
  Course read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Course()
      ..form = fields[0] as int
      ..info = fields[1] as String
      ..name = fields[2] as String;
  }

  @override
  void write(BinaryWriter writer, Course obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.form)
      ..writeByte(1)
      ..write(obj.info)
      ..writeByte(2)
      ..write(obj.name);
  }
}
