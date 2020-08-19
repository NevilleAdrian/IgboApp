import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  bool activeSubscription;
  @HiveField(1)
  bool verified;
  @HiveField(2)
  String sId;
  @HiveField(3)
  String name;
  @HiveField(4)
  String email;
  @HiveField(5)
  String location;
  @HiveField(6)
  String role;
  @HiveField(7)
  String password;
  @HiveField(8)
  String did;
  @HiveField(9)
  bool visible;
  @HiveField(10)
  String verifiedon;
  @HiveField(11)
  String createdon;
  @HiveField(12)
  String verificationId;
  @HiveField(13)
  String subscribedon;
  @HiveField(14)
  String deactivatesubon;
  @HiveField(15)
  String pwdrequeston;
  @HiveField(16)
  String pwdchangedon;

  User(
      {this.activeSubscription,
      this.verified,
      this.sId,
      this.name,
      this.email,
      this.location,
      this.role,
      this.password,
      this.did,
      this.visible,
      this.verifiedon,
      this.createdon,
      this.verificationId,
      this.subscribedon,
      this.deactivatesubon,
      this.pwdrequeston,
      this.pwdchangedon});

  User.fromJson(Map<String, dynamic> json) {
    activeSubscription = json['active_subscription'];
    verified = json['verified'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    location = json['location'];
    role = json['role'];
    password = json['password'];
    did = json['did'];
    visible = json['visible'];
    verifiedon = json['verifiedon'];
    createdon = json['createdon'];
    verificationId = json['verificationId'];
    subscribedon = json['subscribedon'];
    deactivatesubon = json['deactivatesubon'];
    pwdrequeston = json['pwdrequeston'];
    pwdchangedon = json['pwdchangedon'];
  }
}
