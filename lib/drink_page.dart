import 'package:flutter/material.dart';

class DrinkPage extends StatefulWidget {
  const DrinkPage({super.key});

  @override
  State<DrinkPage> createState() => _DrinkPageState();
}

class _DrinkPageState extends State<DrinkPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Drink Page"),
      ),
    );
  }
}
