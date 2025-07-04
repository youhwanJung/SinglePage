import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color/app_colors.dart';

/**
 * AppTheme
 *
 * 이 클래스는 애플리케이션의 라이트 모드 및 다크 모드 테마를 관리합니다.
 * `ThemeData`를 사용하여 전체적인 스타일을 정의하며, 테마는 `lightTheme`과 `darkTheme`으로 구분됩니다.
 *
 * 주요 테마 설정 요소:
 * - `primaryColor`: 앱의 기본 색상을 설정합니다.
 * - `scaffoldBackgroundColor`: 전체 배경 색상을 지정합니다.
 * - `appBarTheme`: 앱바(AppBar)의 색상 및 스타일을 지정합니다.
 * - `textTheme`: 기본 텍스트 스타일을 정의합니다.
 * - `elevatedButtonTheme`: `ElevatedButton`의 기본 스타일을 설정합니다.
 * - `fontFamily`: 앱에서 사용할 폰트를 지정합니다.
 *   - 폰트 파일을 `assets/fonts/`에 추가해야 합니다.
 *   - `pubspec.yaml`에서 폰트를 등록해야 합니다.
 *
 * 사용법:
 *
 * ```dart
 * MaterialApp(
 *   theme: AppTheme.lightTheme,
 *   darkTheme: AppTheme.darkTheme,
 *   themeMode: ThemeMode.system, // 시스템 설정에 따라 테마 변경
 *   home: MyHomePage(),
 * )
 * ```
 */

class AppTheme {

  ///Light Theme
  static ThemeData lightTheme = ThemeData(
    fontFamily : "NotoSans",
    brightness: Brightness.light,
    primaryColor: AppColors.color1E1F1F,
    scaffoldBackgroundColor: AppColors.colorF8F9FA,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.colorF8F9FA,
      foregroundColor: AppColors.colorF8F9FA,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(fontSize: 16.sp, color: Colors.black),
      bodyMedium: TextStyle(fontSize: 14.sp, color: Colors.black87),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );

  ///Dark Theme
  static ThemeData darkTheme = ThemeData(
    fontFamily : "NotoSans",
    brightness: Brightness.dark,
    primaryColor: Colors.deepPurple,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.white70),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}

