import 'package:flutter/material.dart';
import 'package:flutter_templete/core/utils/result.dart';
import 'package:flutter_templete/feature/server_call/domain/use_case/server_post_example_use_case.dart';
import 'package:injectable/injectable.dart';
import '../domain/use_case/server_get_example_use_case.dart';

@injectable
class ServerCallViewModel extends ChangeNotifier {
  final ServerPostExampleUseCase _serverPostExampleUseCase;
  final ServerGetExampleUseCase _serverGetExampleUseCase;

  ServerCallViewModel(
      this._serverPostExampleUseCase,
      this._serverGetExampleUseCase) {
    print('[INITIALIZED]: SERVER CALL VIEW_MODEL');
  }

  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }

  Future<void> serverPostExample() async {
    final response = await _serverPostExampleUseCase.call(userName: "made by youhwan", countNum: _count);
    if (response.isSuccess) {
      print("[SUCCESS] Server Call Post");
      print("Server Call Post : userName : ${response.data?.userName}");
      print("Server Call Post : countNum : ${response.data?.countNum}");
    } else {
      print("[FAILURE] Server Call Post");
      print("Error: ${response.error}");
    }
  }

  Future<void> serverGetExample() async {
    final response = await _serverGetExampleUseCase.call();
    if(response.isSuccess) {
      print("[SUCCESS] Server Call Get");
      print("Server Call Get : message : ${response.data?.message}");
      print("Server Call Get : status : ${response.data?.status}");
    } else {
      print("[FAILURE] Server Call Get");
      print("Error: ${response.error}");
    }
  }
}
