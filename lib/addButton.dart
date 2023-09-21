import 'package:flutter/material.dart';

class AddRemoveButton extends StatefulWidget {
  @override
  _AddRemoveButtonState createState() => _AddRemoveButtonState();
}

class _AddRemoveButtonState extends State<AddRemoveButton> {
  int count = 1;
  bool isAdded = false;

  void _toggleButton() {
    setState(() {
      isAdded = !isAdded;
      // Remove the condition to allow count to reach zero
    });
  }

  void _decrementCount() {
    if (count > 0) {
      setState(() {
        count--;
        if (count == 0) {
          _toggleButton();
        }
      });
    }
  }

  void _incrementCount() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(shape: BoxShape.rectangle),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          isAdded
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: _decrementCount,
                    ),
                    Text(
                      '$count',
                      style: TextStyle(fontSize: screenwidth / 28),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: _incrementCount,
                    ),
                  ],
                )
              : ElevatedButton(
                  onPressed: _toggleButton,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 4),
                    child: Text(
                      'ADD',
                      textAlign: TextAlign.end,
                      style: TextStyle(fontSize: screenwidth / 28),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
