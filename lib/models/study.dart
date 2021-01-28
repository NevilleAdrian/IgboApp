import 'package:hive/hive.dart';
import 'package:nkuzi_igbo/models/test.dart';
import 'package:nkuzi_igbo/utils/functions.dart';

part 'study.g.dart';

@HiveType(typeId: 4)
class Study {
  @HiveField(0)
  String sId;
  @HiveField(1)
  int studyNo;
  @HiveField(2)
  String description;
  @HiveField(3)
  String igbo;
  @HiveField(4)
  String picture;
  @HiveField(5)
  String voicing;
  @HiveField(6)
  String lesson;
  @HiveField(7)
  String createdon;
  @HiveField(8)
  int iV;
  @HiveField(9)
  List<Test> test;

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
    picture = replaceRemoteImageWithLocal(json['picture']);
    voicing = replaceRemoteAudioWithLocal(json['voicing']);
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
