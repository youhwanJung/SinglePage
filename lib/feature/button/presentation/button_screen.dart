import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_templete/widgets/custom_app_bar.dart';

import '../../../core/color/app_colors.dart';
import '../../../widgets/custom_button.dart';

/**
 * Login Screen
 */

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        customTitle: Text("Button Example Screen", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: AppColors.white),),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomButton(
              height: 30,
              child: Text(
                "기본 버튼",
                style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.bold),
              ),
              onPressed: () => print("기본 버튼 클릭!"),
              backgroundColor: AppColors.buttonBackground,
              pressedColor: AppColors.buttonPressed,
              disabledColor: AppColors.buttonDisabled,
              borderColor: AppColors.black,
            ),
            SizedBox(height: 40.h),
            CustomButton(
              child: Text(
                "비활성화 버튼",
                style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.bold),
              ),
              onPressed: () => print("비활성화 버튼 클릭!"),
              isDisabled: true,
              backgroundColor: Colors.grey,
              disabledColor: Colors.grey.shade400,
              borderColor: Colors.grey.shade600,
            ),
            SizedBox(height: 40.h),
            CustomButton(
              child: Text(
                "로딩 버튼",
                style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.bold),
              ),
              onPressed: () => print("로딩 버튼 클릭!"),
              isLoading: true,
              backgroundColor: AppColors.buttonBackground,
              pressedColor: AppColors.buttonPressed,
              disabledColor: AppColors.buttonDisabled,
              borderColor: AppColors.black,
            ),
            SizedBox(height: 40.h),
            CustomButton(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star, color: AppColors.white, size: 12.sp,),
                  SizedBox(width: 8.w), // 아이콘과 텍스트 사이 간격
                  Text(
                    "아이콘 텍스트 버튼",
                    style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              onPressed: () => print("아이콘 텍스트 버튼 클릭!"),
              backgroundColor: AppColors.buttonBackground,
              pressedColor: AppColors.buttonPressed,
              disabledColor: AppColors.buttonDisabled,
              borderColor: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }
}
