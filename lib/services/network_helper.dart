import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nkuzi_igbo/Exceptions/api_failure_exception.dart';
import 'package:nkuzi_igbo/models/category_model.dart';
import 'package:nkuzi_igbo/models/login_model.dart';
import 'package:nkuzi_igbo/models/register_model.dart';
import 'package:nkuzi_igbo/repository/hive_repository.dart';
import 'package:nkuzi_igbo/utils/constants.dart';

/// Helper class to make http request

class NetworkHelper {
  Future<dynamic> loginUser(String email, String password) async {
    var body = Login(email: email, password: password).toJson();
    return await authRequest(body, '$kAppAPIUrl/auth/login/appuser');
  }

  Future<dynamic> registerUser(
      String name, String email, String password) async {
    print('$email, $name, $password');
    var body = Register(name: name, email: email, password: password).toJson();
    return await authRequest(body, '$kAppAPIUrl/auth/register');
  }

  Future<dynamic> socialRegisterUser(
      String name, String email) async {
    print('$email, $name, ');
    var body = Register(name: name, email: email).toJson();
    return await authRequest(body, '$kAppAPIUrl/auth/login/sm/appuser');
  }

  Future<bool> checkActiveState(String id) async {
    print('id is $id');
    var data = await getRequest('$kAppAPIUrl/user/$id');
    print(data);
    return data['subscription_active'];
  }

  Future<dynamic> getCategoryList() async {
    var cat = await getRequest('$kAppAPIUrl/category/');
    return cat['data'];
  }

  Future<dynamic> calculateResult(body) async {
    var cat = await authRequest(body, '$kAppAPIUrl/progress/');
    return cat;
  }

  Future<List<Category>> getCategory() async {
    var cat = await getRequest('$kAppAPIUrl/category/appflow');
    print(cat);
    HiveRepository _hiveRepository = HiveRepository();
    var categories =
        (cat['data'] as List).map((e) => Category.fromJson(e)).toList();
    print(categories);
    _hiveRepository.add(name: kCategory, key: 'category', item: categories);
    return categories;
  }

  Future<dynamic> getProgress(id, dropDownId) async {
    var progress =
        await getRequest('$kAppAPIUrl/progress/user/$id/$dropDownId');
    return progress;
  }

  Future<dynamic> getRequest(String url) async {
    var response = await http.get(url);
    var decoded = jsonDecode(response.body);
    if (response.statusCode.toString().startsWith('2')) {
      return decoded;
    } else {
      throw ApiFailureException(decoded['message'] ?? response.reasonPhrase);
    }
  }

  Future<dynamic> authRequest(Map body, String url) async {
    print('body is $body');
    var response =
        await http.post(url, headers: kHeaders(null), body: json.encode(body));
    print(response.body);
    var decoded = jsonDecode(response.body);
    if (response.statusCode.toString().startsWith('2')) {
      print(decoded);
      return decoded;
    } else {
      print(
          'reason is ${response.reasonPhrase} message is ${decoded['message']}');
      throw ApiFailureException(decoded['message'] ?? response.reasonPhrase);
    }
  }
}
