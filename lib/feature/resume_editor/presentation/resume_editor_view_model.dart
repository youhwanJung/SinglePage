import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';


@injectable
class ResumeEditorViewModel extends ChangeNotifier {
  String _profileImageUrl = '';
  String get profileImageUrl => _profileImageUrl;

  String _name = '';
  String get name => _name;

  String _intro = '';
  String get intro => _intro;


  ResumeEditorViewModel() {
    print('[INITIALIZED]: RESUME_EDITOR_SCREEN');
  }

  void setProfileImageUrl(String url) {
    _profileImageUrl = url;
    notifyListeners();
  }

  void setName(String newName) {
    _name = newName;
    notifyListeners();
  }

  void setIntro(String newIntro) {
    _intro = newIntro;
    notifyListeners();
  }
}
