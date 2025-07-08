import 'package:flutter/material.dart';

class ContentProfileHeaderSectionWidget extends StatelessWidget {
  final double width;
  final double height;

  const ContentProfileHeaderSectionWidget({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height * 0.15,
      color: Colors.deepPurple.withOpacity(0.3),
    );
  }
}
