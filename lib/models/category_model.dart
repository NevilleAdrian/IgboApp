class Category {
  List<SubCategories> subCategories;
  String sId;
  String name;
  String description;
  String color;
  String image;
  String createdon;
  int iV;

  Category(
      {this.subCategories,
        this.sId,
        this.name,
        this.description,
        this.color,
        this.image,
        this.createdon,
        this.iV});

  Category.fromJson(Map<String, dynamic> json) {
    if (json['sub_categories'] != null) {
      subCategories = new List<SubCategories>();
      json['sub_categories'].forEach((v) {
        subCategories.add(new SubCategories.fromJson(v));
      });
    }
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    color = json['color'];
    image = json['image'];
    createdon = json['createdon'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subCategories != null) {
      data['sub_categories'] =
          this.subCategories.map((v) => v.toJson()).toList();
    }
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['color'] = this.color;
    data['image'] = this.image;
    data['createdon'] = this.createdon;
    data['__v'] = this.iV;
    return data;
  }
}


class SubCategories {
  List<Study> study;
  String sId;
  String name;
  String type;
  String form;
  bool premiumContent;
  String time;
  String category;
  String createdon;
  int iV;

  SubCategories(
      {this.study,
        this.sId,
        this.name,
        this.type,
        this.form,
        this.premiumContent,
        this.time,
        this.category,
        this.createdon,
        this.iV});

  SubCategories.fromJson(Map<String, dynamic> json) {
    if (json['study'] != null) {
      study = new List<Study>();
      json['study'].forEach((v) {
        study.add(new Study.fromJson(v));
      });
    }
    sId = json['_id'];
    name = json['name'];
    type = json['type'];
    form = json['form'];
    premiumContent = json['premium_content'];
    time = json['time'];
    category = json['category'];
    createdon = json['createdon'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.study != null) {
      data['study'] = this.study.map((v) => v.toJson()).toList();
    }
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['form'] = this.form;
    data['premium_content'] = this.premiumContent;
    data['time'] = this.time;
    data['category'] = this.category;
    data['createdon'] = this.createdon;
    data['__v'] = this.iV;
    return data;
  }
}

class Study {
  List<Test> test;
  String sId;
  int studyNo;
  String description;
  String igbo;
  String picture;
  String voicing;
  String lesson;
  String createdon;
  int iV;

  Study(
      {this.test,
        this.sId,
        this.studyNo,
        this.description,
        this.igbo,
        this.picture,
        this.voicing,
        this.lesson,
        this.createdon,
        this.iV});

  Study.fromJson(Map<String, dynamic> json) {
    if (json['test'] != null) {
      test = new List<Test>();
      json['test'].forEach((v) {
        test.add(new Test.fromJson(v));
      });
    }
    sId = json['_id'];
    studyNo = json['study_no'];
    description = json['description'];
    igbo = json['igbo'];
    picture = json['picture'];
    voicing = json['voicing'];
    lesson = json['lesson'];
    createdon = json['createdon'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.test != null) {
      data['test'] = this.test.map((v) => v.toJson()).toList();
    }
    data['_id'] = this.sId;
    data['study_no'] = this.studyNo;
    data['description'] = this.description;
    data['igbo'] = this.igbo;
    data['picture'] = this.picture;
    data['voicing'] = this.voicing;
    data['lesson'] = this.lesson;
    data['createdon'] = this.createdon;
    data['__v'] = this.iV;
    return data;
  }
}

