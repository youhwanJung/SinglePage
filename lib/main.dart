import 'package:flutter/material.dart';
import 'app.dart';
import 'core/di/di_setup.dart';

void main() {
  diSetup(); //DI setUp
  runApp(const MyApp());
}