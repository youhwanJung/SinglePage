import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_templete/app.dart';
import 'package:flutter_templete/core/navigation/route_names.dart';
import 'package:flutter_templete/core/session/session_manager.dart';
import 'package:flutter_templete/feature/splash/presentation/splash_view_model.dart';
import 'package:flutter_templete/widgets/alert_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

/**
 * Splash Screen
 *
 * Splash Screen 역활
 * - 앱 실행 시 API 요청
 * - 데이터 캐싱
 * - 인증 상태 확인 (자동로그인)
 * - 권한 요청
 * - 앱 최신 업데이트 확인
 */

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final vm = context.read<SplashViewModel>();
      await vm.checkPermissions(
          onDenied: () async {
            showPermissionDialog(
                context: context,
                title: "해당 어플리케이션은 권한 설정이 필수입니다.",
                content: vm.deniedMessage,
                confirmText: "확인",
                onConfirm: () {
                  SystemNavigator.pop();
                },
            );
          },
          onGranted: () async {
            Future.delayed(const Duration(seconds: 1),() async {
              final canAuthLogin = await SessionManager.canAutoLogin();
              if(canAuthLogin) {
                context.go(RouteNames.login);
              }else {
                context.go(RouteNames.checkTemplete);
              }
            });
          },
          onPermanentlyDenied: () async {
            showPermissionDialog(
                context: context,
                title: "설정에서 해당 어플리케이션에 필요한 권한을 활성화 시켜주세요",
                content: vm.permanetlyDeinedMessage,
                confirmText: "확인",
                onConfirm: () async {
                  vm.setDidRequestSettings(true);
                  final opened = await openAppSettings();
                  if (!opened) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('앱 설정을 열 수 없습니다')),
                    );
                  }
                  SystemNavigator.pop();
                },
            );
          }
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png', width: 75.w, height: 75.h),
            ]
        ),
      ),
    );
  }
}
