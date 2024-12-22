import 'package:flutter/material.dart';

import '../constants.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int cuttentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 60,
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
          clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.grid_view_outlined,
                  size: 25,
                  color: cuttentIndex == 0 ? kprimaryColor : Colors.grey.shade400,
                ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                size: 25,
                color: cuttentIndex == 1 ? kprimaryColor : Colors.grey.shade400,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 25,
                color: cuttentIndex == 3 ? kprimaryColor : Colors.grey.shade400,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person,
                size: 25,
                color: cuttentIndex == 4 ? kprimaryColor : Colors.grey.shade400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
