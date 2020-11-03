// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudyAdapter extends TypeAdapter<Study> {
  @override
  final int typeId = 4;

  @override
  Study read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Study(
      test: (fields[9] as List)?.cast<Test>(),
      sId: fields[0] as String,
      studyNo: fields[1] as int,
      description: fields[2] as String,
      igbo: fields[3] as String,
      picture: fields[4] as String,
      voicing: fields[5] as String,
      lesson: fields[6] as String,
      createdon: fields[7] as String,
      iV: fields[8] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Study obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.sId)
      ..writeByte(1)
      ..write(obj.studyNo)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.igbo)
      ..writeByte(4)
      ..write(obj.picture)
      ..writeByte(5)
      ..write(obj.voicing)
      ..writeByte(6)
      ..write(obj.lesson)
      ..writeByte(7)
      ..write(obj.createdon)
      ..writeByte(8)
      ..write(obj.iV)
      ..writeByte(9)
      ..write(obj.test);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
