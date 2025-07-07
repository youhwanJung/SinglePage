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
      final box =
          _containerKey.currentContext?.findRenderObject() as RenderBox?;
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
            child: Scrollbar(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: vm.canScroll
                    ? const ScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                /// SingleChildScrollView 와 InteractiveViewer를 같이 쓰기 위한 처절한 노력의 결과
                child: Listener(
                  onPointerDown: (event) {
                    vm.addEvent(event);
                  },
                  onPointerUp: (event) {
                    vm.clearEvents();
                    vm.setCanScroll(true);
                  },

                  onPointerMove: (event) {
                    if (vm.events.length == 2) {
                      vm.setCanScroll(false);
                    }
                  },
                  child: InteractiveViewer(
                    child: Container(
                      width: double.infinity,
                      height: vm.webViewHeight ??
                          MediaQuery.of(context).size.height,
                      child: Stack(
                        children: [
                          Center(
                            child: vm.webViewController == null
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : WebViewWidget(
                                    controller: vm.webViewController!,
                                  ),
                          ),
                          LayoutBuilder(
                            builder: (context, constraints) {
                              double parentWidth = constraints.maxWidth;
                              return Center(
                                child: Container(
                                  width: parentWidth * 0.81,
                                  color: Colors.red.withOpacity(0.3),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: parentWidth * 0.285,
                                        height: double.infinity,
                                        color: Colors.black.withOpacity(0.3),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
