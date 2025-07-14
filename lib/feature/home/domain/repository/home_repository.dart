import 'package:flutter_templete/core/utils/result.dart';
import 'package:flutter_templete/feature/home/data/model/templete_dto.dart';

abstract class HomeRepository {
  Future<Result<List<TempleteDto?>?>> getTempleteList();
}