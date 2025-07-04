import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_templete/core/theme/theme.dart';
import 'core/navigation/routes.dart';
import 'core/constants/app_strings.dart';

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
