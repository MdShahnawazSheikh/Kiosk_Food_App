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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isAdded
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: _decrementCount,
                  ),
                  Text(
                    '$count',
                    style: TextStyle(fontSize: 18),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: _incrementCount,
                  ),
                ],
              )
            : ElevatedButton(
                onPressed: _toggleButton,
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: Text('      ADD      '),
              ),
      ],
    );
  }
}
