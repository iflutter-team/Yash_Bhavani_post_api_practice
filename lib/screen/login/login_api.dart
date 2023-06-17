import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:post_api_practice/model/post_api_model.dart';
import 'package:post_api_practice/utils/api_class.dart';

class HttpServiceForLogin {
  static Future<http.Response?> loginAPI({
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? header,
  }) async {
    try {
      return await http.post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: header,
      );
    } catch (e) {
      print(e);
      return null;
    }
  }
}

class LoginAPI {
  static Future loginPostAPI({Map<String, dynamic>? body}) async {
    try {
      String url = APiUrl.login;
      http.Response? response = await HttpServiceForLogin.loginAPI(
        url: url,
        body: body,
        header: {'Content-Type': 'application/json'},
      );

      if (response != null && response.statusCode == 200) {
        print(response.body.runtimeType);

        return userSingUpFromJson(response.body);

      } else {
        print('Failed');
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
