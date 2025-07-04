import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../widgets/custom_bottom_nav_bar.dart';

/**
 * MainScreen
 *
 * 이 클래스는 Flutter 애플리케이션의 메인 화면을 담당하는 StatefulWidget입니다.
 * GoRouter를 활용하여 네비게이션을 처리하며, 특정 화면에서만 바텀 네비게이션 바를 표시합니다.
 *
 * 사용법:
 *
 * MainScreen(
 *   child: 현재 화면의 위젯,
 * )
 *
 * 예제:
 *
 * MaterialApp.router(
 *   routerConfig: _router,
 *   builder: (context, state) {
 *     return MainScreen(child: state.child);
 *   },
 * )
 *
 * 기능:
 * - `_onItemTapped(int index)`: 선택한 탭에 따라 `_selectedIndex` 값을 변경하고, 해당 `_routes[index]`로 이동합니다.
 * - `_isBottomNavVisible()`: 현재 라우트가 `_routes` 리스트에 포함되어 있는 경우 바텀 네비게이션 바를 표시합니다.
 * - `CustomBottomNavBar`를 사용하여 바텀 네비게이션 UI를 관리합니다.
 * - `GoRouter`를 사용하여 화면 전환을 처리합니다.
 */

class MainScreen extends StatefulWidget {
  final Widget child;
  const MainScreen({super.key, required this.child});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<String> _routes = ['/button', '/text_field', '/alert_dialog', '/server_call'];

  /**
   * 해당 화면을 선택했을때 _route로 이동
   */
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    context.go(_routes[index]);
  }

  /**
   * 해당 화면의 바텀 네비게이션 여부를 확인
   */
  bool _isBottomNavVisible() {
    final currentPath = GoRouterState.of(context).uri.toString();
    return _routes.contains(currentPath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: _isBottomNavVisible()
        ? CustomBottomNavBar(
            selectedIndex: _selectedIndex,
            onItemTapped: _onItemTapped,
      ) : null
    );
  }
}
