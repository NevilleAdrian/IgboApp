import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:nkuzi_igbo/models/app_model.dart';
import 'package:nkuzi_igbo/models/user_model.dart';
import 'package:nkuzi_igbo/repository/hive_repository.dart';
import 'package:nkuzi_igbo/services/network_helper.dart';
import 'package:nkuzi_igbo/utils/constants.dart';
import 'package:provider/provider.dart';

class Auth extends ChangeNotifier {
  NetworkHelper _helper = NetworkHelper();
  HiveRepository _hiveRepository = HiveRepository();
  User _user;
  String _token;

  User get user => _user;
  String get token => _token;

  setUser(User user) => _user = user;
  setToken(String token) => _token = token;

  static Auth authProvider(BuildContext context, {bool listen = false}) =>
      Provider.of<Auth>(context, listen: listen);

  Future<void> loginUser(String email, String password) async {
    try {
      var data = await _helper.loginUser(email, password);
      _setInitialData(data);
    } catch (ex) {
      throw Exception(ex);
    }
  }

  Future<void> registerUser(String name, String email, String password) async {
    try {
      var data = await _helper.registerUser(name, email, password);
      _setInitialData(data);
      print(_token);
    } catch (ex) {
      throw Exception(ex);
    }
  }

  logout() {
    setUser(null);
    setToken(null);
    _hiveRepository.clear<User>(name: kUserName);
    _hiveRepository.clear<AppModel>(name: kAppDataName);
  }

  void _setInitialData(data) {
    setUser(User.fromJson(data['user']));
    setToken(data['token']);
    _hiveRepository.add<User>(name: kUserName, key: 'user', item: user);
    _hiveRepository.add<AppModel>(
        name: kAppDataName, key: 'appModel', item: AppModel(token: token));
  }
}
