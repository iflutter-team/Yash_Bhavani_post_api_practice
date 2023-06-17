import 'package:http/http.dart' as http;

class GetHomeAPIData {

  static Future<http.Response?> getAPI({required String url}) async {
    try {
      final response = await http.get(Uri.parse(url));
      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
