import 'package:flutter/material.dart';

void showCustomSnackBar(
    BuildContext context, String message, String imagePath) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: 1),
      content: Row(
        children: [
          Image(
            image: AssetImage(imagePath),
            height: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            message,
          ),
        ],
      ), // Use the provided message text
    ),
  );
}
