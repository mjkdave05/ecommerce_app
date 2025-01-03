import 'package:flutter/material.dart';

import '../../../constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          style: IconButton.styleFrom(
            backgroundColor: contentColor,
            padding: EdgeInsets.all(15),
          ),
          onPressed: () {},
          icon: Image.asset(
            "assets/images/icon.png",
            height: 15,
          ),
        ),
        IconButton(
          style: IconButton.styleFrom(
            backgroundColor: contentColor,
            padding: EdgeInsets.all(15),
          ),
          onPressed: () {},
          iconSize: 25,
          icon: Icon(
            Icons.notifications_outlined,
          ),
        ),
      ],
    );
  }
}
