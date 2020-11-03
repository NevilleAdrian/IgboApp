// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubCategoryAdapter extends TypeAdapter<SubCategory> {
  @override
  final int typeId = 5;

  @override
  SubCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubCategory(
      study: (fields[9] as List)?.cast<Study>(),
      sId: fields[0] as String,
      name: fields[1] as String,
      type: fields[2] as String,
      form: fields[3] as String,
      premiumContent: fields[4] as bool,
      time: fields[5] as String,
      category: fields[6] as String,
      createdon: fields[7] as String,
      iV: fields[8] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SubCategory obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.sId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.form)
      ..writeByte(4)
      ..write(obj.premiumContent)
      ..writeByte(5)
      ..write(obj.time)
      ..writeByte(6)
      ..write(obj.category)
      ..writeByte(7)
      ..write(obj.createdon)
      ..writeByte(8)
      ..write(obj.iV)
      ..writeByte(9)
      ..write(obj.study);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
