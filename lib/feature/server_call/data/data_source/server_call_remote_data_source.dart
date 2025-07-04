import '../../../../core/utils/result.dart';
import '../model/request/post_request.dart';
import '../model/response/get_response.dart';
import '../model/response/post_response.dart';

abstract class ServerCallRemoteDataSource {
  Future<Result<PostResponse>> serverCallPostExample(PostRequest PostrequestDto);
  Future<Result<GetResponse>> serverCallGetExample();
}