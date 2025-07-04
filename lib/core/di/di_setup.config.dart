// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_templete/core/server/dio_config.dart' as _i65;
import 'package:flutter_templete/core/server/network_module.dart' as _i770;
import 'package:flutter_templete/feature/server_call/data/data_source/server_call_remote_data_source.dart'
    as _i15;
import 'package:flutter_templete/feature/server_call/data/data_source/server_call_remote_data_source_impl.dart'
    as _i847;
import 'package:flutter_templete/feature/server_call/data/repository/server_call_repository_impl.dart'
    as _i34;
import 'package:flutter_templete/feature/server_call/domain/repository/ServerCallRepository.dart'
    as _i96;
import 'package:flutter_templete/feature/server_call/domain/use_case/server_get_example_use_case.dart'
    as _i69;
import 'package:flutter_templete/feature/server_call/domain/use_case/server_post_example_use_case.dart'
    as _i930;
import 'package:flutter_templete/feature/server_call/presentation/server_call_view_model.dart'
    as _i87;
import 'package:flutter_templete/feature/splash/presentation/splash_view_model.dart'
    as _i662;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.factory<_i662.SplashViewModel>(() => _i662.SplashViewModel());
    gh.singleton<_i361.Dio>(() => networkModule.dio());
    gh.singleton<_i65.DioConfig>(
        () => networkModule.dioConfig(gh<_i361.Dio>()));
    gh.singleton<_i15.ServerCallRemoteDataSource>(
        () => _i847.ServerCallRemoteDataSourceImpl(gh<_i65.DioConfig>()));
    gh.singleton<_i96.ServerCallRepository>(() => _i34.ServerCallRepositoryImpl(
        serverCallRemoteDataSource: gh<_i15.ServerCallRemoteDataSource>()));
    gh.singleton<_i69.ServerGetExampleUseCase>(() =>
        _i69.ServerGetExampleUseCase(
            serverCallRepository: gh<_i96.ServerCallRepository>()));
    gh.singleton<_i930.ServerPostExampleUseCase>(() =>
        _i930.ServerPostExampleUseCase(
            serverCallRepository: gh<_i96.ServerCallRepository>()));
    gh.factory<_i87.ServerCallViewModel>(() => _i87.ServerCallViewModel(
          gh<_i930.ServerPostExampleUseCase>(),
          gh<_i69.ServerGetExampleUseCase>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i770.NetworkModule {}
