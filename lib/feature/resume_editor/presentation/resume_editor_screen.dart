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

class ResumeEditorScreen extends StatefulWidget {
  const ResumeEditorScreen({super.key});

  @override
  State<ResumeEditorScreen> createState() => _ResumeEditorScreenState();
}

class _ResumeEditorScreenState extends State<ResumeEditorScreen> {
  final GlobalKey _containerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final box = _containerKey.currentContext?.findRenderObject() as RenderBox?;
      final width = box?.size.width;
      if (width != null) {
        final vm = context.read<ResumeEditorViewModel>();
        await vm.loadHtmlFromAssets(width); //Html 파일 Assets 에서 가져오기.
      }
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
          padding: const EdgeInsets.all(16),
          child: InteractiveViewer(
            child: Stack(
              children: [
                Positioned.fill(
                  child: vm.webViewController == null
                      ? const Center(child: CircularProgressIndicator())
                      : WebViewWidget(controller: vm.webViewController!),
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: ElevatedButton(
                    onPressed: () {
                      vm.webViewController?.runJavaScript("alert('버튼 눌림');");
                    },
                    child: const Text("새로고침"),
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}
