
import 'package:flutter_templete/core/session/session_manager.dart';
import 'package:flutter_templete/core/utils/result.dart';
import 'package:flutter_templete/feature/auth/data/model/user_dto.dart';
import 'package:flutter_templete/feature/auth/domain/model/login.dart';
import 'package:flutter_templete/feature/auth/domain/model/user.dart';
import 'package:flutter_templete/feature/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  Future<Result<Login?>> call({required User user}) async {
    final userDto = UserDto.fromDomain(user);
    final result = await _authRepository.login(userDto: userDto);
    if((result.code == 200 || result.code == 201)) {
      final Login login = result.data!.toDomain();
      await SessionManager.saveSession(
          accessToken: login.accessToken,
          expiredAt: login.accessTokenExpiredAt,
          userId: login.id,
          email: login.email,
          password: user.password,
          grantType: login.grantType
      );
    }
    return result.map((dto) => dto?.toDomain());
  }
}