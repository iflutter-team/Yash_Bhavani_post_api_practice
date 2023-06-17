import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpServiceSignUP {

  static Future<http.Response?> postAPI({
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

      // final response = await http.get(Uri.parse(url));
      // return response;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
