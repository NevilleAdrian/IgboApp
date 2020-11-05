// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryAdapter extends TypeAdapter<Category> {
  @override
  final int typeId = 3;

  @override
  Category read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Category(
      subCategories: (fields[10] as List)?.cast<SubCategory>(),
      sId: fields[0] as String,
      name: fields[2] as String,
      isAvaliable: fields[3] as bool,
      thumbnail: fields[4] as String,
      no: fields[1] as int,
      description: fields[5] as String,
      color: fields[6] as String,
      image: fields[7] as String,
      createdon: fields[8] as String,
      iV: fields[9] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.sId)
      ..writeByte(1)
      ..write(obj.no)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.isAvaliable)
      ..writeByte(4)
      ..write(obj.thumbnail)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.color)
      ..writeByte(7)
      ..write(obj.image)
      ..writeByte(8)
      ..write(obj.createdon)
      ..writeByte(9)
      ..write(obj.iV)
      ..writeByte(10)
      ..write(obj.subCategories);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
