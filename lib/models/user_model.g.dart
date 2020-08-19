// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 1;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      activeSubscription: fields[0] as bool,
      verified: fields[1] as bool,
      sId: fields[2] as String,
      name: fields[3] as String,
      email: fields[4] as String,
      location: fields[5] as String,
      role: fields[6] as String,
      password: fields[7] as String,
      did: fields[8] as String,
      visible: fields[9] as bool,
      verifiedon: fields[10] as String,
      createdon: fields[11] as String,
      verificationId: fields[12] as String,
      subscribedon: fields[13] as String,
      deactivatesubon: fields[14] as String,
      pwdrequeston: fields[15] as String,
      pwdchangedon: fields[16] as String,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.activeSubscription)
      ..writeByte(1)
      ..write(obj.verified)
      ..writeByte(2)
      ..write(obj.sId)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.location)
      ..writeByte(6)
      ..write(obj.role)
      ..writeByte(7)
      ..write(obj.password)
      ..writeByte(8)
      ..write(obj.did)
      ..writeByte(9)
      ..write(obj.visible)
      ..writeByte(10)
      ..write(obj.verifiedon)
      ..writeByte(11)
      ..write(obj.createdon)
      ..writeByte(12)
      ..write(obj.verificationId)
      ..writeByte(13)
      ..write(obj.subscribedon)
      ..writeByte(14)
      ..write(obj.deactivatesubon)
      ..writeByte(15)
      ..write(obj.pwdrequeston)
      ..writeByte(16)
      ..write(obj.pwdchangedon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
