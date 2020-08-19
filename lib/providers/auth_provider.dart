import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:nkuzi_igbo/models/user_model.dart';
import 'package:nkuzi_igbo/services/network_helper.dart';
import 'package:provider/provider.dart';

class Auth extends ChangeNotifier {
  NetworkHelper _helper = NetworkHelper();
  User _user;
  String _token;
  List<dynamic>  _categories;

  User get user => _user;
  String get token => _token;
  dynamic get category => _categories;

  static Auth authProvider(BuildContext context, {bool listen = false}) => Provider.of<Auth>(context, listen: listen);

  Future<void> loginUser(String email, String password) async {
    try {
      var data = await _helper.loginUser(email, password);
      var category = await _helper.getCategory();
      _categories = category['data'];
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
      print(_token);
    } catch (ex) {
      throw Exception(ex);
    }
  }
}
