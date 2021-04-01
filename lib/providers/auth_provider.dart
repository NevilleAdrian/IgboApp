import 'package:flutter/widgets.dart';
import 'package:nkuzi_igbo/Exceptions/api_failure_exception.dart';
import 'package:nkuzi_igbo/models/app_model.dart';
import 'package:nkuzi_igbo/models/category_model.dart';
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
  List<Category> _categories;

  User get user => _user;
  String get token => _token;
  List<Category> get category => _categories;

  setUser(User user) => _user = user;
  setToken(String token) => _token = token;
  setCategory(List<dynamic> category) => _categories = category;

  static Auth authProvider(BuildContext context, {bool listen = false}) =>
      Provider.of<Auth>(context, listen: listen);

  Future<void> loginUser(String email, String password) async {
    try {
      var data = await _helper.loginUser(email, password);
      var category = await _helper.getCategory();
      _setInitialData(data);
      _categories = category;
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<List<Category>> refreshCategories() async {
    try {
      _categories = await _helper.getCategory();
      return _categories;
    } catch (ex) {
      print(ex);
    }
    return null;
  }

  Future<void> registerUser(String name, String email, String password) async {
    try {
      var data = await _helper.registerUser(name, email, password);
      var category = await _helper.getCategory();
      _setInitialData(data);
      _categories = category;
      print(_token);
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<void> socialRegisterUser(String name, String email) async {
    try {
      var data = await _helper.socialRegisterUser(name, email);
      var category = await _helper.getCategory();
      _setInitialData(data);
      _categories = category;
      print(_token);
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<Map<String, dynamic>> checkUserActiveState() async {
    try {
      Map<String, dynamic> activeState =
          await _helper.checkActiveState(user.sId);
      print(activeState);
      if (!user.activeSubscription == activeState['subscription_active']) {
        user.activeSubscription = activeState['subscription_active'];
        _hiveRepository.add<User>(name: kUserName, key: 'user', item: user);
        notifyListeners();
      }
      return activeState;
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  logout() {
    setUser(null);
    setToken(null);
    _hiveRepository.clear<User>(name: kUserName);
    _hiveRepository.clear<AppModel>(name: kAppDataName);
    _hiveRepository.clear<Category>(name: kCategory);
  }

  void _setInitialData(data) {
    setUser(User.fromJson(data['user']));
    setToken(data['token']);
    _hiveRepository.add<User>(name: kUserName, key: 'user', item: user);

    _hiveRepository.add<AppModel>(
        name: kAppDataName, key: 'appModel', item: AppModel(token: token));
  }
}
