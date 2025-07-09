import 'package:flutter_templete/core/utils/result.dart';
import 'package:flutter_templete/feature/resume_editor/domain/repository/resume_editor_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class LoadHtmlFromServerUseCase {
  final ResumeEditorRepository _resumeEditorRepository;

  LoadHtmlFromServerUseCase({
    required ResumeEditorRepository resumeEditorRepository,
  }) : _resumeEditorRepository = resumeEditorRepository;

  Future<void> call({required String width}) async {
    return _resumeEditorRepository.loadHtmlFromServer();
  }
}
