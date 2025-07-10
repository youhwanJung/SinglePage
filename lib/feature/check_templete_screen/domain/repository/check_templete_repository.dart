import 'package:flutter_templete/core/utils/result.dart';
import 'package:flutter_templete/feature/auth/data/model/login_dto.dart';
import 'package:flutter_templete/feature/auth/data/model/sign_up_dto.dart';
import 'package:flutter_templete/feature/auth/data/model/user_dto.dart';
import 'package:flutter_templete/feature/auth/domain/model/login.dart';


abstract class CheckTempleteRepository {
  Future<void> getTempleteList();
}