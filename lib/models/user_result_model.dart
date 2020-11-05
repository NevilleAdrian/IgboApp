class UserResultModel {
  String learningType;
  double alphabetsFluency;
  int totalTest;
  int wordsLearned;
  int totalPoints;
  String lesson;
  String user;
  String category;
  UserResultModel(
      {this.category,
      this.lesson,
      this.alphabetsFluency,
      this.learningType,
      this.totalPoints,
      this.totalTest,
      this.user,
      this.wordsLearned});

  UserResultModel.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    category = json["category"];
    lesson = json["lesson"];
    totalPoints = json["totalPoints"];
    wordsLearned = json["wordsLearned"];
    totalTest = json['totalTest'];
    alphabetsFluency = json['alphabetsFluency'];
    learningType = json['learning_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data["category"] = this.category;
    data["lesson"] = this.lesson;
    data["totalPoints"] = this.totalPoints;
    data["wordsLearned"] = this.wordsLearned;
    data['totalTest'] = this.totalTest;
    data['alphabetsFluency'] = this.alphabetsFluency;
    data['learning_type'] = this.learningType;
    return data;
  }
}
