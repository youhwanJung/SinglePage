import 'package:flutter_templete/core/utils/result.dart';
import 'package:flutter_templete/feature/auth/domain/model/login.dart';


abstract class AuthRepository {
  Future<void> signUp({required String email, required String password});
  Future<Result<Login>> login({required String email, required String password});
}