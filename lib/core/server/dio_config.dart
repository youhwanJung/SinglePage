import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_templete/core/enum/session_key.dart';
import 'package:flutter_templete/core/session/session_manager.dart';
import 'package:flutter_templete/core/utils/logger.dart';

class DioConfig {
  final Dio _dio;

  DioConfig(this._dio) {
    _dio.options = BaseOptions(
      baseUrl: 'http://34.64.118.148:18080/hp/api/v1',
      connectTimeout: const Duration(milliseconds: 10000),
      receiveTimeout: const Duration(milliseconds: 10000),
      sendTimeout: const Duration(milliseconds: 10000),
    );

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
      final path = options.path.toLowerCase();
      final noAuthPaths = ['/auth/login', '/users'];
      if(!noAuthPaths.any((p) => path.contains(p))) {
        final token = await SessionManager.getToken();
        final grantType = await SessionManager.getGrantType();
        if (token != null) {
         options.headers['Authorization'] = '${grantType} ${token}';
        }
      }

      logger.i('''
[REQUEST]
→ ${options.method} ${options.uri}
→ Headers: ${options.headers}
→ Body: ${options.data}
'''
      );
      return handler.next(options);
      },
      onResponse: (response, handler) {
        logger.i('''
[RESPONSE]
← ${response.statusCode} ${response.requestOptions.uri}
← Headers: ${response.headers.map}
← Data: ${response.data}
'''
        );
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        logger.w('''
[ERROR]
× URI       : ${e.requestOptions.uri}
× STATUS    : ${e.response?.statusCode}
× ERROR BODY: ${e.response?.data}
'''
        );
        return handler.next(e);
      }
    ));
  }
  Dio get dio => _dio;
}