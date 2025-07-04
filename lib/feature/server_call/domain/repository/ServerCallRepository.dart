import '../../../../core/utils/result.dart';
import '../model/get.dart';
import '../model/post.dart';

abstract class ServerCallRepository {
  Future<Result<Post>> serverPostExample({required String userName, required int countNum});
  Future<Result<Get>> serverGetExample();
}