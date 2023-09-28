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
    List<Product> burgerData = [
      Product("assets/burger_img/burger1.png", "Big Mac", 203.87, "Medium"),
      Product("assets/burger_img/burger1.png", "Big Mac", 203.87, "Small"),
      Product("assets/burger_img/burger2.png", "Double Patty", 234.54, "Small"),
      Product(
          "assets/burger_img/burger3.png", "Cheese Burger", 203.87, "Small"),
      Product("assets/burger_img/burger4.png", "Whooper", 234.54, "Large"),
      // Product("assets/burger_img/pizza5.png", "Veg", 234.54, "Large"),
    ];

    double screenHeight = MediaQuery.of(context).size.height;
    bool isLandscape = screenWidth > screenHeight;

    double aspectRatio = isLandscape
        ? (screenHeight / screenWidth) - 0
        : (screenWidth / screenHeight) - .2;
    print(aspectRatio);

    int widgetCount = 0;
    if (screenWidth > screenHeight) {
      widgetCount = 3;
    } else if (screenHeight > screenWidth) {
      widgetCount = 3;
    } else {
      widgetCount = 2;
    }

    // double spacing = (screenWidth-);
    return StreamBuilder<Object>(
        stream: null,
        builder: (context, snapshot) {
          return GridView.builder(
            shrinkWrap: true,
            itemCount: burgerData.length,
            physics: const ScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (widgetCount),
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
              childAspectRatio: aspectRatio,
              // mainAxisExtent: screenHeight / 3.2,
            ),
            itemBuilder: (context, index) {
              return ProductCard(
                  burgerData[index].imagePath,
                  burgerData[index].productName,
                  burgerData[index].price,
                  burgerData[index].productSize);
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
