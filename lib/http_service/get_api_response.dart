import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/ProductList.dart';
import 'get_api.dart';

class APIResponse {
  static Future<ProductList?> getAPIData() async {

    var data;

    http.Response? response =
        await HttpService.getAPI(url: 'https://dummyjson.com/products');

    data =jsonDecode(response!.body.toString());

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
