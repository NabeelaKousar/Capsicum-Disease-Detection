import 'package:flutter/material.dart';

class VGap extends StatelessWidget {
  final double gap;

  const VGap(this.gap, {super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(height: screenHeight * gap);
  }
}

class HGap extends StatelessWidget {
  final double gap;

  const HGap(this.gap, {super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(width: screenWidth * gap);
  }
}
