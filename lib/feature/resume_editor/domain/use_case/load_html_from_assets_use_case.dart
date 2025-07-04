import 'package:flutter_templete/core/utils/result.dart';
import 'package:flutter_templete/feature/resume_editor/domain/repository/resume_editor_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class LoadHtmlFromAssetsUseCase {
  final ResumeEditorRepository _resumeEditorRepository;

  LoadHtmlFromAssetsUseCase({
    required ResumeEditorRepository resumeEditorRepository,
  }) : _resumeEditorRepository = resumeEditorRepository;

  Future<Result<String>> call({required double width}) async {
    return _resumeEditorRepository.loadHtmlFromAssets(width: width);
  }
}
