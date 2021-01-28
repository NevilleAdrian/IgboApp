import 'package:hive/hive.dart';
import 'package:nkuzi_igbo/models/sub_category.dart';
import 'package:nkuzi_igbo/utils/functions.dart';

part 'category_model.g.dart';

@HiveType(typeId: 3)
class Category {
  @HiveField(0)
  String sId;
  @HiveField(1)
  int no;
  @HiveField(2)
  String name;
  @HiveField(3)
  bool isAvaliable;
  @HiveField(4)
  String thumbnail;
  @HiveField(5)
  String description;
  @HiveField(6)
  String color;
  @HiveField(7)
  String image;
  @HiveField(8)
  String createdon;
  @HiveField(9)
  int iV;
  @HiveField(10)
  List<SubCategory> subCategories;

  Category(
      {this.subCategories,
      this.sId,
      this.name,
      this.isAvaliable,
      this.thumbnail,
      this.no,
      this.description,
      this.color,
      this.image,
      this.createdon,
      this.iV});

  Category.fromJson(Map<String, dynamic> json) {
    if (json['sub_categories'] != null) {
      subCategories = new List<SubCategory>();
      json['sub_categories'].forEach((v) {
        subCategories.add(SubCategory.fromJson(v));
      });
    }
    sId = json['_id'];
    no = json["no"];
    name = json["name"];
    thumbnail = replaceRemoteImageWithLocal(json["thumbnail"]);
    print(thumbnail);
    isAvaliable = json["isAvaliable"];
    description = json['description'];
    color = json['color'];
    image = replaceRemoteImageWithLocal(json['image']);
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
    data["no"] = this.no;
    data["name"] = this.name;
    data["thumbnail"] = this.thumbnail;
    data["isAvaliable"] = this.isAvaliable;
    data['description'] = this.description;
    data['color'] = this.color;
    data['image'] = this.image;
    data['createdon'] = this.createdon;
    data['__v'] = this.iV;
    return data;
  }
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
