import 'package:ecommerce_app/constants.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final Icon leadingIcon;
  final Icon trailingIcon;
  final VoidCallback? onTrailingIconPressed;

  const CustomSearchBar({
    super.key,
    required this.hintText,
    required this.leadingIcon,
    required this.trailingIcon,
    this.onTrailingIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: contentColor,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          leadingIcon,
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
              style: const TextStyle(color: Colors.black),
            ),
          ),
          Container(
            height: 25,
            width: 1.5,
            color: Colors.grey.shade300,
            margin: const EdgeInsets.symmetric(horizontal: 10),
          ),
          IconButton(
            onPressed: onTrailingIconPressed,
            icon: trailingIcon,
          ),
        ],
      ),
    );
  }
}
