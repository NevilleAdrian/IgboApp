import 'package:flutter/foundation.dart';
import 'package:nkuzi_igbo/models/user_model.dart';
import 'package:nkuzi_igbo/services/network_helper.dart';

class Auth extends ChangeNotifier {
  NetworkHelper _helper = NetworkHelper();
  User _user;
  String _token = '12345';

  User get user => _user;
  String get token => _token;

  Future<void> loginUser(String email, String password) async {
    try {
      var data = await _helper.loginUser(email, password);
      _user = User.fromJson(data['user']);
      _token = data['token'];
    } catch (ex) {
      throw Exception(ex);
    }
  }

  Future<void> registerUser(String name, String email, String password) async {
    try {
      var data = await _helper.registerUser(name, email, password);
      _user = User.fromJson(data['user']);
      _token = data['token'];
    } catch (ex) {
      throw Exception(ex);
    }
  }
}
