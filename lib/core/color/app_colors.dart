import 'dart:ui';

import 'package:flutter/material.dart';

/**
 * AppColors
 *
 * 이 클래스는 애플리케이션에서 사용할 색상을 정리한 정적(static) 컬러 팔레트입니다.
 * 특정 색상을 코드 내에서 반복적으로 사용하지 않고, 일관된 색상을 유지하기 위해 사용됩니다.
 *
 * 사용법:
 * ```dart
 * Container(
 *   color: AppColors.purple500, // 지정된 색상을 쉽게 사용 가능
 *   child: Text(
 *     "Hello World",
 *     style: TextStyle(color: AppColors.white),
 *   ),
 * )
 * ```
 */

class AppColors {
  static const Color purple200 = Color(0xFFBB86FC);
  static const Color purple500 = Color(0xFF6200EE);
  static const Color purple700 = Color(0xFF3700B3);
  static const Color purple900 = Color(0xFF1E0066);

  static const Color teal200 = Color(0xFF03DAC5);
  static const Color teal700 = Color(0xFF018786);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color colorF3F4F5 = Color(0xFFF3F4F5);
  static const Color color999999 = Color(0xFF999999);
  static const Color colorDB2771 = Color(0xFFDB2771);
  static const Color color666666 = Color(0xFF666666);
  static const Color colorD0D1D2 = Color(0xFFD0D1D2);
  static const Color color1E1F1F = Color(0xFF1E1F1F);
  static const Color colorF8F9FA = Color(0xFFF8F9FA);
  static const Color colorE2E6E9 = Color(0xFFE2E6E9);
  static const Color colorFAFAFA = Color(0xFFFAFAFA);
  static const Color color73676D = Color(0xFF73676D);
  static const Color buttonBackground = color666666;
  static const Color buttonPressed = color1E1F1F;
  static const Color buttonDisabled = color999999;
  static const Color transparent = Colors.transparent;


  static const Color buttonWhitePressed = Color(0x0D000000);
}