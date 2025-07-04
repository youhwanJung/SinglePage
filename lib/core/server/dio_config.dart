import 'package:dio/dio.dart';

class DioConfig {
  final Dio _dio;

  static String accessToken = '';
  static String refreshToken = '';

  DioConfig(this._dio) {
    _dio.options = BaseOptions(
      baseUrl: "https://httpbin.org",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print("REQUEST: ${options.method} ${options.uri}");
        options.headers["Authorization"] = "My Token";
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print("RESPONSE: ${response.statusCode}");
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        print("ERROR: ${e.message}");
        return handler.next(e);
      }
    ));
  }
  Dio get dio => _dio;
}