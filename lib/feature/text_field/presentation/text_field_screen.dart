import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_templete/widgets/custom_app_bar.dart';
import 'package:go_router/go_router.dart';

import '../../../core/color/app_colors.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/no_padding_icon_button.dart';

/**
 * Login Screen
 */

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({super.key});

  @override
  State<TextFieldScreen> createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        customTitle: Text("TextField Example Screen", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: AppColors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              width: 150.w,
              height: 40.h,
              borderColor: Colors.blue,
              backgroundColor: Colors.grey[200]!,
              borderRadius: 4.0.r,
              borderWidth: 1.0,
              fontSize: 11.sp,
              fontColor: Colors.blue,
              horizontalPadding: 8.w,
              verticalPadding: 8.h,
              hintText: "기본 텍스트 박스",
              hintColor: AppColors.color666666,
              hintFontSize: 11.sp,
              enabled: true,
              onChanged: (text) {
                print("입력된 값: $text");
              },
            ),
            SizedBox(height: 40.h),
            CustomTextField(
              width: double.infinity,
              height: 40.h,
              borderColor: Colors.blue,
              backgroundColor: Colors.grey[200]!,
              borderRadius: 4.0.r,
              borderWidth: 1.0,
              fontSize: 11.sp,
              fontColor: Colors.blue,
              horizontalPadding: 8.w,
              verticalPadding: 8.h,
              hintText: "PrefixIconButton 텍스트 박스",
              hintColor: AppColors.color666666,
              hintFontSize: 11.sp,
              enabled: true,
              onChanged: (text) {
                print("입력된 값: $text");
              },
              prefixIcon: NoPaddingIconButton(
                width: 20.w,
                height: 20.w,
                icon: Icon(Icons.search, size: 20.sp, color: AppColors.color1E1F1F),
                onPressed: () => print("검색 클릭"),
              ),
              prefixIconTextFieldSpace: 5.w,
            ),
            SizedBox(height: 40.h),
            CustomTextField(
              width: double.infinity,
              height: 40.h,
              borderColor: Colors.blue,
              backgroundColor: Colors.grey[200]!,
              borderRadius: 4.0.r,
              borderWidth: 1.0,
              fontSize: 11.sp,
              fontColor: Colors.blue,
              horizontalPadding: 8.w,
              verticalPadding: 8.h,
              hintText: "suffixIconButton 텍스트 박스",
              hintColor: AppColors.color666666,
              hintFontSize: 11.sp,
              enabled: true,
              onChanged: (text) {
                print("입력된 값: $text");
              },
              suffixIcon: NoPaddingIconButton(
                width: 20.w,
                height: 20.w,
                icon: Icon(Icons.send, size: 20.sp, color: AppColors.color1E1F1F),
                onPressed: () => print("보내기 클릭"),
              ),
            ),
            SizedBox(height: 40.h),
            CustomTextField(
              width: double.infinity,
              height: 100.h,
              borderColor: Colors.blue,
              backgroundColor: Colors.grey[200]!,
              borderRadius: 40.0.r,
              borderWidth: 1.0,
              fontSize: 20.sp,
              fontColor: Colors.blue,
              horizontalPadding: 8.w,
              verticalPadding: 8.h,
              hintText: "비활성화 텍스트 박스",
              hintColor: AppColors.color666666,
              hintFontSize: 20.sp,
              enabled: false,
              onChanged: (text) {
                print("입력된 값: $text");
              },
              suffixIcon: NoPaddingIconButton(
                width: 20.w,
                height: 20.w,
                icon: Icon(Icons.send, size: 20.sp, color: AppColors.color1E1F1F),
                onPressed: () => print("보내기 클릭"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
