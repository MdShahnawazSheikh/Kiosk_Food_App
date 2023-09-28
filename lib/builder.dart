import 'package:flutter/material.dart';

class CustomBuilder extends StatelessWidget {
  final int itemCount;
  final int widgetCount;
  final Widget widgetToBuild;
  final double aspectRatio;
  const CustomBuilder(
      {super.key,
      required this.itemCount,
      required this.widgetCount,
      required this.widgetToBuild,
      required this.aspectRatio});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: itemCount,
      physics: const ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: (widgetCount),
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        childAspectRatio: aspectRatio,
        // mainAxisExtent: screenHeight / 3.2,
      ),
      itemBuilder: (context, index) {
        return widgetToBuild;
      },
    );
  }
}
