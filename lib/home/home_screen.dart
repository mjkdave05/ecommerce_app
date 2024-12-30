import 'package:ecommerce_app/home/widgets/home_app_bar.dart';
import 'package:ecommerce_app/home/widgets/image_slider.dart';
import 'package:flutter/material.dart';

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
              const SizedBox(height: 35,),
              // for custom nav bar
              const CustomAppBar(),
              const SizedBox(height: 20,),
              // for search bar
              const SearchBar(),
              const SizedBox(height: 20,),
              // for sliding image
              ImageSlider(
                currentSlide: currentSlider,
                onChange: (value) {
                  setState(() {
                    currentSlider = value;
                  },
                );
              },
              ),
              const SizedBox(height: 20,),
              // for category selection
            ],
          ),
        ),
      ),
    );
  }
}

