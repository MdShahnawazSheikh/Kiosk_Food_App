import 'package:flutter/material.dart';
import 'package:kiosk_food/burger_page.dart';
import 'package:kiosk_food/carousel.dart';
import 'package:kiosk_food/drink_page.dart';
import 'package:kiosk_food/pizza_page.dart';
import 'package:kiosk_food/trending_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kiosk Food Ordering',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Index of the selected tab

  // Define the list of pages to be displayed when each tab is selected
  final List<Widget> _pages = [
    // Replace these with your actual pages/screens
    PizzaPage(), // Pizza
    BurgerPage(), // Burger
    DrinkPage(), // Cold Drink
    TrendingPage(), // Recommend
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Order Food'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 20),
                child: ImageCarousel(imageList: imageList),
              ),
              _pages[_selectedIndex],
            ],
          ),
        ),
      ), // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Current selected index
        onTap: _onItemTapped, // Function to handle item tap
        items: [
          // Define the navigation bar items with icons
          BottomNavigationBarItem(
            icon: Image.asset('assets/nav_icons/pizza1.png',
                width: 30, height: 30),
            label: 'Pizza',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/nav_icons/burger.png',
                width: 30, height: 30),
            label: 'Burger',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/nav_icons/cold_drink.png',
                width: 30, height: 30),
            label: 'Cold Drink',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/nav_icons/trending.png',
                width: 30, height: 30),
            label: 'Recommend',
          ),
        ],
      ),
    );
  }

  // Function to handle item tap and change the selected page
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
