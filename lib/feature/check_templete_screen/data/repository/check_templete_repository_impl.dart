import 'package:dio/dio.dart';
import 'package:flutter_templete/core/server/dio_config.dart';
import 'package:flutter_templete/core/utils/result.dart';
import 'package:flutter_templete/feature/check_templete_screen/data/model/templete_dto.dart';
import 'package:flutter_templete/feature/check_templete_screen/domain/repository/check_templete_repository.dart';
import 'package:injectable/injectable.dart';



@Singleton(as : CheckTempleteRepository)
class CheckTempleteRepositoryImpl implements CheckTempleteRepository {
  final Dio _dio;
  CheckTempleteRepositoryImpl(DioConfig dioConfig) : _dio = dioConfig.dio;

  @override
  Future<void> getTempleteList() async {
    try {
      final response = await _dio.get(
          '/templates',
      );
      final result = Result<List<TempleteDto>?>.fromJson(
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

  }
}