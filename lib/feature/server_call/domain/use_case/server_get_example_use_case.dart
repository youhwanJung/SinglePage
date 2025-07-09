
import 'package:injectable/injectable.dart';
import '../../../../core/utils/result.dart';
import '../model/get.dart';
import '../model/post.dart';
import '../repository/ServerCallRepository.dart';

@Singleton()
class ServerGetExampleUseCase {
  final ServerCallRepository _serverCallRepository;

  ServerGetExampleUseCase({
    required ServerCallRepository serverCallRepository,
  }) : _serverCallRepository = serverCallRepository;

  Future<void> call() async {
    return _serverCallRepository.serverGetExample();
  }
}