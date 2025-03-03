import 'dart:convert';

import 'package:favourite_app/model/product.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  static Future<List<Product>> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products.');
    }
  }
}
