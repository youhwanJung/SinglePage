import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_templete/core/server/dio_config.dart';
import 'package:flutter_templete/core/utils/result.dart';
import 'package:flutter_templete/feature/auth/data/model/login_dto.dart';
import 'package:flutter_templete/feature/auth/data/model/sign_up_dto.dart';
import 'package:flutter_templete/feature/auth/data/model/user_dto.dart';
import 'package:flutter_templete/feature/auth/domain/model/login.dart';
import 'package:flutter_templete/feature/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';



@Singleton(as : AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final Dio _dio;
  AuthRepositoryImpl(DioConfig dioConfig) : _dio = dioConfig.dio;

  @override
  Future<Result<SignUpDto?>> signUp({required UserDto userDto}) async {
    try {
      final response = await _dio.post(
          '/users',
          data: userDto.toJson()
      );
      final result = Result<SignUpDto?>.fromJson(
          response.data,
              (json) => SignUpDto.fromJson(json)
      );
      return result;
    }on DioException catch (e) {
      final data = e.response?.data;
      final result = Result<SignUpDto?>.fromJson(data, (_) => null);
      return result;
    }catch (e){
      final result = Result(
          status: 'ERROR',
          message: '$e',
          code: -1,
          data: null
      );
      return result;
    }
  }


  /**
   * Test Account
   *  dh_joo@gmail.com
   *  1234567a!
   */
  @override
  Future<Result<LoginDto?>> login({required UserDto userDto}) async {
    try {
      final response = await _dio.post(
          '/auth/login',
          data: userDto.toJson()
      );

      /// 로그인 성공
      final result = Result<LoginDto>.fromJson(
          response.data,
              (json) => LoginDto.fromJson(json)
      );
      return result;

      /// 로그인 실패
    } on DioException catch (e) {
      final data = e.response?.data;
      final result = Result<LoginDto?>.fromJson(data, (_) => null);
      return result;

    }catch (e) {
      /// 알수 없는 오류
      final result = Result(
          status: 'ERROR',
          message: '$e',
          code: -1,
          data: null
      );
      return result;
    }
  }
}