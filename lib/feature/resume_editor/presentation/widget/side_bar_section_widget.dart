import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_templete/feature/resume_editor/presentation/widget/side_bar_content_section_widget.dart';
import 'package:flutter_templete/feature/resume_editor/presentation/widget/side_bar_profile_header_section_widget.dart';

class SideBarWidget extends StatelessWidget {
  final double width;
  final double height;

  const SideBarWidget({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    final sideBarWidth = width * 0.35;
    final sideBarHeight = height;

    return Container(
      width: sideBarWidth,
      height: sideBarHeight,
      padding: EdgeInsets.all(16),
      color: Colors.red.withOpacity(0.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SideBarProfileHeaderSectionWidget(width: sideBarWidth, height: sideBarHeight,),
          SizedBox(height: 10,),
          ///----------------------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(30, (index) {
              return Container(
                width: 3,
                height: 2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              );
            }),
          ),
          ///----------------------------------------
          SizedBox(height: 10,),
          Expanded(
            child: SideBarContentSectionWidget(),
          )
        ],
      ),
    );
  }
}
