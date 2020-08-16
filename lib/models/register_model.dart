class Register {
  String name;
  String email;
  String password;

  Register({this.name, this.email, this.password});

  Map<String, String> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
