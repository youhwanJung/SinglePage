import 'package:flutter/material.dart';
import 'package:flutter_templete/core/session/session_manager.dart';
import 'package:flutter_templete/feature/home/domain/use_case/get_templete_list_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class DrawerNavigationViewModel extends ChangeNotifier {

  String _id = '';
  String _email = '';
  int _selectedMenuIndex = 0;

  DrawerNavigationViewModel(
      ) {
    print('[INITIALIZED]: DrawerNavigation VIEW_MODEL');
  }


  String get id => _id;
  String get email => _email;
  int get selectedMenuIndex => _selectedMenuIndex;

  void init() {
    _selectedMenuIndex = 0;
    notifyListeners();
  }

  void selectMenuIndex(int index) {
    if (_selectedMenuIndex != index) {
      _selectedMenuIndex = index;
      notifyListeners();
    }
  }

  Future<void> setUserInfo() async {
    _id = (await SessionManager.getId())!;
    _email = (await SessionManager.getEmail())!;
  }

  Future<void> logout() async {
    SessionManager.clearSession();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
