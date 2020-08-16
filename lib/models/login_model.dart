class Login {
  String email;
  String password;

  Login({this.email, this.password});

  Map<String, String> toJson() {
    final Map<String, String> data = new Map<String, String>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['role'] = 'appuser';
    return data;
  }
}
