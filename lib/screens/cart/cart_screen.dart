import 'package:ecommerce_app/Provider/cart_provider.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screens/bottom_nav_bar.dart';
import 'package:ecommerce_app/screens/cart/check_out.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final finalList = provider.cart;
    // for quantity
    productQuantity(IconData icon, int index) {
      return GestureDetector(onTap: () {
        setState(() {
          icon == Icons.add
              ? provider.incrementQtn(index)
              : provider.decrementQtn(index);
        });
      },
        child: Icon(icon, size: 20,),
      );
    }

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
                      fontSize: 24,
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
                                padding: EdgeInsets.all(8),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 110,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: contentColor,
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
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(height: 5,),
                                        Text(
                                          cartItems.category,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            color: Colors.grey.shade400,
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Text(
                                          "\$${cartItems.price}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 35,
                                right: 35,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          finalList.removeAt(index);
                                          setState(() {});
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                          size: 25,
                                        ),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: contentColor,
                                        border: Border.all(
                                          color: Colors.grey.shade200,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 10,),
                                          productQuantity(Icons.add, index),
                                          SizedBox(width: 10,),
                                          Text(
                                              cartItems.quantity.toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          productQuantity(Icons.remove, index),
                                          SizedBox(width: 10,),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                            ),
                          ],
                        );
                      },
                  ),
              ),

              // for total and checkout
              CheckOutBox(),
            ],
          ),
      ),
    );
  }
}
