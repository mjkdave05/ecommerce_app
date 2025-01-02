import 'package:flutter/material.dart';

class Product {
  final String title;
  final String description;
  final String image;
  final String review;
  final String seller;
  final double price;
  final List <Color> colors;
  final String category;
  final double rate;
  int quantity;

  Product ({
    required this.title,
    required this.description,
    required this.image,
    required this.review,
    required this.seller,
    required this.price,
    required this.colors,
    required this.category,
    required this.rate,
    required this.quantity,
});
}

final List<Product> products = [
  Product(
      title: "Wireless Headphones",
      description: "Lorem",
      image: "assets/images/wireless.png",
      review: "(320 Reviews)",
      seller: "Tariqul Isalm",
      price: 120,
      colors: [
        Colors.black,
        Colors.blue,
        Colors.orange,
      ],
      category: "Electronics",
      rate: 4.8,
      quantity: 1,
  ),
];