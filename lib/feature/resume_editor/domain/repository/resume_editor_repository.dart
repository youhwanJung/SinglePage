import 'package:flutter_templete/core/utils/result.dart';

abstract class ResumeEditorRepository {
  Future<void> loadHtmlFromAssets({required double width});
  Future<void> loadHtmlFromServer();
}
