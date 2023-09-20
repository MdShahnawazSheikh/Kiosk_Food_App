import 'package:flutter/material.dart';
import 'package:kiosk_food/product_card.dart';

class BurgerPage extends StatefulWidget {
  const BurgerPage({super.key});

  @override
  State<BurgerPage> createState() => _BurgerPageState();
}

class _BurgerPageState extends State<BurgerPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    List<Product> pizzaData = [
      Product("assets/burger_img/burger1.png", "Big Mac", 203.87, "Medium"),
      Product("assets/burger_img/burger2.png", "Double Patty", 234.54, "Small"),
      Product(
          "assets/burger_img/burger3.png", "Cheese Burger", 203.87, "Small"),
      Product("assets/burger_img/burger4.png", "Whooper", 234.54, "Large"),
      // Product("assets/burger_img/pizza5.png", "Veg", 234.54, "Large"),
    ];

    double screenHeight = MediaQuery.of(context).size.height;
    bool isLandscape = screenWidth > screenHeight;

    double aspectRatio = isLandscape
        ? (screenHeight / screenWidth) / .48
        : (screenWidth / screenHeight) / .72;

    int widgetCount = 0;
    if (screenWidth > screenHeight) {
      widgetCount = 3;
    } else if (screenHeight > screenWidth) {
      widgetCount = 2;
    } else {
      widgetCount = 2;
    }

    // double spacing = (screenWidth-);
    return OrientationBuilder(builder: (context, orientation) {
      return GridView.builder(
        shrinkWrap: true,
        itemCount: pizzaData.length,
        physics: const ScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (widgetCount),
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: aspectRatio,
          // mainAxisExtent: screenHeight / 3.2,
        ),
        itemBuilder: (context, index) {
          return ProductCard(
              pizzaData[index].imagePath,
              pizzaData[index].productName,
              pizzaData[index].price,
              pizzaData[index].productSize);
        },
      );
    });
  }
}

class Product {
  final String imagePath;
  final String productName;
  final double price;
  final String productSize;
  Product(this.imagePath, this.productName, this.price, this.productSize);
}
