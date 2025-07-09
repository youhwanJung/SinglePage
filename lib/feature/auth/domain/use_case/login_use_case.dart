
import 'package:flutter_templete/core/utils/result.dart';
import 'package:flutter_templete/feature/auth/domain/model/login.dart';
import 'package:flutter_templete/feature/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  Future<Result<Login>> call({required String email, required String password}) async {
    return _authRepository.login(email: email, password: password);
  }
}