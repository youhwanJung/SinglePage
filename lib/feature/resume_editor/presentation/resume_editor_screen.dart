import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_templete/core/color/app_colors.dart';
import 'package:flutter_templete/feature/resume_editor/presentation/resume_editor_view_model.dart';
import 'package:flutter_templete/feature/resume_editor/presentation/widget/content_section_widget.dart';
import 'package:flutter_templete/feature/resume_editor/presentation/widget/side_bar_section_widget.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';

class ResumeEditorScreen extends StatefulWidget {
  const ResumeEditorScreen({super.key});

  @override
  State<ResumeEditorScreen> createState() => _ResumeEditorScreenState();
}

class _ResumeEditorScreenState extends State<ResumeEditorScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ResumeEditorViewModel>();
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Container(
          padding: EdgeInsets.all(12),
          color: Colors.white,
          child: InteractiveViewer(
              constrained: true,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double width = constraints.maxWidth;
                  double height = width * 1.414;
                  return Center(
                    child: Container(
                      width: width,
                      height: height,
                      color: Colors.blue.withOpacity(0.3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SideBarWidget(width: width, height: height,),
                          ContentSectionWidget(width: width, height: height,),
                        ],
                      ),
                    ),
                  );
                },
              )),
        ),
      ),
    );
  }
}
