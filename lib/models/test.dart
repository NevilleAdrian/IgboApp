import 'package:hive/hive.dart';

part 'test.g.dart';

@HiveType(typeId: 6)
class Test {
  @HiveField(0)
  String id;
  @HiveField(1)
  String question;
  @HiveField(2)
  String mainQuestion;
  @HiveField(3)
  bool isSelected;
  @HiveField(4)
  String audioUrl;
  @HiveField(5)
  List<String> correctSentence;
  @HiveField(6)
  List<String> words;
  @HiveField(7)
  String type;
  @HiveField(8)
  String lesson;
  @HiveField(9)
  DateTime createdon;
  @HiveField(10)
  int v;
  @HiveField(11)
  String matchQuestion;
  @HiveField(12)
  String matchQuestionImage;
  @HiveField(13)
  String correctOption;
  @HiveField(14)
  String optionIaudio;
  @HiveField(15)
  String optionI;
  @HiveField(16)
  String optionIIaudio;
  @HiveField(17)
  String optionIi;
  @HiveField(18)
  String optionIiIaudio;
  @HiveField(19)
  String optionIii;
  @HiveField(20)
  String optionIVaudio;
  @HiveField(21)
  String optionIv;
  @HiveField(22)
  String option1Audio;
  @HiveField(23)
  String option1;
  @HiveField(24)
  String option2Audio;
  @HiveField(25)
  String option2;
  @HiveField(26)
  String option3Audio;
  @HiveField(27)
  String option3;
  @HiveField(28)
  String option4Audio;
  @HiveField(29)
  String option4;
  @HiveField(30)
  String optionA;
  @HiveField(31)
  String optionB;
  @HiveField(32)
  String optionC;
  @HiveField(33)
  String optionD;
  @HiveField(34)
  String optionAImage;
  @HiveField(35)
  String optionBImage;
  @HiveField(36)
  String optionCImage;
  @HiveField(37)
  String optionDImage;

  Test({
    this.id,
    this.question,
    this.mainQuestion,
    this.correctSentence,
    this.words,
    this.isSelected,
    this.audioUrl,
    this.type,
    this.lesson,
    this.createdon,
    this.v,
    this.matchQuestion,
    this.matchQuestionImage,
    this.correctOption,
    this.optionIaudio,
    this.optionI,
    this.optionIIaudio,
    this.optionIi,
    this.optionIiIaudio,
    this.optionIii,
    this.optionIVaudio,
    this.optionIv,
    this.option1Audio,
    this.option1,
    this.option2Audio,
    this.option2,
    this.option3Audio,
    this.option3,
    this.option4Audio,
    this.option4,
    this.optionA,
    this.optionB,
    this.optionC,
    this.optionD,
    this.optionAImage,
    this.optionBImage,
    this.optionCImage,
    this.optionDImage,
  });

