import 'package:ecommerce_app/Provider/favorite_provider.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screens/detail/detail_screen.dart';
import 'package:flutter/material.dart';

import '../../../models/product_model.dart';


class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(product: product,),
        ),
        );
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: contentColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8,),
                Center(
                  child: Hero(
                    tag: product.image,
                    child: Image.asset(
                      product.image,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                    padding: EdgeInsets.only(left: 10),
                  child: Text(
                    product.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "\$${product.price}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Row(
                      children: List.generate(
                          product.colors.length,
                          (index) => Container(
                            width: 18,
                            height: 18,
                            margin: EdgeInsets.only(right: 4),
                            decoration: BoxDecoration(
                              color: product.colors[index],
                              shape: BoxShape.circle,
                            ),
                          ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          // for favorite icon
          Positioned(
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      provider.toggleFavorite(product);
                    },
                    child: Icon(
                      provider.isExist(product)?
                          Icons.favorite:
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }
}
