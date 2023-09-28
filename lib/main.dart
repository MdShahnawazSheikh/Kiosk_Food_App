import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kiosk_food/burger_page.dart';
import 'package:kiosk_food/carousel.dart';
import 'package:kiosk_food/checkout.dart';
import 'package:kiosk_food/drink_page.dart';
import 'package:kiosk_food/pizza_page.dart';
import 'package:kiosk_food/trending_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'paymentSuccessPage.dart';
import 'cartManager.dart'; // Import the CartManager class
// import 'package:pay/pay.dart';

const bool kReleaseMode = bool.fromEnvironment('dart.vm.product');
void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MyApp(), // Wrap your app
      ),
    );

/* void main(List<String> args) {
  runApp(MyApp());
}
 */
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flavio Beta',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: PaymentSuccessPage(orderId: "Example ID"),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Index of the selected tab

  // Define the list of pages to be displayed when each tab is selected
  final List<Widget> _pages = [
    const PizzaPage(), // Pizza
    const BurgerPage(), // Burger
    const DrinkPage(), // Cold Drink
    const TrendingPage(), // Recommend
  ];

  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      'assets/ads_img/ad1.jpg',
      'assets/ads_img/ad2.jpg',
      'assets/ads_img/ad3.jpg',
      'assets/ads_img/ad4.jpg',
      // Add your image paths here
    ];
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 20),
                    child: ImageCarousel(imageList: imageList),
                  ),
                  _pages[_selectedIndex],
                ],
              ),
            ),
          ),
        ), // Display the selected page
        bottomNavigationBar: FloatingNavbar(
          borderRadius: 8,
          backgroundColor: Colors.deepPurple,
          selectedItemColor: Colors.deepPurple,
          currentIndex: _selectedIndex, // Current selected index
          onTap: _onItemTapped, // Function to handle item tap
          items: [
            // Define the navigation bar items with icons
            FloatingNavbarItem(icon: Icons.local_pizza, title: 'Pizza'),
            FloatingNavbarItem(icon: FontAwesomeIcons.burger, title: 'Burger'),
            FloatingNavbarItem(
                icon: FontAwesomeIcons.bottleWater, title: 'Drinks'),
            FloatingNavbarItem(
                icon: FontAwesomeIcons.arrowUpWideShort, title: 'Trending'),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          onPressed: () {
            _showCartDialog(context);
          },
          child: const Icon(Icons.shopping_cart),
        ),
      ),
    );
  }

  // Function to handle item tap and change the selected page
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Function to show the cart dialog
  void _showCartDialog(BuildContext context) {
    double totalPrice = CartManager().calculateTotalPrice();
    final screenWidth = MediaQuery.of(context).size.width;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actionsPadding: EdgeInsets.all(30),
          titlePadding: EdgeInsets.all(30),
          title: const Text('Your Cart'),
          content: StatefulBuilder(
            // Wrap the content in StatefulBuilder
            builder: (BuildContext context, StateSetter setState) {
              return SizedBox(
                width: double.maxFinite,
                child: ListView.builder(
                  itemCount: CartManager().addedProducts.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image(
                        image: AssetImage(
                            CartManager().addedProducts[index].imagePath),
                        width: screenWidth / 10,
                      ),
                      title:
                          Text(CartManager().addedProducts[index].productName),
                      subtitle: Text(
                        'Size: ${CartManager().addedProducts[index].size}\nQuantity: ${CartManager().addedProducts[index].quantity}\n\nPrice: ₹${CartManager().addedProducts[index].price.toStringAsFixed(2)}',
                      ),
                      trailing: Container(
                        width: screenWidth / 10,
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                CupertinoIcons.cart_badge_minus,
                                color: Color.fromARGB(255, 51, 106, 245),
                              ),
                              onPressed: () {
                                totalPrice =
                                    CartManager().calculateTotalPrice();
                                _deductItem(index, setState);
                                setState(() {});
                                // Pass setState to trigger a rebuild
                              },
                            ),
                            IconButton(
                              icon: const Icon(
                                CupertinoIcons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                totalPrice =
                                    CartManager().calculateTotalPrice();
                                // Pass setState to trigger a rebuild
                                _removeProduct(index, setState);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          actions: <Widget>[
            Text(
              "Grand Total: ₹ ${totalPrice.toStringAsFixed(2)}",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
            ElevatedButton(
              onPressed: () {
                if (totalPrice > 0) {
                  Navigator.pop(context);
                  double finalPrice = double.parse(
                      CartManager().calculateTotalPrice().toStringAsFixed(2));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CheckOutPage(paymentAmount: finalPrice),
                      ));
                } else {
                  Fluttertoast.showToast(
                    msg: "Please add items to cart to proceed!",
                    timeInSecForIosWeb: 4,
                  );
                }
              },
              child: const Text('Checkout'),
            ),
          ],
        );
      },
    );
  }

// Function to remove a product from the cart
  void _deductItem(int index, StateSetter setState) {
    CartManager().deductQuantity(index); // Deduct quantity if possible
    setState(() {}); // Trigger a rebuild of the StatefulBuilder content
  }

  // Function to remove a product from the cart
  void _removeProduct(int index, StateSetter setState) {
    CartManager().removeProduct(index);
    setState(() {}); // Trigger a rebuild of the StatefulBuilder content
  }
}

// ...
