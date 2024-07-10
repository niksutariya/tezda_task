import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:tezda_task/model/item_model.dart';
import 'package:tezda_task/utils/app_strings.dart';

class ProductServices {
  static var client = http.Client();
  static Future<List<Product>?> fetchProducts() async {
    var response =
    await client.get(Uri.parse(AppConfig.productList));
    if (response.statusCode == 200) {
      var json = response.body;
      return productFromJson(json);
    } else {
      log('Error response:${response.body}');
    }

    return null;
  }
}