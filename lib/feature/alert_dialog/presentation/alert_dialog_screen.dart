import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_templete/widgets/alert_dialog.dart';
import 'package:go_router/go_router.dart';

import '../../../core/color/app_colors.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_button.dart';

/**
 * Login Screen
 */

class AlertDialogScreen extends StatefulWidget {
  const AlertDialogScreen({super.key});

  @override
  State<AlertDialogScreen> createState() => _AlertDialogScreenState();
}

class _AlertDialogScreenState extends State<AlertDialogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        customTitle: Text("AlertDialog Example Screen", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: AppColors.white),),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomButton(
              child: Text(
                "확인 다이어로그",
                style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.bold),
              ),
              onPressed: () => {
                showSingleAlertDialog(context)
              },
              backgroundColor: AppColors.buttonBackground,
              pressedColor: AppColors.buttonPressed,
              disabledColor: AppColors.buttonDisabled,
              borderColor: AppColors.black,
            ),
            SizedBox(height: 40.h),
            CustomButton(
              child: Text(
                "취소 확인 다이어로그",
                style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.bold),
              ),
              onPressed: () => {
                showYesOrNoAlertDialog(context)
              },
              backgroundColor: AppColors.buttonBackground,
              pressedColor: AppColors.buttonPressed,
              disabledColor: AppColors.buttonDisabled,
              borderColor: AppColors.black,
            ),
            SizedBox(height: 40.h),
            CustomButton(
              child: Text(
                "로딩 다이어로그",
                style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.bold),
              ),
              onPressed: () => {
                showLoadingAlertDialog(context)
              },
              backgroundColor: AppColors.buttonBackground,
              pressedColor: AppColors.buttonPressed,
              disabledColor: AppColors.buttonDisabled,
              borderColor: AppColors.black,
            ),
            SizedBox(height: 40.h),
            CustomButton(
              child: Text(
                "텍스트 필드 다이어로그",
                style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.bold),
              ),
              onPressed: () => {
                showTextFieldAlertDialog(context)
              },
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
