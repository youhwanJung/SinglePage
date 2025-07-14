import 'package:flutter/material.dart';
import 'package:flutter_templete/core/enum/templete_status.dart';
import 'package:flutter_templete/core/session/session_manager.dart';
import 'package:flutter_templete/core/utils/result.dart';
import 'package:flutter_templete/feature/home/domain/model/templete.dart';
import 'package:flutter_templete/feature/home/domain/use_case/get_templete_list_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends ChangeNotifier {
  final GetTempleteListUseCase _getTempleteListUseCase;

  String _id = '';
  String _email = '';
  int _selectedMenuIndex = 0;
  List<Templete> _templeteList = [];

  HomeViewModel(
      this._getTempleteListUseCase,
      ) {
    print('[INITIALIZED]: Home VIEW_MODEL');
  }


  String get id => _id;
  String get email => _email;
  int get selectedMenuIndex => _selectedMenuIndex;
  List<Templete> get templeteList => _templeteList;

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

  Future<Result<List<Templete>?>?> fetchTempleteList() async {
    final result = await _getTempleteListUseCase.call();
    if(result.code == 200 || result.code == 201) {
      _templeteList = result!.data!;
      print(result!.data);
      notifyListeners();
      return result;
    }else {
      return result;
    }
  }

  String? getImagePathByStatus(String status) {
    switch (status) {
      case 'AVAILABLE':
        return 'assets/images/bwink_edu_01_single_12.jpg';
      case 'PENDING':
        return 'assets/images/bwink_msc_09_single_05.jpg';
      case 'WORKING':
        return null;
    }
  }

  String getStatusStringPathByStatus(String status) {
    switch (status) {
      case 'AVAILABLE':
        return '개발중..';
      case 'PENDING':
        return '검토중..';
      case 'WORKING':
        return '이용 가능';
      default:
        return '알 수 없는 상태';
    }
  }

  Future<void> logout() async {
    SessionManager.clearSession();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
