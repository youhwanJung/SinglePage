import 'package:flutter/material.dart';
import 'package:flutter_templete/feature/resume_editor/presentation/widget/content_first_section_widget.dart';
import 'package:flutter_templete/feature/resume_editor/presentation/widget/content_profile_header_section_widget.dart';
import 'package:flutter_templete/feature/resume_editor/presentation/widget/content_second_section_widget.dart';
import 'package:flutter_templete/feature/resume_editor/presentation/widget/content_third_section_widget.dart';

class ContentSectionWidget extends StatelessWidget {
  final double width;
  final double height;

  const ContentSectionWidget({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    final contentWidth = width * 0.65;
    final contentHeight = height;

    return Container(
      width: contentWidth,
      height: contentHeight,
      padding: EdgeInsets.all(16),
      color: Colors.green.withOpacity(0.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ContentProfileHeaderSectionWidget(width: contentWidth, height: contentHeight),
          SizedBox(height: 10,),
          ContentFirstSectionWidget(width: contentWidth, height: contentHeight),
          SizedBox(height: 10,),
          ContentSecondSectionWidget(width: contentWidth, height: contentHeight),
          SizedBox(height: 10,),
          Expanded(
            child: ContentThirdSectionWidget()
          )
        ],
      ),
    );
  }
}
