import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nkuzi_igbo/models/login_model.dart';
import 'package:nkuzi_igbo/models/register_model.dart';
import 'package:nkuzi_igbo/utils/constants.dart';

class NetworkHelper {
  Future<dynamic> loginUser(String email, String password) async {
    var body = Login(email: email, password: password).toJson();
    return await authRequest(body, '$kAppAPIUrl/login/appuser');
  }

  Future<dynamic> registerUser(
      String name, String email, String password) async {
    var body = Register(name: name, email: email, password: password).toJson();
    return await authRequest(body, '$kAppAPIUrl/register');
  }

  Future<dynamic> authRequest(Map body, String url) async {
    var response =
        await http.post(url, headers: kHeaders(), body: json.encode(body));
    var decoded = jsonDecode(response.body);
    if (response.statusCode.toString().startsWith('2')) {
      return decoded;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
