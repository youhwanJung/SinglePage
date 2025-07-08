import 'package:flutter/material.dart';

class ContentFirstSectionWidget extends StatelessWidget {
  final double width;
  final double height;
  const ContentFirstSectionWidget({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height * 0.25,
      color: Colors.deepPurple.withOpacity(0.3),
    );
  }
}
