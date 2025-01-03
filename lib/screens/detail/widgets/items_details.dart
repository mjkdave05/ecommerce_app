import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:flutter/material.dart';

class ItemsDetails extends StatelessWidget {
  final Product product;
  const ItemsDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
         SizedBox(height: 10,),
         Row(
           children: [
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$${product.price}",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 10,),
                // for rating
                Row(
                  children: [
                    Container(
                      width: 55,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: primaryColor,
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 15,
                            color: Colors.white,
                          ),
                          SizedBox(width: 3,),
                          Text(
                            product.rate.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 5,),
                    Text(
                      product.review,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ],
                )
              ],
             ),
             Spacer(),
             Text.rich(
               TextSpan(
                 children: [
                   TextSpan(
                     text: "Seller: ",
                     style: TextStyle(
                       fontSize: 15,
                     ),
                   ),
                   TextSpan(
                     text: product.seller,
                     style: TextStyle(
                       fontSize: 15,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                 ],
               ),
             ),
           ],
         )
      ],
    );
  }
}
