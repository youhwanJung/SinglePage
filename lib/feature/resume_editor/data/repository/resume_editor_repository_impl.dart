import 'package:flutter/services.dart';
import 'package:flutter_templete/core/utils/result.dart';
import 'package:flutter_templete/feature/resume_editor/domain/repository/resume_editor_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:webview_flutter/webview_flutter.dart';

@Singleton(as: ResumeEditorRepository)
class CaptureResultRepositoryImpl implements ResumeEditorRepository {
  @override
  Future<Result<String>> loadHtmlFromAssets({required double width}) async {
    try {
      final String originalHtml = await rootBundle.loadString('assets/html/profile.html');
      const double contentWidth = 794.0;

      final double initialScale = (width / contentWidth);

      print(initialScale);

      final String viewportMeta = '''
  <meta name="viewport", initial-scale=$initialScale, maximum-scale=1.0, minimum-scale=$initialScale, user-scalable=no"> 
  ''';
      String modifiedHtml = originalHtml;
      final RegExp viewportRegex = RegExp(r'<meta name="viewport"[^>]*>');
      if (viewportRegex.hasMatch(modifiedHtml)) {
        modifiedHtml = modifiedHtml.replaceFirst(viewportRegex, viewportMeta);
      } else {
        modifiedHtml = modifiedHtml.replaceFirst('<head>', '<head>\n$viewportMeta');
      }
      return Result.success(modifiedHtml);
    }catch (e) {
      return Result.failure("Html 파일 로드 실패");
    }
  }

  @override
  Future<Result<String>> loadHtmlFromServer() {
    // TODO: implement loadHtmlFromServer
    throw UnimplementedError();
  }

}
