import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_templete/core/utils/result.dart';
import 'package:flutter_templete/feature/auth/domain/use_case/login_use_case.dart';
import 'package:flutter_templete/feature/auth/domain/use_case/sign_up_use_case.dart';
import 'package:flutter_templete/feature/server_call/domain/use_case/server_post_example_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthViewModel extends ChangeNotifier {
  final SignUpUseCase _signUpUseCase;
  final LoginUseCase _loginUseCase;

  String _loginEmail = '';
  String _loginPassword = '';
  String _signUpEmail = '';
  String _signUpPassword = '';
  String _signUpConfirmPassword = '';

  AuthViewModel(
      this._signUpUseCase,
      this._loginUseCase,

      ) {
    print('[INITIALIZED]: Auth VIEW_MODEL');
  }

  String get loginEmail => _loginEmail;

  String get loginPassword => _loginPassword;

  String get signUpEmail => _signUpEmail;

  String get signUpPassword => _signUpPassword;

  String get signUpConfirmPassword => _signUpConfirmPassword;

  set loginEmail(String value) {
    _loginEmail = value;
    notifyListeners();
  }

  set loginPassword(String value) {
    _loginPassword = value;
    notifyListeners();
  }

  set signUpEmail(String value) {
    _signUpEmail = value;
    notifyListeners();
  }

  set signUpPassword(String value) {
    _signUpPassword = value;
    notifyListeners();
  }

  set signUpConfirmPassword(String value) {
    _signUpConfirmPassword = value;
    print(_signUpConfirmPassword);
    notifyListeners();
  }

  Future<void> signUp() async {
    if (_signUpPassword != _signUpConfirmPassword) {
      print('비밀번호가 일치하지 않습니다.');
      return;
    }
    try {
      await _signUpUseCase.call(email: _signUpEmail, password: _signUpPassword);
    } catch (e) {
    }
  }

  Future<void> login() async {
    try {
      final result = await _loginUseCase.call(email: _loginEmail, password: _loginPassword);
      if(result.successCode == 200) {
        print(result.message);
        print(result.status);
        print(result.successCode);
        print(result.data?.id);
        print(result.data?.accessToken);
        print(result.data?.email);
        print(result.data?.grantType);
        print(result.data?.accessTokenExpiredAt);
      }else {
        print(result.message);
        print(result.status);
        print(result.successCode);
        print(result.data);
      }

    }catch (e) {

    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
