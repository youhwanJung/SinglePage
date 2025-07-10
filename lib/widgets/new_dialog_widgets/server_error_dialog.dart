import 'package:flutter/material.dart';
import 'package:flutter_templete/core/color/app_colors.dart';
import 'package:flutter_templete/widgets/custom_button.dart';
import 'package:flutter_templete/widgets/no_padding_icon_button.dart';

class ServerResultDialog extends StatelessWidget {
  final String title;
  final String content;
  final String confirmText;
  final VoidCallback? onConfirm;

  const ServerResultDialog(
      {super.key,
      required this.title,
      required this.content,
      required this.confirmText,
      this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(8),
        color: AppColors.white,
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  height: 80,
                  child: Center(
                    child: Icon(
                      Icons.error,
                      size: 40,
                    ),
                  ),
                ),
                SizedBox(width: 9),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          title,
                          style: TextStyle(
                              fontSize: 16,
                              color: AppColors.black,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          content,
                          style: TextStyle(
                              fontSize: 14,
                              color: AppColors.black,
                              fontWeight: FontWeight.w200),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
                alignment: Alignment.centerRight,
                child: CustomButton(
                  onPressed: onConfirm,
                  backgroundColor: AppColors.white,
                  borderRadius: 0,
                  borderColor: AppColors.white,
                  borderWidth: 0,
                  width: 60,
                  height: 35,
                  pressedColor: AppColors.buttonWhitePressed,
                  child: Text(
                    confirmText,
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
