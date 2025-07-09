import 'dart:convert';

import 'package:dio/dio.dart';

class DioConfig {
  final Dio _dio;

  static String accessToken = '';
  static String refreshToken = '';

  DioConfig(this._dio) {
    _dio.options = BaseOptions(
      baseUrl: 'http://34.64.118.148:18080/hp/api/v1',
      //baseUrl: 'https://jsonplaceholder.typicode.com',
      connectTimeout: const Duration(milliseconds: 10000),
      receiveTimeout: const Duration(milliseconds: 10000),
      sendTimeout: const Duration(milliseconds: 10000),
    );

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print("REQUEST: ${options.method} ${options.uri}");
        print("HEADERS: ${options.headers}");
        print("BODY: ${jsonEncode(options.data)}");

        //options.headers.remove('Authorization');

        return handler.next(options);
      },
      onResponse: (response, handler) {
        print("RESPONSE: ${response.statusCode}");
        return handler.next(response);
      },
      onError: (DioException e, handler) {
       // print("ERROR: ${e.response?.data}");
        return handler.next(e);
      }
    ));
  }
  Dio get dio => _dio;
}