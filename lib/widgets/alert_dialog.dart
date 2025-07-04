import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_templete/widgets/alert_dialog_widgets/custom_single_alert_dialog.dart';
import 'package:flutter_templete/widgets/alert_dialog_widgets/custom_text_field_alert_dialog.dart';
import 'package:flutter_templete/widgets/alert_dialog_widgets/custom_yes_or_no_alert_dialog.dart';
import 'package:flutter_templete/widgets/new_dialog_widgets/permission_dialog.dart';

import '../core/color/app_colors.dart';
import '../core/constants/app_strings.dart';
import 'alert_dialog_widgets/custom_loading_alert_dialog.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

void showSingleAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomSingleAlertDialog(
        titleWidget: Text(
          '기본 다이어로그입니다.',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        messageWidget: Text(
          '기본 다이어로그입니다.',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        buttonWidget: CustomButton(
          child: Text(
            "확인",
            style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.bold),
          ),
          onPressed: () => {Navigator.pop(context)},
          isDisabled: false,
          pressedColor: AppColors.buttonPressed,
          backgroundColor: Colors.grey,
          disabledColor: Colors.grey.shade400,
        ),
        borderColor: AppColors.black,
        backgroundColor: Colors.white,
        borderRadius: 8.w,
        dialogWidth: 0.w,
        dialogHeight: 210.0.h,
        dialogPadding: 8.w,
        icon: Icon(Icons.info_outline, size: 25.0.w, color: AppColors.buttonPressed),
      );
    },
  );
}

void showYesOrNoAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomYesOrNoAlertDialog(
        titleWidget: Text(
          '예 또는 아니오 다이어로그입니다.',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        messageWidget: Text(
          AppStrings.yesNoDialogMessage,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        confirmButtonWidget: CustomButton(
          width: 100.w,
          height: 40.h,
          child: Text(
            AppStrings.yes,
            style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          isDisabled: false,
          pressedColor: AppColors.buttonPressed,
          backgroundColor: Colors.grey[400]!,
          disabledColor: Colors.grey.shade400,
        ),
        cancelButtonWidget: CustomButton(
          width: 100.w,
          height: 40.h,
          child: Text(
            AppStrings.no,
            style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          isDisabled: false,
          pressedColor: AppColors.buttonPressed,
          backgroundColor: Colors.grey[600]!,
          disabledColor: Colors.grey.shade400,
        ),
        borderColor: AppColors.black,
        backgroundColor: Colors.white,
        borderRadius: 8.w,
        dialogWidth: 500.w,
        dialogHeight: 210.0.h,
        dialogPadding: 8.w,
        icon: Icon(Icons.check, size: 25.0.w, color: AppColors.buttonPressed),
      );
    },
  );
}

void showLoadingAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return CustomLoadingDialog(
        backgroundColor: AppColors.colorF3F4F5,
        dialogWidth: 50.w,
        dialogHeight: 130.h,
        loadingAnimation: CircularProgressIndicator(
          strokeWidth: 2,
          color: Colors.grey[600]!,
        ),
        messageWidget: Text(
          '로딩 중...',  // 로딩 메시지
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      );
    },
  );
}

void showTextFieldAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomTextFieldAlertDialog(
        titleWidget: Text(
          '텍스필드 다이어로그입니다.',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        textFieldWidget: CustomTextField(
          width: 150.w,
          height: 40.h,
          borderColor: Colors.black,
          backgroundColor: Colors.grey[200]!,
          borderRadius: 4.0.r,
          borderWidth: 1.0,
          fontSize: 11.sp,
          fontColor: Colors.black,
          horizontalPadding: 8.w,
          verticalPadding: 8.h,
          hintText: AppStrings.defaultTextFieldHint,
          hintColor: AppColors.color666666,
          hintFontSize: 11.sp,
          enabled: true,
          onChanged: (text) {
            print("입력된 값: $text");
          },
        ),
        messageWidget: Text(
          '텍스필드 다이어로그입니다.',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),

        buttonWidget: CustomButton(
          child: Text(
            "확인",
            style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.bold),
          ),
          onPressed: () => {Navigator.pop(context)},
          isDisabled: false,
          pressedColor: AppColors.buttonPressed,
          backgroundColor: Colors.grey,
          disabledColor: Colors.grey.shade400,
        ),
        borderColor: AppColors.black,
        backgroundColor: Colors.white,
        borderRadius: 8.w,
        dialogWidth: 0.w,
        dialogHeight: 270.0.h,
        dialogPadding: 8.w,
        icon: Icon(Icons.text_fields, size: 25.0.w, color: AppColors.buttonPressed),
      );
    },
  );
}


Future<void> showPermissionDialog(
    {required BuildContext context,
    required title,
    required content,
    required confirmText,
    VoidCallback? onConfirm}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => PermissionDialog(
      title: title,
      content: content,
      confirmText: confirmText,
      onConfirm: onConfirm,
    ),
  );
}
