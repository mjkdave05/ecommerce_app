import 'package:ecommerce_app/Provider/cart_provider.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screens/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final finalList = provider.cart;
    return Scaffold(
      backgroundColor: contentColor,
      body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.all(15),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNavBar(),
                        ),
                      );
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                  Text(
                    "My Cart",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                    Container(),
                ],
                ),
              ),
              Expanded(
                  child: ListView.builder(
                    itemCount: finalList.length,
                      itemBuilder: (context, index) {
                      final cartItems = finalList[index];
                        return Stack(
                          children: [
                            Padding(
                                padding: EdgeInsets.all(15),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.all(20),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      child: Image.asset(cartItems.image),
                                    ),
                                    SizedBox(width: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cartItems.title,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(height: 5,),
                                        Text(
                                          cartItems.category,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Colors.grey.shade400,
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Text(
                                          "\$${cartItems.price}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                  ),
              ),
            ],
          ),
      ),
    );
  }
}
