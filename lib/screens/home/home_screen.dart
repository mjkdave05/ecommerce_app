import 'package:ecommerce_app/screens/home/widgets/category.dart';
import 'package:ecommerce_app/screens/home/widgets/home_app_bar.dart';
import 'package:ecommerce_app/screens/home/widgets/image_slider.dart';
import 'package:ecommerce_app/screens/home/widgets/product_card.dart';
import 'package:ecommerce_app/screens/home/widgets/search_bar.dart';
import 'package:flutter/material.dart';

import '../../models/product_model.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              // Custom App Bar
              const CustomAppBar(),
              const SizedBox(height: 20),
              // Custom Search Bar
              CustomSearchBar(
                hintText: "Search products...",
                leadingIcon: const Icon(Icons.search, color: Colors.grey, size: 25),
                trailingIcon: const Icon(Icons.tune, color: Colors.grey),
                onTrailingIconPressed: () {
                  // Handle filter icon press
                  print("Filter icon pressed");
                },
              ),
              const SizedBox(height: 20),
              // Image Slider
              ImageSlider(
                currentSlide: currentSlider,
                onChange: (value) {
                  setState(() {
                    currentSlider = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              // for Categories selection
              Categories(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Special For You",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              // for shopping items
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.78,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                    return ProductCard(
                        product: products[index],
                    );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
