import 'package:flutter/material.dart';
import 'package:kiosk_food/cartButton.dart';

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String productName;
  final double price;
  final String productSize;
  const ProductCard(
      this.imagePath, this.productName, this.price, this.productSize,
      {super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth / 2.2,
      // height: screenHeight / 3.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              alignment: Alignment.center,
              child: Image.asset(
                imagePath,
                height: 100,
              ),
            ),
            Text(
              productName,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              ("Size: $productSize"),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '₹ $price',
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 58, 147, 61),
              ),
            ),
            AddRemoveButton(),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
