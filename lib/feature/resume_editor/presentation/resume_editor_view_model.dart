import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_templete/core/utils/result.dart';
import 'package:flutter_templete/feature/resume_editor/domain/use_case/load_html_from_assets_use_case.dart';
import 'package:flutter_templete/feature/resume_editor/domain/use_case/load_html_from_server_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:webview_flutter/webview_flutter.dart';

@injectable
class ResumeEditorViewModel extends ChangeNotifier {
  final LoadHtmlFromAssetsUseCase _loadHtmlFromAssetsUseCase;
  final LoadHtmlFromServerUseCase _loadHtmlFromServerUseCase;

  WebViewController? _controller;
  WebViewController? get webViewController => _controller;

  ResumeEditorViewModel(
      this._loadHtmlFromAssetsUseCase,
      this._loadHtmlFromServerUseCase,
      ) {
    print('[INITIALIZED]: RESUME_EDITOR_SCREEN');
  }

  Future<void> loadHtmlFromAssets(double width) async {
    Result<String> result = await _loadHtmlFromAssetsUseCase.call(width: width);
    if(result.isSuccess) {
      final newController = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadHtmlString(result.data!);
      _controller = newController;
      notifyListeners();
    }else {
      return;
    }
  }
}
