import '../../../../core/utils/result.dart';
import '../model/get.dart';
import '../model/post.dart';

abstract class ServerCallRepository {
  Future<void> serverPostExample({required String userName, required int countNum});
  Future<void> serverGetExample();
}