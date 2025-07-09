import 'package:dio/dio.dart';
import 'package:flutter_templete/feature/server_call/data/data_source/server_call_remote_data_source.dart';
import 'package:flutter_templete/feature/server_call/data/model/response/get_response.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/server/dio_config.dart';
import '../../../../core/utils/result.dart';
import '../model/request/post_request.dart';
import '../model/response/post_response.dart';

@Singleton(as: ServerCallRemoteDataSource)
class ServerCallRemoteDataSourceImpl implements ServerCallRemoteDataSource {
  final Dio _dio;

  ServerCallRemoteDataSourceImpl(DioConfig dioConfig) : _dio = dioConfig.dio;

  @override
  Future<void> serverCallPostExample(PostRequest request) async {
    try {
      final response = await _dio.post(
          '/post',
          data : request.toJson()
      );
      if(response.statusCode == 200) {
        final jsonData = response.data['json'];


      } else {

      }
    } catch (e) {

    }
  }

  @override
  Future<void> serverCallGetExample() async {
    try {
      final response = await _dio.get(
        '/get',
        queryParameters: {
          'message' : "Success Get",
          "status" : 200
        }
      );
      if(response.statusCode == 200) {
        final jsonData = response.data['args'];

      }else {

      }
    }catch (e) {

    }
  }
}