class Test {
  Test({
    this.id,
    this.question,
    this.mainQuestion,
    this.correctSentence,
    this.words,
    this.isSelected,
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

  String id;
  String question;
  String mainQuestion;
  bool isSelected;
  List<String> correctSentence;
  List<String> words;
  Type type;
  String lesson;
  DateTime createdon;
  int v;
  String matchQuestion;
  String matchQuestionImage;
  String correctOption;
  String optionIaudio;
  String optionI;
  String optionIIaudio;
  String optionIi;
  String optionIiIaudio;
  String optionIii;
  String optionIVaudio;
  String optionIv;
  String option1Audio;
  String option1;
  String option2Audio;
  String option2;
  String option3Audio;
  String option3;
  String option4Audio;
  String option4;
  String optionA;
  String optionB;
  String optionC;
  String optionD;
  String optionAImage;
  String optionBImage;
  String optionCImage;
  String optionDImage;

  factory Test.fromJson(Map<String, dynamic> json) => Test(
    id: json["_id"],
    question: json["question"],
    isSelected: false,
    mainQuestion: json["mainQuestion"] == null ? null : json["mainQuestion"],
    matchQuestionImage: json["matchQuestionImage"] == null ? null : json["matchQuestionImage"],
    correctSentence: json["correctSentence"] == null ? null : List<String>.from(json["correctSentence"].map((x) => x)),
    words: json["words"] == null ? null : List<String>.from(json["words"].map((x) => x)),
    type: typeValues.map[json["type"]],
    lesson: json["lesson"] == null ? '' : json["lesson"],
    createdon: DateTime.parse(json["createdon"]),
    v: json["__v"],
    matchQuestion: json["matchQuestion"] == null ? null : json["matchQuestion"],
    correctOption: json["correctOption"] == null ? null : json["correctOption"],
    optionIaudio: json["optionIaudio"] == null ? null : json["optionIaudio"],
    optionI: json["optionI"] == null ? null : json["optionI"],
    optionIIaudio: json["optionIIaudio"] == null ? null : json["optionIIaudio"],
    optionIi: json["optionII"] == null ? null : json["optionII"],
    optionIiIaudio: json["optionIIIaudio"] == null ? null : json["optionIIIaudio"],
    optionIii: json["optionIII"] == null ? null : json["optionIII"],
    optionIVaudio: json["optionIVaudio"] == null ? null : json["optionIVaudio"],
    optionIv: json["optionIV"] == null ? null : json["optionIV"],
    option1Audio: json["option1audio"] == null ? null : json["option1audio"],
    option1: json["option1"] == null ? null : json["option1"],
    option2Audio: json["option2audio"] == null ? null : json["option2audio"],
    option2: json["option2"] == null ? null : json["option2"],
    option3Audio: json["option3audio"] == null ? null : json["option3audio"],
    option3: json["option3"] == null ? null : json["option3"],
    option4Audio: json["option4audio"] == null ? null : json["option4audio"],
    option4: json["option4"] == null ? null : json["option4"],
    optionA: json["optionA"] == null ? null : json["optionA"],
    optionB: json["optionB"] == null ? null : json["optionB"],
    optionC: json["optionC"] == null ? null : json["optionC"],
    optionD: json["optionD"] == null ? null : json["optionD"],
    optionAImage: json["optionAImage"] == null ? null : json["optionAImage"],
    optionBImage: json["optionBImage"] == null ? null : json["optionBImage"],
    optionCImage: json["optionCImage"] == null ? null : json["optionCImage"],
    optionDImage: json["optionDImage"] == null ? null : json["optionDImage"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "question": question,
    'isSelected': isSelected,
    "mainQuestion": mainQuestion == null ? null : mainQuestion,
    "matchQuestionImage": matchQuestionImage == null ? null : matchQuestionImage,
    "correctSentence": correctSentence == null ? null : List<dynamic>.from(correctSentence.map((x) => x)),
    "words": words == null ? null : List<dynamic>.from(words.map((x) => x)),
    "type": typeValues.reverse[type],
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

enum Type { SENTENCE, MATCH, TO_ENGLISH, TO_IGBO }

final typeValues = EnumValues({
  "match": Type.MATCH,
  "sentence": Type.SENTENCE,
  "toEnglish": Type.TO_ENGLISH,
  "toIgbo": Type.TO_IGBO
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}







