import 'package:flutter/material.dart';
import 'package:flutter_templete/core/di/di_setup.dart';
import 'package:flutter_templete/feature/drawer_navigation/drawer_navigation_view_model.dart';
import 'package:flutter_templete/feature/drawer_navigation/widget/drawer_widget.dart';
import 'package:flutter_templete/feature/home/presentation/home_screen.dart';
import 'package:flutter_templete/feature/home/presentation/home_view_model.dart';
import 'package:flutter_templete/feature/resume_editor/presentation/resume_editor_screen.dart';
import 'package:flutter_templete/feature/resume_editor/presentation/resume_editor_view_model.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';

class DrawerNavigation extends StatefulWidget {
  const DrawerNavigation({super.key});

  @override
  State<DrawerNavigation> createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  late final List<Widget> screens;

  @override
  void initState() {
    super.initState();
    screens = [
      ChangeNotifierProvider(
        create: (_) => getIt<HomeViewModel>(),
        child: HomeScreen(),
      ),
      ChangeNotifierProvider(
        create: (_) => getIt<ResumeEditorViewModel>(),
        child: ResumeEditorScreen(),
      ),
    ];

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final vm = context.read<DrawerNavigationViewModel>();
      await vm.setUserInfo();
      vm.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DrawerNavigationViewModel>(context);
    return ZoomDrawer(
      menuScreen: DrawerWidget(),
      mainScreen: screens[vm.selectedMenuIndex],
      slideWidth: MediaQuery.of(context).size.width * 0.9,
      angle: 0.0,
      borderRadius: 0,
      showShadow: true,
      openCurve: Curves.easeInOut,
      closeCurve: Curves.easeInOut,
      menuBackgroundColor: Colors.grey,
      disableDragGesture: true,
    );
  }
}
