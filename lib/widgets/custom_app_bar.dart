import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/color/app_colors.dart';

/**
 * CustomAppBar
 *
 * 이 클래스는 Flutter 애플리케이션에서 사용할 수 있는 커스텀 앱 바 위젯입니다.
 * 기본 `AppBar`를 대신하여 더욱 유연한 커스터마이징이 가능합니다.
 *
 * 주요 기능:
 * - `customTitle`: 앱 바의 제목을 설정할 수 있습니다. (기본적으로 중앙 정렬됨)
 * - `customLeading`: 앱 바의 왼쪽에 배치할 위젯을 설정할 수 있습니다.
 * - `customAction`: 앱 바의 오른쪽에 배치할 단일 위젯 또는 여러 개의 위젯을 설정할 수 있습니다.
 *
 * 레이아웃 구조:
 * - `Stack` 위젯을 사용하여 `customLeading`, `customTitle`, `customAction`을 각각 배치합니다.
 * - `Align`을 사용하여 각 위젯의 위치를 지정합니다.
 *   - `customTitle` → `Alignment.center` (정가운데)
 *   - `customLeading` → `Alignment.centerLeft` (왼쪽 정렬)
 *   - `customAction` → `Alignment.centerRight` (오른쪽 정렬)
 * - `Row`를 사용하여 `customLeading`과 `customAction`에 여러 개의 위젯을 배치할 수 있도록 합니다.
 *
 * 사용법:
 * ```dart
 * appBar: CustomAppBar(
 *   customTitle: Text("홈 화면", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: AppColors.white)),
 *   appBar: CustomAppBar(
 *   customTitle: Text("홈 화면",style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: AppColors.white),),
 *   customLeading: NoPaddingIconButton(width: 32.w, height: 32.w, icon: Icon(Icons.arrow_back, size: 16.sp,color: AppColors.white),
 *   onPressed: () => print("메뉴 클릭"),
 *   ),
 *   customAction: NoPaddingIconButton(width: 32.w,height: 32.w,icon: Icon(Icons.search, size: 16.sp, color: AppColors.white),
 *   onPressed: () => print("검색 클릭"),
 *    ),
 *   ),
 *
 * ```
 */


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  //title, Leading, action 을 Widget으로 두어, 더욱 유연하게 배치.

  final Widget? customTitle; //App Bar의 제목
  final Widget? customLeading; //App Bar의 왼쪽에 배치할 위젯
  final Widget? customAction; //App Bar의 오른쪽에 위치할 위젯들
  final int appBarHeight;

  const CustomAppBar({
    super.key,
    this.customTitle,
    this.customLeading,
    this.customAction,
    this.appBarHeight = 60,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      color: AppColors.color666666,
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
      )
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(appBarHeight.h); //AppBar의 높이를 설정할 수 있습니다.
}
