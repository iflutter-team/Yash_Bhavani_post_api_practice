import 'package:post_api_practice/utils/api_class.dart';
import 'package:http/http.dart' as http;

import '../../http_service/post_api.dart';
import '../../model/post_api_model.dart';

class RegisterAPI {
  static Future registerUser(Map<String, dynamic> body) async {
    try {
      String url = APiUrl.signUp;
      http.Response? response = await HttpServiceSignUP.postAPI(
        url: url,
        body: body,
        header: {'Content-Type': 'application/json'},
      );

      if (response != null && response.statusCode == 200) {
        print(response.body);

        return userSingUpFromJson(response.body);
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
