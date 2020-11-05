// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progres_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProgressAdapter extends TypeAdapter<Progress> {
  @override
  final int typeId = 7;

  @override
  Progress read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Progress(
      lessonsAttempted: fields[0] as int,
      basic: fields[1] as int,
      intermediate: fields[2] as int,
      advanced: fields[3] as int,
      totalLessons: fields[4] as int,
      totalPoints: fields[5] as int,
      testAttempted: fields[6] as int,
      totalTest: fields[7] as int,
      alphabetsFluency: fields[8] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Progress obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.lessonsAttempted)
      ..writeByte(1)
      ..write(obj.basic)
      ..writeByte(2)
      ..write(obj.intermediate)
      ..writeByte(3)
      ..write(obj.advanced)
      ..writeByte(4)
      ..write(obj.totalLessons)
      ..writeByte(5)
      ..write(obj.totalPoints)
      ..writeByte(6)
      ..write(obj.testAttempted)
      ..writeByte(7)
      ..write(obj.totalTest)
      ..writeByte(8)
      ..write(obj.alphabetsFluency);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProgressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
