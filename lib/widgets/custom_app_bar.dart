import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/color/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? customTitle;
  final Widget? customLeading;
  final Widget? customAction;
  final int appBarHeight;
  final Color backgroundColor;
  final bool isMockUI;

  const CustomAppBar({
    super.key,
    this.customTitle,
    this.customLeading,
    this.customAction,
    this.appBarHeight = 60,
    this.backgroundColor = Colors.transparent,
    this.isMockUI = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: isMockUI
            ? BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                color: backgroundColor,
              )
            : BoxDecoration(
                color: backgroundColor,
              ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: customTitle ?? SizedBox.shrink(),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: customLeading ?? SizedBox.shrink(),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (customAction != null) customAction!,
                  if (customAction != null) customAction!,
                ],
              ),
            ),
          ],
        ));
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(appBarHeight.h); //AppBar의 높이를 설정할 수 있습니다.
}
