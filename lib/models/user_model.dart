class User {
  bool activeSubscription;
  bool verified;
  String sId;
  String name;
  String email;
  String location;
  String role;
  String password;
  String did;
  bool visible;
  String verifiedon;
  String createdon;
  String verificationId;
  String subscribedon;
  String deactivatesubon;
  String pwdrequeston;
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
