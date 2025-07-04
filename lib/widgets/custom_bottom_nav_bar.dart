import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/color/app_colors.dart';
import '../core/constants/app_strings.dart';

/**
 * CustomBottomNavBar
 *
 * 이 클래스는 Flutter의 커스텀 바텀 네비게이션 바를 생성하는 위젯입니다.
 *
 * 사용법:
 *
 * CustomBottomNavBar(
 *   selectedIndex: 현재 선택된 인덱스 (0부터 시작),
 *   onItemTapped: (index) { 선택된 탭의 인덱스를 처리하는 함수 },
 * )
 *
 * 예제:
 *
 * CustomBottomNavBar(
 *   selectedIndex: _selectedIndex,
 *   onItemTapped: (index) {
 *     setState(() {
 *       _selectedIndex = index;
 *     });
 *   },
 * )
 *
 * 기능:
 * - 아이콘과 텍스트를 포함하는 바텀 네비게이션 바
 * - 선택된 항목은 색상 및 크기가 다르게 표시됨
 * - GestureDetector를 사용하여 탭 이벤트 감지
 * - AnimatedContainer를 사용하여 부드러운 전환 효과 적용
 * - ScreenUtil을 활용한 반응형 디자인 적용
 */

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  final List<Map<String, dynamic>> items = const [
    {"icon": Icons.smart_button, "label": AppStrings.buttonLabel},
    {"icon": Icons.text_fields, "label": AppStrings.textFieldLabel},
    {"icon": Icons.info, "label": AppStrings.alertDialogLabel},
    {"icon": Icons.cloud,"label": AppStrings.serverCallLabel}
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      height: 100.h, // 바텀 네비게이션 탭바의 높이
      decoration: BoxDecoration(
        color: AppColors.white, // 바텀 네비게이탭 바의 배경색.
        border: Border(top: BorderSide(color: AppColors.colorE2E6E9, width: 1)), // 바텀 네비게이션 탭 바의 테두리
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap:  () => onItemTapped(index),
            child: AnimatedContainer(
              duration: Duration(microseconds: 200),
              width: MediaQuery.of(context).size.width / items.length, // List안에, item 수만큼 균등하게 크기 분할
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.white.withOpacity(0.2) : AppColors.white, //item 하나의 배경색
                borderRadius: BorderRadius.circular(12.r), // item 하나의 테두리
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    items[index]["icon"],
                    color: isSelected ? AppColors.color73676D : AppColors.colorD0D1D2, //아이콘 색
                    size: isSelected ? 20.sp : 20.sp, //아이콘 사이즈
                  ),
                  Text(
                    items[index]["label"],
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal, //글자 굵기
                      color: isSelected ? AppColors.color73676D : AppColors.colorD0D1D2//글자 색
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              )
            ),
          );
        }),
      ),
    );
  }
}
