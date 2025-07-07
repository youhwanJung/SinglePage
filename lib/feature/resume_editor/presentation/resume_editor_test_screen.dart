import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_templete/core/color/app_colors.dart';
import 'package:flutter_templete/feature/resume_editor/presentation/resume_editor_view_model.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';

class ResumeEditorTestScreen extends StatefulWidget {
  const ResumeEditorTestScreen({super.key});

  @override
  State<ResumeEditorTestScreen> createState() => _ResumeEditorScreenState();
}

class _ResumeEditorScreenState extends State<ResumeEditorTestScreen> {
  final GlobalKey _containerKey = GlobalKey();
  final events = [];
  bool canScroll = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final box =
          _containerKey.currentContext?.findRenderObject() as RenderBox?;
      final width = box?.size.width;
      final height = box?.size.height;
      print(width);
      print(height);
    });
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
          key: _containerKey,
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: canScroll
              ? const ScrollPhysics()
              : const NeverScrollableScrollPhysics(),
            child: Listener(
              /// 손 댔을때
              onPointerDown: (event) {
                events.add(event.pointer);
                print("new event");
              },
              /// 손 땟을때
              onPointerUp: (event) {
                events.clear();
                setState(() {
                  canScroll = true;
                });
                print("events cleared");
              },
              /// 포인터로 움직일때
              onPointerMove: (event) {
                if (events.length == 2) {
                  setState(() {
                    canScroll = false;
                  });
                }
              },
              child: Column(
                 children: [
                   InteractiveViewer(
                       child: Center(
                         child: Container(
                           width: 300,
                           height: 400,
                           color: Colors.blue.withOpacity(0.3),
                         ),
                       ),
                   ),
                   InteractiveViewer(
                       child: Center(
                         child: Container(
                           width: 300,
                           height: 400,
                           color: Colors.red.withOpacity(0.3),
                         ),
                       ),
                   ),
                 ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
