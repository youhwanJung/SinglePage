import 'package:flutter_templete/feature/server_call/domain/model/get.dart';
import 'package:flutter_templete/feature/server_call/domain/repository/ServerCallRepository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/result.dart';
import '../../domain/model/post.dart';
import '../data_source/server_call_remote_data_source.dart';
import '../model/mapper/get_mapper.dart';
import '../model/mapper/post_mapper.dart';
import '../model/request/post_request.dart';

@Singleton(as : ServerCallRepository)
class ServerCallRepositoryImpl implements ServerCallRepository {
  final ServerCallRemoteDataSource _serverCallRemoteDataSource;

  ServerCallRepositoryImpl({
    required ServerCallRemoteDataSource serverCallRemoteDataSource,
}) : _serverCallRemoteDataSource = serverCallRemoteDataSource;

  @override
  Future<void> serverPostExample({required String userName, required int countNum}) async {
    final PostrequestDto = PostRequest(userName: userName, countNum: countNum);
    final result = await _serverCallRemoteDataSource.serverCallPostExample(PostrequestDto);
  }

  @override
  Future<void> serverGetExample() async {
    final result = await _serverCallRemoteDataSource.serverCallGetExample();
  }
}