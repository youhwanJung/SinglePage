import 'package:flutter/material.dart';
import 'package:flutter_templete/feature/check_templete_screen/domain/use_case/get_templete_list_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckTempleteViewModel extends ChangeNotifier {
  final GetTempleteListUseCase _getTempleteListUseCase;
  CheckTempleteViewModel(
      this._getTempleteListUseCase,
      ) {
    print('[INITIALIZED]: CheckTemplete VIEW_MODEL');
  }


  @override
  void dispose() {
    super.dispose();
  }
}
