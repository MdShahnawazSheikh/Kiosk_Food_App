import 'package:flutter/material.dart';
import 'package:kiosk_food/addButton.dart';

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String productName;
  final double price;
  final String productSize;

  const ProductCard(
      this.imagePath, this.productName, this.price, this.productSize,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        _showProductDetailsDialog(context);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 2),
        width: screenWidth / 2.2,
        height: screenHeight / 3.5,
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
          padding: EdgeInsets.only(
              right: (screenWidth / 25),
              left: (screenWidth / 25),
              top: (screenWidth / 23)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  imagePath,
                  height: screenHeight / 5,
                  alignment: Alignment.center,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: screenWidth / 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    ("Size: ${this.productSize}"),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: screenWidth / 26,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '₹ $price',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: screenWidth / 25,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 58, 147, 61),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight / 65,
                  ),
                  AddRemoveButton(
                      imagePath: this.imagePath,
                      price: this.price,
                      productSize: this.productSize,
                      productName: this.productName),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showProductDetailsDialog(BuildContext context) {
    String description =
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quas repudiandae optio doloribus fuga, fugiat similique tempora nobis.";
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(20.0), // Adjust the radius as needed
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                imagePath,
                height: MediaQuery.of(context).size.height / 4,
              ),
              Text(
                productName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Size: $productSize',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text("Description:\n$description", overflow: TextOverflow.clip),
              const SizedBox(height: 5),
              Text(
                '₹ $price',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 58, 147, 61),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
