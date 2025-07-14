import 'package:flutter_templete/core/utils/result.dart';
import 'package:flutter_templete/feature/home/domain/model/templete.dart';
import 'package:flutter_templete/feature/home/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class GetTempleteListUseCase {
  final HomeRepository _homeRepository;

  GetTempleteListUseCase({
    required HomeRepository homeRepository,
  }) : _homeRepository = homeRepository;

  Future<Result<List<Templete>?>> call() async {
    final result = await _homeRepository.getTempleteList();
    return result.mapList((dto) => dto.toDomain());
  }
}