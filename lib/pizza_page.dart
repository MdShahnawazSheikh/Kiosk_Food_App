import 'package:flutter/material.dart';
import 'package:kiosk_food/product_card.dart';

class PizzaPage extends StatefulWidget {
  const PizzaPage({super.key});

  @override
  State<PizzaPage> createState() => _PizzaPageState();
}

class _PizzaPageState extends State<PizzaPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    List<Product> pizzaData = [
      Product("assets/pizza_img/pizza1.png", "Chicken Tikka", 203.87, "Large"),
      Product(
          "assets/pizza_img/pizza2.png", "Chicken Barbecue", 234.54, "Small"),
      Product("assets/pizza_img/pizza3.png", "Veggie", 203.87, "Small"),
      Product("assets/pizza_img/pizza4.png", "Combination", 234.54, "Medium"),
      Product("assets/pizza_img/pizza5.png", "Margherita", 234.54, "Large"),
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
