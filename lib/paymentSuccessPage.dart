import 'package:flutter/material.dart';
import 'package:kiosk_food/qr_logic.dart';

class PaymentSuccessPage extends StatelessWidget {
  final String orderId; // Add any other order details we want to display

  const PaymentSuccessPage({required this.orderId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Successful'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              size: 100,
              color: Colors.green,
            ),
            const SizedBox(height: 16),
            const Text(
              'Payment Successful',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // const SizedBox(height: 16),
            GenerateQr(data: orderId.toString()),
            Text(
              'Order ID: $orderId',
              style: const TextStyle(fontSize: 18),
            ),
            // You can add more order details here if needed
          ],
        ),
      ),
    );
  }
}
