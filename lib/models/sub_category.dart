import 'package:hive/hive.dart';
import 'package:nkuzi_igbo/models/study.dart';

part 'sub_category.g.dart';

@HiveType(typeId: 5)
class SubCategory {
  @HiveField(0)
  String sId;
  @HiveField(1)
  String name;
  @HiveField(2)
  String type;
  @HiveField(3)
  String form;
  @HiveField(4)
  bool premiumContent;
  @HiveField(5)
  String time;
  @HiveField(6)
  String category;
  @HiveField(7)
  String createdon;
  @HiveField(8)
  int iV;
  @HiveField(9)
  List<Study> study;

  SubCategory(
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

  SubCategory.fromJson(Map<String, dynamic> json) {
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
