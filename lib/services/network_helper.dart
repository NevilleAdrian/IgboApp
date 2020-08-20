import 'dart:convert';

import 'package:http/http.dart' as http;
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

  Future<dynamic> getCategory() async {
    var cat =  await getRequest('$kAppAPIUrl/category/appflow');
    HiveRepository _hiveRepository = HiveRepository();
    var category = cat['data'].map((e) => Category.fromJson(e)).toList();
    _hiveRepository.add(name: kCategory, key: 'category', item: jsonEncode(category));
    return cat;
  }

  Future<dynamic> getRequest( String url) async {
    var response = await http.get(url);
    print(response.body);
    var decoded = jsonDecode(response.body);
    if (response.statusCode.toString().startsWith('2')) {
      print(decoded);
      return decoded;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }


  Future<dynamic> authRequest(Map body, String url) async {
    print(body);
    var response = await http.post(url, headers: kHeaders(null), body: json.encode(body));
    print(response.body);
    var decoded = jsonDecode(response.body);
    if (response.statusCode.toString().startsWith('2')) {
      print(decoded);
      return decoded;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