  factory Test.fromJson(Map<String, dynamic> json) => Test(
        id: json["_id"],
        question: json["question"],
        isSelected: false,
        audioUrl: json["audioUrl"],
        mainQuestion:
            json["mainQuestion"] == null ? null : json["mainQuestion"],
        matchQuestionImage: json["matchQuestionImage"] == null
            ? null
            : json["matchQuestionImage"],
        correctSentence: json["correctSentence"] == null
            ? null
            : List<String>.from(json["correctSentence"].map((x) => x)),
        words: json["words"] == null
            ? null
            : List<String>.from(json["words"].map((x) => x)),
        type: json["type"],
        lesson: json["lesson"] == null ? '' : json["lesson"],
        createdon: DateTime.parse(json["createdon"]),
        v: json["__v"],
        matchQuestion:
            json["matchQuestion"] == null ? null : json["matchQuestion"],
        correctOption:
            json["correctOption"] == null ? null : json["correctOption"],
        optionIaudio:
            json["optionIaudio"] == null ? null : json["optionIaudio"],
        optionI: json["optionI"] == null ? null : json["optionI"],
        optionIIaudio:
            json["optionIIaudio"] == null ? null : json["optionIIaudio"],
        optionIi: json["optionII"] == null ? null : json["optionII"],
        optionIiIaudio:
            json["optionIIIaudio"] == null ? null : json["optionIIIaudio"],
        optionIii: json["optionIII"] == null ? null : json["optionIII"],
        optionIVaudio:
            json["optionIVaudio"] == null ? null : json["optionIVaudio"],
        optionIv: json["optionIV"] == null ? null : json["optionIV"],
        option1Audio:
            json["option1audio"] == null ? null : json["option1audio"],
        option1: json["option1"] == null ? null : json["option1"],
        option2Audio:
            json["option2audio"] == null ? null : json["option2audio"],
        option2: json["option2"] == null ? null : json["option2"],
        option3Audio:
            json["option3audio"] == null ? null : json["option3audio"],
        option3: json["option3"] == null ? null : json["option3"],
        option4Audio:
            json["option4audio"] == null ? null : json["option4audio"],
        option4: json["option4"] == null ? null : json["option4"],
        optionA: json["optionA"] == null ? null : json["optionA"],
        optionB: json["optionB"] == null ? null : json["optionB"],
        optionC: json["optionC"] == null ? null : json["optionC"],
        optionD: json["optionD"] == null ? null : json["optionD"],
        optionAImage:
            json["optionAImage"] == null ? null : json["optionAImage"],
        optionBImage:
            json["optionBImage"] == null ? null : json["optionBImage"],
        optionCImage:
            json["optionCImage"] == null ? null : json["optionCImage"],
        optionDImage:
            json["optionDImage"] == null ? null : json["optionDImage"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "question": question,
        'isSelected': isSelected,
        'audioUrl': audioUrl,
        "mainQuestion": mainQuestion == null ? null : mainQuestion,
        "matchQuestionImage":
            matchQuestionImage == null ? null : matchQuestionImage,
        "correctSentence": correctSentence == null
            ? null
            : List<dynamic>.from(correctSentence.map((x) => x)),
        "words": words == null ? null : List<dynamic>.from(words.map((x) => x)),
        "type": type,
        "lesson": lesson,
        "createdon": createdon.toIso8601String(),
        "__v": v,
        "matchQuestion": matchQuestion == null ? null : matchQuestion,
        "correctOption": correctOption == null ? null : correctOption,
        "optionIaudio": optionIaudio == null ? null : optionIaudio,
        "optionI": optionI == null ? null : optionI,
        "optionIIaudio": optionIIaudio == null ? null : optionIIaudio,
        "optionII": optionIi == null ? null : optionIi,
        "optionIIIaudio": optionIiIaudio == null ? null : optionIiIaudio,
        "optionIII": optionIii == null ? null : optionIii,
        "optionIVaudio": optionIVaudio == null ? null : optionIVaudio,
        "optionIV": optionIv == null ? null : optionIv,
        "option1audio": option1Audio == null ? null : option1Audio,
        "option1": option1 == null ? null : option1,
        "option2audio": option2Audio == null ? null : option2Audio,
        "option2": option2 == null ? null : option2,
        "option3audio": option3Audio == null ? null : option3Audio,
        "option3": option3 == null ? null : option3,
        "option4audio": option4Audio == null ? null : option4Audio,
        "option4": option4 == null ? null : option4,
        "optionA": optionA == null ? null : optionA,
        "optionB": optionB == null ? null : optionB,
        "optionC": optionC == null ? null : optionC,
        "optionD": optionD == null ? null : optionD,
        "optionAImage": optionAImage == null ? null : optionAImage,
        "optionBImage": optionBImage == null ? null : optionBImage,
        "optionCImage": optionCImage == null ? null : optionCImage,
        "optionDImage": optionDImage == null ? null : optionDImage,
      };
}
