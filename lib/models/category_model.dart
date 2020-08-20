class Category {
  List<SubCategories> subCategories;
  String sId;
  String name;
  String description;
  String color;
  String createdon;
  int iV;

  Category(
      {this.subCategories,
        this.sId,
        this.name,
        this.description,
        this.color,
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
    data['picture'] = this.picture;
    data['voicing'] = this.voicing;
    data['lesson'] = this.lesson;
    data['createdon'] = this.createdon;
    data['__v'] = this.iV;
    return data;
  }
}

class Test {
  String sId;
  String question;
  String optionAImage;
  String optionB;
  String optionBImage;
  String optionC;
  String optionCImage;
  String optionD;
  String optionDImage;
  String correctOption;
  String type;
  String lesson;
  String createdon;
  int iV;
  String option1;
  String option2;
  String option3;
  String option4;

  Test(
      {this.sId,
        this.question,
        this.optionAImage,
        this.optionB,
        this.optionBImage,
        this.optionC,
        this.optionCImage,
        this.optionD,
        this.optionDImage,
        this.correctOption,
        this.type,
        this.lesson,
        this.createdon,
        this.iV,
        this.option1,
        this.option2,
        this.option3,
        this.option4});

  Test.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    question = json['question'];
    optionAImage = json['optionAImage'];
    optionB = json['optionB'];
    optionBImage = json['optionBImage'];
    optionC = json['optionC'];
    optionCImage = json['optionCImage'];
    optionD = json['optionD'];
    optionDImage = json['optionDImage'];
    correctOption = json['correctOption'];
    type = json['type'];
    lesson = json['lesson'];
    createdon = json['createdon'];
    iV = json['__v'];
    option1 = json['option1'];
    option2 = json['option2'];
    option3 = json['option3'];
    option4 = json['option4'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['question'] = this.question;
    data['optionAImage'] = this.optionAImage;
    data['optionB'] = this.optionB;
    data['optionBImage'] = this.optionBImage;
    data['optionC'] = this.optionC;
    data['optionCImage'] = this.optionCImage;
    data['optionD'] = this.optionD;
    data['optionDImage'] = this.optionDImage;
    data['correctOption'] = this.correctOption;
    data['type'] = this.type;
    data['lesson'] = this.lesson;
    data['createdon'] = this.createdon;
    data['__v'] = this.iV;
    data['option1'] = this.option1;
    data['option2'] = this.option2;
    data['option3'] = this.option3;
    data['option4'] = this.option4;
    return data;
  }
}