import 'package:flutter/material.dart';

class ContentSecondSectionWidget extends StatelessWidget {
  final double width;
  final double height;
  const ContentSecondSectionWidget({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height * 0.3,
      color: Colors.deepPurple.withOpacity(0.3),
    );
  }
}
