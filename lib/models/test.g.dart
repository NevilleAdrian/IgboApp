// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TestAdapter extends TypeAdapter<Test> {
  @override
  final int typeId = 6;

  @override
  Test read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Test(
      id: fields[0] as String,
      question: fields[1] as String,
      mainQuestion: fields[2] as String,
      correctSentence: (fields[5] as List)?.cast<String>(),
      words: (fields[6] as List)?.cast<String>(),
      isSelected: fields[3] as bool,
      audioUrl: fields[4] as String,
      type: fields[7] as String,
      lesson: fields[8] as String,
      createdon: fields[9] as DateTime,
      v: fields[10] as int,
      matchQuestion: fields[11] as String,
      matchQuestionImage: fields[12] as String,
      correctOption: fields[13] as String,
      optionIaudio: fields[14] as String,
      optionI: fields[15] as String,
      optionIIaudio: fields[16] as String,
      optionIi: fields[17] as String,
      optionIiIaudio: fields[18] as String,
      optionIii: fields[19] as String,
      optionIVaudio: fields[20] as String,
      optionIv: fields[21] as String,
      option1Audio: fields[22] as String,
      option1: fields[23] as String,
      option2Audio: fields[24] as String,
      option2: fields[25] as String,
      option3Audio: fields[26] as String,
      option3: fields[27] as String,
      option4Audio: fields[28] as String,
      option4: fields[29] as String,
      optionA: fields[30] as String,
      optionB: fields[31] as String,
      optionC: fields[32] as String,
      optionD: fields[33] as String,
      optionAImage: fields[34] as String,
      optionBImage: fields[35] as String,
      optionCImage: fields[36] as String,
      optionDImage: fields[37] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Test obj) {
    writer
      ..writeByte(38)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.question)
      ..writeByte(2)
      ..write(obj.mainQuestion)
      ..writeByte(3)
      ..write(obj.isSelected)
      ..writeByte(4)
      ..write(obj.audioUrl)
      ..writeByte(5)
      ..write(obj.correctSentence)
      ..writeByte(6)
      ..write(obj.words)
      ..writeByte(7)
      ..write(obj.type)
      ..writeByte(8)
      ..write(obj.lesson)
      ..writeByte(9)
      ..write(obj.createdon)
      ..writeByte(10)
      ..write(obj.v)
      ..writeByte(11)
      ..write(obj.matchQuestion)
      ..writeByte(12)
      ..write(obj.matchQuestionImage)
      ..writeByte(13)
      ..write(obj.correctOption)
      ..writeByte(14)
      ..write(obj.optionIaudio)
      ..writeByte(15)
      ..write(obj.optionI)
      ..writeByte(16)
      ..write(obj.optionIIaudio)
      ..writeByte(17)
      ..write(obj.optionIi)
      ..writeByte(18)
      ..write(obj.optionIiIaudio)
      ..writeByte(19)
      ..write(obj.optionIii)
      ..writeByte(20)
      ..write(obj.optionIVaudio)
      ..writeByte(21)
      ..write(obj.optionIv)
      ..writeByte(22)
      ..write(obj.option1Audio)
      ..writeByte(23)
      ..write(obj.option1)
      ..writeByte(24)
      ..write(obj.option2Audio)
      ..writeByte(25)
      ..write(obj.option2)
      ..writeByte(26)
      ..write(obj.option3Audio)
      ..writeByte(27)
      ..write(obj.option3)
      ..writeByte(28)
      ..write(obj.option4Audio)
      ..writeByte(29)
      ..write(obj.option4)
      ..writeByte(30)
      ..write(obj.optionA)
      ..writeByte(31)
      ..write(obj.optionB)
      ..writeByte(32)
      ..write(obj.optionC)
      ..writeByte(33)
      ..write(obj.optionD)
      ..writeByte(34)
      ..write(obj.optionAImage)
      ..writeByte(35)
      ..write(obj.optionBImage)
      ..writeByte(36)
      ..write(obj.optionCImage)
      ..writeByte(37)
      ..write(obj.optionDImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TestAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
