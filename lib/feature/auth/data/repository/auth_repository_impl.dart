import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_templete/core/server/dio_config.dart';
import 'package:flutter_templete/core/utils/result.dart';
import 'package:flutter_templete/feature/auth/data/model/login_dto.dart';
import 'package:flutter_templete/feature/auth/domain/model/login.dart';
import 'package:flutter_templete/feature/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';



@Singleton(as : AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final Dio _dio;
  AuthRepositoryImpl(DioConfig dioConfig) : _dio = dioConfig.dio;

  @override
  Future<void> signUp({required String email, required String password}) async {

  }

  @override
  Future<Result<Login>> login({required String email, required String password}) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {
          "email": 'dh_joo@gmail.com',
          "password": '1234567a!',
        },

      );
      print(response.message);
      print(response.status);
      print(response.successCode);
      print(response.data?.id);
      print(response.data?.accessToken);
      print(response.data?.email);
      print(response.data?.grantType);
      print(response.data?.accessTokenExpiredAt);

      final Result<Login> result = Result<Login>.fromJson(json as Map<String, dynamic>, (json) => LoginDto.fromJson(json).toDomain());
      return result;
    } on DioException catch (e) {
      final Result<Login> result = Result<Login>.fromJson(e.response!.data, (_) => null);
      return result;
    }catch (e) {
      return Result(
        status: 'ERROR',
        message: '알 수 없는 오류가 발생했습니다',
        successCode: -1,
        data: null,
      );
    }
  }
}