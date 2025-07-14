import 'package:dio/dio.dart';
import 'package:flutter_templete/core/server/dio_config.dart';
import 'package:flutter_templete/core/utils/result.dart';
import 'package:flutter_templete/feature/home/data/model/templete_dto.dart';
import 'package:flutter_templete/feature/home/domain/repository/home_repository.dart';

import 'package:injectable/injectable.dart';



@Singleton(as : HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final Dio _dio;
  HomeRepositoryImpl(DioConfig dioConfig) : _dio = dioConfig.dio;

  @override
  Future<Result<List<TempleteDto?>?>> getTempleteList() async {
    try {
      final response = await _dio.get(
          '/templates',
      );

      final result = Result<List<TempleteDto>?>.fromJson(
        response.data,
          (jsonList) => (jsonList as List)
            .map((json) => TempleteDto.fromJson(json as Map<String, dynamic>))
            .toList(),
      );

      return result;
    }on DioException catch (e) {
      final data = e.response?.data;
      final result = Result<List<TempleteDto?>?>.fromJson(data, (_) => null);
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
}