import 'package:flutter/cupertino.dart';
import 'package:flutter_templete/core/utils/result.dart';
import 'package:flutter_templete/widgets/alert_dialog.dart';

/// 로그인 다이어로그
Future<void> showLoginResultDialog<T>(BuildContext context, Result<T> result) async {
  if (!(result.code == 200 || result.code == 201)) {
    showServerDialog(
      context: context,
      title: "로그인 실패",
      content: result.message,
      confirmText: "확인",
      onConfirm: () {
        Navigator.of(context).pop();
      },
    );
  }else {
    showServerDialog(
      context: context,
      title: "로그인 성공",
      content: result.message,
      confirmText: "확인",
      onConfirm: () {
        Navigator.of(context).pop();
      },
    );
  }
}

/// 회원가입 다이어로그
Future<void> showSignUpResultDialog<T>(BuildContext context, Result<T> result) async {
  if (!(result.code == 200 || result.code == 201)) {
    showServerDialog(
      context: context,
      title: "회원가입 실패",
      content: result.message,
      confirmText: "확인",
      onConfirm: () {
        Navigator.of(context).pop();
      },
    );
  }else {
    showServerDialog(
      context: context,
      title: "회원가입 성공",
      content: result.message,
      confirmText: "확인",
      onConfirm: () {
        Navigator.of(context).pop();
      },
    );
  }
}