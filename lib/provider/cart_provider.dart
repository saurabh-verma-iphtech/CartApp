import 'package:flutter/material.dart';
import 'package:favourite_app/model/product.dart';

class CartProvider with ChangeNotifier {
  final List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  // Add item to cart
  void addToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

  // Remove item from cart
  void removeFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  // Calculate total price of all items in the cart
  double get totalPrice {
    double total = 0;
    for (var product in _cartItems) {
      total += product.price ?? 0;
    }
    return total;
  }

  int get cartCount => _cartItems.length;
}
