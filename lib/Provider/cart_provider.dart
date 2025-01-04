import 'package:ecommerce_app/models/product_model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cart = [];
  List <Product> get cart => _cart;
  void toggleFavorite(Product product) {
    if (_cart.contains(product)){

    }
  }
}