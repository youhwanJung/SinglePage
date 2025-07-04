import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'dio_config.dart';

@module
abstract class NetworkModule {
  @Singleton()
  Dio dio() => Dio();

  @Singleton()
  DioConfig dioConfig(Dio dio) => DioConfig(dio);
}