
import 'package:injectable/injectable.dart';
import '../../../../core/utils/result.dart';
import '../model/post.dart';
import '../repository/ServerCallRepository.dart';

@Singleton()
class ServerPostExampleUseCase {
  final ServerCallRepository _serverCallRepository;

  ServerPostExampleUseCase({
    required ServerCallRepository serverCallRepository,
  }) : _serverCallRepository = serverCallRepository;

  Future<void> call({required String userName, required int countNum}) async {
    return _serverCallRepository.serverPostExample(userName: userName, countNum: countNum);
  }
}