
import 'package:flutter_templete/core/utils/result.dart';
import 'package:flutter_templete/feature/auth/data/model/user_dto.dart';
import 'package:flutter_templete/feature/auth/domain/model/sign_up.dart';
import 'package:flutter_templete/feature/auth/domain/model/user.dart';
import 'package:flutter_templete/feature/auth/domain/repository/auth_repository.dart';
import 'package:flutter_templete/feature/check_templete_screen/domain/repository/check_templete_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class GetTempleteListUseCase {
  final CheckTempleteRepository _checkTempleteRepository;

  GetTempleteListUseCase({
    required CheckTempleteRepository checkTempleteRepository,
  }) : _checkTempleteRepository = checkTempleteRepository;

  Future<void> call() async {
    return await _checkTempleteRepository.getTempleteList();
  }
}