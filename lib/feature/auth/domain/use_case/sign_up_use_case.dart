
import 'package:flutter_templete/feature/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class SignUpUseCase {
  final AuthRepository _authRepository;

  SignUpUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  Future<void> call({required email, required password}) async {
    return _authRepository.signUp(email: email, password: password);
  }
}