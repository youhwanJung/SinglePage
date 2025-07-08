import 'package:flutter/material.dart';

class SideBarContentSectionWidget extends StatelessWidget {

  const SideBarContentSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow.withOpacity(0.3),
      padding: EdgeInsets.all(10),
    );
  }
}
