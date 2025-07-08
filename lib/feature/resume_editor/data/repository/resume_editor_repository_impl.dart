import 'package:flutter/services.dart';
import 'package:flutter_templete/core/utils/result.dart';
import 'package:flutter_templete/feature/resume_editor/domain/repository/resume_editor_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:webview_flutter/webview_flutter.dart';

@Singleton(as: ResumeEditorRepository)
class CaptureResultRepositoryImpl implements ResumeEditorRepository {
  @override
  /**
   * html 페이지 디바이스 크기에 따른 불러오기, js 파일 출가하기 (문자열 기반 들고오기여서 이렇게 할 수 밖에)
   */
  Future<Result<String>> loadHtmlFromAssets({required double width,}) async {
    try {
      /**
       * html 파일 읽어옴
       */
      final String originalHtml = await rootBundle.loadString('assets/html/profile_one.html');
      /**
       * Js 파일 전부 읽어옴
       */
      final jsInit = await rootBundle.loadString('assets/html/profile_style_init.js');
      final jsController = await rootBundle.loadString('assets/html/profile_style_controller.js');
      final jsActions = await rootBundle.loadString('assets/html/profile_style_actions.js');

      const double contentWidth = 794.0;
      final double initialScale = (width / contentWidth);

      print("initialScale : ${initialScale}");
      /**
       * initial-scale : 페이지가 처음 로드 될 때, 초기확대 / 축소 비율
       */
      final String viewportMeta = '''
  <meta name="viewport" initial-scale=$initialScale"> 
  ''';
      String modifiedHtml = originalHtml;
      final RegExp viewportRegex = RegExp(r'<meta name="viewport"[^>]*>');
      if (viewportRegex.hasMatch(modifiedHtml)) {
        modifiedHtml = modifiedHtml.replaceFirst(viewportRegex, viewportMeta);
      } else {
        modifiedHtml = modifiedHtml.replaceFirst('<head>', '<head>\n$viewportMeta');
      }

      final jsScripts = '''
<script>$jsInit</script>
<script>$jsController</script>
<script>$jsActions</script>
''';
      modifiedHtml = modifiedHtml.replaceFirst('</body>', '$jsScripts\n</body>');
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
