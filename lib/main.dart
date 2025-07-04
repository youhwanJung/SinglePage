import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'app.dart';
import 'core/di/di_setup.dart';

void main() {
  diSetup(); //DI setUp
  runApp(const MyApp());
}