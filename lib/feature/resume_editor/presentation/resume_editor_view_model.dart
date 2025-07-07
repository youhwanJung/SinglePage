import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_templete/core/utils/result.dart';
import 'package:flutter_templete/feature/resume_editor/domain/use_case/load_html_from_assets_use_case.dart';
import 'package:flutter_templete/feature/resume_editor/domain/use_case/load_html_from_server_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:webview_flutter/webview_flutter.dart';

@injectable
class ResumeEditorViewModel extends ChangeNotifier {
  double _currentZoom = 1.0;
  double? _webViewHeight;
  final _events = [];
  bool _canScroll = true;


  final LoadHtmlFromAssetsUseCase _loadHtmlFromAssetsUseCase;
  final LoadHtmlFromServerUseCase _loadHtmlFromServerUseCase;

  double get currentZoom => _currentZoom;
  double? get webViewHeight => _webViewHeight;
  get events => _events;
  bool get canScroll => _canScroll;

  WebViewController? _controller;
  WebViewController? get webViewController => _controller;

  ResumeEditorViewModel(
      this._loadHtmlFromAssetsUseCase,
      this._loadHtmlFromServerUseCase,
      ) {
    print('[INITIALIZED]: RESUME_EDITOR_SCREEN');
  }

  void setCanScroll(bool value) {
    _canScroll = value;
    notifyListeners();
  }

  void addEvent(final event) {
    _events.add(event);
    notifyListeners();
  }

  void clearEvents() {
    _events.clear();
    notifyListeners();
  }

  Future<void> loadHtmlFromAssets(double width) async {
    Result<String> result = await _loadHtmlFromAssetsUseCase.call(width: width);
    if(result.isSuccess) {
      final newController = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..addJavaScriptChannel(
            'FlutterPostMessageChannel',
          onMessageReceived: (JavaScriptMessage message) {
            final heightStr = message.message;
            final height = double.tryParse(heightStr);
            if (height != null && _webViewHeight == null) {  // 최초 한 번만 처리
              _webViewHeight = height;
              notifyListeners();
            }
          },
        )
        ..loadHtmlString(result.data!);
      _controller = newController;
      notifyListeners();
    }else {
      return;
    }
  }
}
