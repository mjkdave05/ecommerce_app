import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/screens/detail/widgets/add_to_cart.dart';
import 'package:ecommerce_app/screens/detail/widgets/description.dart';
import 'package:ecommerce_app/screens/detail/widgets/detail_app_bar.dart';
import 'package:ecommerce_app/screens/detail/widgets/image_slider.dart';
import 'package:ecommerce_app/screens/detail/widgets/items_details.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentImage = 0;
  int currentColor = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: contentColor,
      // for add to cart, icon and quantity
      floatingActionButton: AddToCart(product: widget.product),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // for back button share and favorite
                DetailAppBar(product: widget.product,),
                // for details image slider
                MyImageSlider(
                    onChange: (index){
                      setState(() {
                        currentImage = index;
                      });
                    },
                    image: widget.product.image,
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      5,
                          (index) => AnimatedContainer(
                        duration: Duration(microseconds: 300),
                        width: currentImage == index ? 15 : 8,
                        height: 8,
                        margin: EdgeInsets.only(right: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: currentImage == index
                                ? Colors.black
                                : Colors.transparent,
                            border: Border.all(
                              color: Colors.black,
                            )
                        ),
                      )
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    )
                  ),
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                    bottom: 100,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // for product name, rating and seller
                      ItemsDetails(product: widget.product),
                      SizedBox(height: 20,),
                      Text(
                        "Color",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: List.generate(
                            widget.product.colors.length,
                            (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentColor = index;
                                });
                              },
                              child: AnimatedContainer(
                                  duration: Duration(
                                      milliseconds: 3000,
                                  ),
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: currentColor == index
                                      ? Colors.white
                                      : widget.product.colors[index],
                                  border: currentColor == index
                                      ? Border.all(
                                    color: widget.product.colors[index],
                                  )
                                      : null,
                                ),
                                padding: currentColor == index
                                    ? EdgeInsets.all(2)
                                    : null,
                                    margin: EdgeInsets.only(right: 10,),
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: widget.product.colors[index],
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ),
                        ),
                      ),
                      SizedBox(height: 25,),
                      //for description
                      Description(description: widget.product.description,),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
