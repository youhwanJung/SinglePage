import 'package:flutter_templete/core/di/di_setup.dart';
import 'package:flutter_templete/feature/auth/presentation/auth_view_model.dart';
import 'package:flutter_templete/feature/auth/presentation/login_screen.dart';
import 'package:flutter_templete/feature/auth/presentation/sign_up_screen.dart';
import 'package:flutter_templete/feature/drawer_navigation/drawer_navigation.dart';
import 'package:flutter_templete/feature/drawer_navigation/drawer_navigation_view_model.dart';
import 'package:flutter_templete/feature/home/presentation/home_screen.dart';
import 'package:flutter_templete/feature/home/presentation/home_view_model.dart';
import 'package:flutter_templete/feature/resume_editor/presentation/resume_editor_screen.dart';
import 'package:flutter_templete/feature/resume_editor/presentation/resume_editor_test_screen.dart';
import 'package:flutter_templete/feature/resume_editor/presentation/resume_editor_view_model.dart';
import 'package:flutter_templete/feature/splash/presentation/splash_screen.dart';
import 'package:flutter_templete/feature/splash/presentation/splash_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_templete/core/navigation/route_names.dart';


class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.splash,
    routes:[
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
          path: RouteNames.login,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: ChangeNotifierProvider(
              create: (context) => getIt<AuthViewModel>(),
              child: LoginScreen(),
            ),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return child;
            },
          )
      ),
      GoRoute(
          path: RouteNames.signUp,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: ChangeNotifierProvider(
              create: (context) => getIt<AuthViewModel>(),
              child: SignUpScreen(),
            ),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return child;
            },
          )
      ),
      GoRoute(
          path: RouteNames.navigation,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: ChangeNotifierProvider(
              create: (context) => getIt<DrawerNavigationViewModel>(),
              child: DrawerNavigation(),
            ),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return child;
            },
          )
      ),
      // GoRoute(
      //     path: RouteNames.home,
      //     pageBuilder: (context, state) => CustomTransitionPage(
      //       key: state.pageKey,
      //       child: ChangeNotifierProvider(
      //         create: (context) => getIt<HomeViewModel>(),
      //         child: HomeScreen(),
      //       ),
      //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //         return child;
      //       },
      //     )
      // ),
      // GoRoute(
      //   path: RouteNames.resumeEditor,
      //   pageBuilder: (context, state) => CustomTransitionPage(
      //     key: state.pageKey,
      //     child: ChangeNotifierProvider(
      //       create: (context) => getIt<ResumeEditorViewModel>(),
      //       child: ResumeEditorScreen(),
      //     ),
      //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //       return child;
      //       },
      //   )
      // ),
      // GoRoute(
      //     path: RouteNames.testResumeEditor,
      //     pageBuilder: (context, state) => CustomTransitionPage(
      //       key: state.pageKey,
      //       child: ChangeNotifierProvider(
      //         create: (context) => getIt<ResumeEditorViewModel>(),
      //         child: ResumeEditorTestScreen(),
      //       ),
      //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //         return child;
      //       },
      //     )
      // )
    ]
  );
}
