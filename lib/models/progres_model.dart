// To parse this JSON data, do
//
//     final progress = progressFromJson(jsonString);

import 'dart:convert';

Progress progressFromJson(String str) => Progress.fromJson(json.decode(str));

String progressToJson(Progress data) => json.encode(data.toJson());

class Progress {
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

  int lessonsAttempted;
  int basic;
  int intermediate;
  int advanced;
  int totalLessons;
  int totalPoints;
  int testAttempted;
  int totalTest;
  int alphabetsFluency;

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
