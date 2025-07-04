import 'package:flutter_templete/core/utils/result.dart';

abstract class ResumeEditorRepository {
  Future<Result<String>> loadHtmlFromAssets({required double width});
  Future<Result<String>> loadHtmlFromServer();
}
