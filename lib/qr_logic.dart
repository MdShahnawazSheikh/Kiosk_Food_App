import 'package:flutter/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQr extends StatelessWidget {
  final String data;
  const GenerateQr({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return QrImageView(
      data: this.data,
      version: QrVersions.auto,
      size: 200.0,
    );
  }
}
