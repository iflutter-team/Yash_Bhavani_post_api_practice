import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:post_api_practice/screen/home_screen/home_page_api.dart';

import '../model/ProductList.dart';

class APIResponse {
  static Future<ProductList?> getHomeAPIData() async {
    var data;

    http.Response? response =
        await GetHomeAPIData.getAPI(url: 'https://dummyjson.com/products');

    data = jsonDecode(response!.body.toString());

    if (response.statusCode == 200) {
      print(response.body);
      // return data;
      return productListFromJson(response.body.toString());
    } else {
      throw Exception('Error');
    }
  }

// static Future<http.Response?> postAPIData() async {
//
//   var data;
//
//   http.Response? response =
//   await HttpService.getAPI(url: 'https://dummyjson.com/products');
//
//   data =jsonDecode(response!.body.toString());
//
//   if (response.statusCode == 200) {
//     print(response.body);
//     // return data;
//     return productListFromJson(response.body.toString());
//   } else {
//     throw Exception('Error');
//   }
// }
}
