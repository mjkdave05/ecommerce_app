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
      title: "Wireless Headphone",
      description: "Lorem",
      image: "assets/images/all/wireless.png",
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
  Product(
    title: "Woman Sweter",
    description: "Lorem",
    image: "assets/images/all/sweet.png",
    review: "(132 Reviews)",
    seller: "Joy Store",
    price: 120,
    colors: [
      Colors.brown,
      Colors.deepPurple,
      Colors.pink,
    ],
    category: "Woman Fashion",
    rate: 4.5,
    quantity: 1,
  ),
  Product(
    title: "Smart Watch",
    description: "Lorem",
    image: "assets/images/all/miband.jpg",
    review: "(20 Reviews)",
    seller: "Ram Dos",
    price: 55,
    colors: [
      Colors.black,
      Colors.amber,
      Colors.purple,
    ],
    category: "Electronics",
    rate: 4.0,
    quantity: 1,
  ),
  Product(
    title: "Mens Jacket",
    description: "Lorem",
    image: "assets/images/all/jacket.png",
    review: "(20 Reviews)",
    seller: "Jacket store",
    price: 155,
    colors: [
      Colors.blueAccent,
      Colors.orange,
      Colors.green,
    ],
    category: "Electronics",
    rate: 5.0,
    quantity: 1,
  ),
];