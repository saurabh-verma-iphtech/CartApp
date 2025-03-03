import 'package:flutter/material.dart';
import 'package:favourite_app/model/product.dart';
import 'package:favourite_app/services/product_services.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners(); 

    try {
      _products = await ProductServices.fetchProducts();
    } catch (e) {
      print("Error fetching products: $e");
    }

    _isLoading = false;
    notifyListeners();
  }
}
