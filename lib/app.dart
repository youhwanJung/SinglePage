import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_templete/core/theme/theme.dart';
import 'core/navigation/routes.dart';
import 'core/constants/app_strings.dart';

/**
 * MyApp
 *
 * 이 클래스는 Flutter 애플리케이션의 최상위 위젯으로, 전체 앱의 기본 설정을 담당합니다.
 *
 * 주요 기능:
 * - `theme`: 라이트 모드 및 다크 모드 테마 설정
 * - `routerConfig`: 앱의 화면 이동을 관리하는 라우터 설정 (`GoRouter` 사용)
 * - `ScreenUtil`: 반응형 UI 구현을 위한 `ScreenUtil` 설정 (디자인 기준 크기: 375x812)
 * - `SafeArea`: UI 요소가 시스템 UI(노치, 상태바 등)와 겹치지 않도록 보호
 *
 * 사용법:
 * ```dart
 * void main() {
 *   runApp(const MyApp());
 * }
 * ```
 */

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 800),
        builder: (context, child) {
          return SafeArea(
              child: MaterialApp.router(
                  title: AppStrings.appTitle,
                  debugShowCheckedModeBanner: false,
                  theme: AppTheme.lightTheme,
                  darkTheme: AppTheme.darkTheme,
                  themeMode: ThemeMode.system,
                  routerConfig: AppRouter.router));
          },
    );
  }
}
