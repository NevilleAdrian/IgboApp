class Login {
  String email;
  String password;

  Login({this.email, this.password});

  Map<String, String> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
