import 'package:flutter_templete/feature/server_call/data/model/response/post_response.dart';

import '../../../domain/model/post.dart';

class PostMapper {
  static Post fromResponse(PostResponse response) {
    return Post(userName: response.userName, countNum: response.countNum);
  }
}
