import 'dart:convert';

import 'package:hive/hive.dart';
part 'progres_model.g.dart';

Progress progressFromJson(String str) => Progress.fromJson(json.decode(str));

String progressToJson(Progress data) => json.encode(data.toJson());

@HiveType(typeId: 7)
class Progress {
  @HiveField(0)
  int lessonsAttempted;
  @HiveField(1)
  int basic;
  @HiveField(2)
  int intermediate;
  @HiveField(3)
  int advanced;
  @HiveField(4)
  int totalLessons;
  @HiveField(5)
  int totalPoints;
  @HiveField(6)
  int testAttempted;
  @HiveField(7)
  int totalTest;
  @HiveField(8)
  int alphabetsFluency;

  Progress({
    this.lessonsAttempted,
    this.basic,
    this.intermediate,
    this.advanced,
    this.totalLessons,
    this.totalPoints,
    this.testAttempted,
    this.totalTest,
    this.alphabetsFluency,
  });

  factory Progress.fromJson(Map<String, dynamic> json) => Progress(
        lessonsAttempted: json["lessonsAttempted"],
        basic: json["basic"],
        intermediate: json["intermediate"],
        advanced: json["advanced"],
        totalLessons: json["totalLessons"],
        totalPoints: json["totalPoints"],
        testAttempted: json["testAttempted"],
        totalTest: json["totalTest"],
        alphabetsFluency: json["alphabetsFluency"],
      );

  Map<String, dynamic> toJson() => {
        "lessonsAttempted": lessonsAttempted,
        "basic": basic,
        "intermediate": intermediate,
        "advanced": advanced,
        "totalLessons": totalLessons,
        "totalPoints": totalPoints,
        "testAttempted": testAttempted,
        "totalTest": totalTest,
        "alphabetsFluency": alphabetsFluency,
      };
}
