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
import 'package:flutter_templete/feature/auth/data/repository/auth_repository_impl.dart'
    as _i857;
import 'package:flutter_templete/feature/auth/domain/repository/auth_repository.dart'
    as _i102;
import 'package:flutter_templete/feature/auth/domain/use_case/login_use_case.dart'
    as _i90;
import 'package:flutter_templete/feature/auth/domain/use_case/sign_up_use_case.dart'
    as _i235;
import 'package:flutter_templete/feature/auth/presentation/auth_view_model.dart'
    as _i5;
import 'package:flutter_templete/feature/resume_editor/data/repository/resume_editor_repository_impl.dart'
    as _i967;
import 'package:flutter_templete/feature/resume_editor/domain/repository/resume_editor_repository.dart'
    as _i1007;
import 'package:flutter_templete/feature/resume_editor/domain/use_case/load_html_from_assets_use_case.dart'
    as _i957;
import 'package:flutter_templete/feature/resume_editor/domain/use_case/load_html_from_server_use_case.dart'
    as _i570;
import 'package:flutter_templete/feature/resume_editor/presentation/resume_editor_view_model.dart'
    as _i630;
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
    gh.factory<_i630.ResumeEditorViewModel>(
        () => _i630.ResumeEditorViewModel());
    gh.singleton<_i361.Dio>(() => networkModule.dio());
    gh.singleton<_i1007.ResumeEditorRepository>(
        () => _i967.CaptureResultRepositoryImpl());
    gh.singleton<_i65.DioConfig>(
        () => networkModule.dioConfig(gh<_i361.Dio>()));
    gh.singleton<_i15.ServerCallRemoteDataSource>(
        () => _i847.ServerCallRemoteDataSourceImpl(gh<_i65.DioConfig>()));
    gh.singleton<_i957.LoadHtmlFromAssetsUseCase>(() =>
        _i957.LoadHtmlFromAssetsUseCase(
            resumeEditorRepository: gh<_i1007.ResumeEditorRepository>()));
    gh.singleton<_i570.LoadHtmlFromServerUseCase>(() =>
        _i570.LoadHtmlFromServerUseCase(
            resumeEditorRepository: gh<_i1007.ResumeEditorRepository>()));
    gh.singleton<_i102.AuthRepository>(
        () => _i857.AuthRepositoryImpl(gh<_i65.DioConfig>()));
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
    gh.singleton<_i235.SignUpUseCase>(
        () => _i235.SignUpUseCase(authRepository: gh<_i102.AuthRepository>()));
    gh.singleton<_i90.LoginUseCase>(
        () => _i90.LoginUseCase(authRepository: gh<_i102.AuthRepository>()));
    gh.factory<_i5.AuthViewModel>(() => _i5.AuthViewModel(
          gh<_i235.SignUpUseCase>(),
          gh<_i90.LoginUseCase>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i770.NetworkModule {}
