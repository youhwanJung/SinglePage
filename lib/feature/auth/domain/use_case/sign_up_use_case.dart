
import 'package:flutter_templete/core/utils/result.dart';
import 'package:flutter_templete/feature/auth/data/model/user_dto.dart';
import 'package:flutter_templete/feature/auth/domain/model/sign_up.dart';
import 'package:flutter_templete/feature/auth/domain/model/user.dart';
import 'package:flutter_templete/feature/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class SignUpUseCase {
  final AuthRepository _authRepository;

  SignUpUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  Future<Result<SignUp?>> call({required User user}) async {
    final userDto = UserDto.fromDomain(user);
    final result = await _authRepository.signUp(userDto: userDto);
    return result.map((dto) => dto?.toDomain());
  }
}