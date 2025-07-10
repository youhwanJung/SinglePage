import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_templete/core/utils/result.dart';
import 'package:flutter_templete/feature/auth/domain/model/login.dart';
import 'package:flutter_templete/feature/auth/domain/model/sign_up.dart';
import 'package:flutter_templete/feature/auth/domain/model/user.dart';
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

  Future<Result<SignUp?>> signUp() async {
    User user = User(
        email: _signUpEmail,
        password: _signUpConfirmPassword
    );
    final result = await _signUpUseCase.call(user: user);
    return result;
  }

  Future<Result<Login?>> login() async {
    User user = User(
        email: _loginEmail,
        password: _loginPassword
    );
    final result = await _loginUseCase.call(user: user);
    return result;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
