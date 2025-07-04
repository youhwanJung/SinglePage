
import 'package:flutter_templete/core/di/di_setup.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
void diSetup() {
  getIt.init();
}