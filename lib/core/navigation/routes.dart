import 'package:flutter/material.dart';
import 'package:flutter_templete/feature/server_call/presentation/server_call_screen.dart';
import 'package:flutter_templete/feature/server_call/presentation/server_call_view_model.dart';
import 'package:flutter_templete/feature/splash/presentation/splash_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../feature/alert_dialog/presentation/alert_dialog_screen.dart';
import '../../feature/button/presentation/button_screen.dart';
import '../../feature/detail/presentaion/detail_screen.dart';
import '../../feature/main_screen.dart';
import '../../feature/splash/presentation/splash_screen.dart';
import '../../feature/text_field/presentation/text_field_screen.dart';
import '../di/di_setup.dart';
import 'package:flutter_templete/core/navigation/route_names.dart';

/**
 * AppRouter
 *
 * 이 클래스는 Flutter 애플리케이션의 라우팅을 관리하는 클래스입니다.
 * GoRouter 라이브러리를 사용하여 화면 이동을 처리합니다.
 *
 * 주요 기능:
 * - `initialLocation: '/'`: 앱 실행 시 첫 번째로 보여질 화면을 설정합니다.
 * - `routes`: 앱에서 사용할 모든 화면을 등록합니다.
 * - `ShellRoute`: 바텀 네비게이션이 필요한 화면들을 `MainScreen` 내에서 관리합니다.
 * - `GoRoute`: 바텀 네비게이션이 필요 없는 독립적인 화면을 정의합니다.
 * - `CustomTransitionPage`: 화면 전환 시 애니메이션을 설정할 수 있으며, 기본적으로 애니메이션을 제거하여 즉시 전환됩니다.
 *
 * 사용법:
 * - `context.push('/home');`
 *   - 새로운 화면을 스택에 추가하여 이동합니다.
 *   - 바텀 네비게이션이 유지된 상태에서 해당 화면이 나타납니다.
 *
 * - `context.go('/login');`
 *   - 현재 화면을 제거하고 새로운 화면으로 이동합니다.
 *   - 바텀 네비게이션이 없는 독립적인 화면으로 이동할 때 사용합니다.
 *
 * 예제:
 * ```dart
 * MaterialApp.router(
 *   routerConfig: AppRouter.router,
 * )
 * ```
 */

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.splash,
    routes:[

      /**
       * Navigation Tab이 보이는 화면들
       * mainScreen안에, route가 설정된 화면들이 보입니다.
       */
      ShellRoute(
        builder: (context, state, child) {
          return MainScreen(child: child);
        },
        routes: [
          GoRoute(
              path: RouteNames.button,
              pageBuilder: (context, state) => CustomTransitionPage(
                  key: state.pageKey,
                  child: ButtonScreen(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return child;
                  }
              )
          ),
          GoRoute(
              path: RouteNames.textField,
              pageBuilder: (context, state) => CustomTransitionPage(
                  key: state.pageKey,
                  child: TextFieldScreen(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return child;
                  }
              )
          ),
          GoRoute(
              path: RouteNames.alertDialog,
              pageBuilder: (context, state) => CustomTransitionPage(
                  key: state.pageKey,
                  child: AlertDialogScreen(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return child;
                  }
              )
          ),
          GoRoute(
              path: RouteNames.serverCall,
              pageBuilder: (context, state) => CustomTransitionPage(
                  key: state.pageKey,
                  child: ChangeNotifierProvider(
                    create: (context) => getIt<ServerCallViewModel>(),
                    child: ServerCallScreen()
                  ),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return child;
                  }
              )
          ),
        ]
      ),

      /**
       * Navigation Tab이 보이지 않는 화면들
       */
      GoRoute(
        path: RouteNames.splash,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: ChangeNotifierProvider(
            create: (context) => getIt<SplashViewModel>(),
            child: SplashScreen(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
            },
        )
      ),
      GoRoute(
        path: RouteNames.detail,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: DetailScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
            },
        )
      )
    ]
  );
}
