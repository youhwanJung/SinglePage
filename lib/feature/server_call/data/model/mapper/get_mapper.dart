import 'package:flutter_templete/feature/server_call/data/model/response/post_response.dart';

import '../../../domain/model/get.dart';
import '../../../domain/model/post.dart';
import '../response/get_response.dart';

class GetMapper {
  static Get fromResponse(GetResponse response) {
    return Get(message: response.message, status: response.status);
  }
}
