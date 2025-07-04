import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_templete/widgets/no_padding_icon_button.dart';

/**
 * CustomYesOrNoAlertDialog
 *
 * 이 위젯은 "예" 또는 "아니요" 버튼을 포함한 커스텀 알림 다이얼로그입니다.
 * 사용자 정의 텍스트, 버튼, 아이콘 등을 포함할 수 있으며, 다이얼로그의 크기와 스타일을 설정할 수 있습니다.
 * 주로 사용자에게 확인을 요청할 때 사용됩니다.
 *
 * 주요 기능:
 * - `titleWidget`: 다이얼로그의 제목을 설정합니다.
 * - `messageWidget`: 다이얼로그의 메시지를 설정합니다.
 * - `confirmButtonWidget`: "예" 버튼을 설정합니다.
 * - `cancelButtonWidget`: "아니요" 버튼을 설정합니다.
 * - `borderRadius`: 다이얼로그의 모서리 둥글기를 설정합니다.
 * - `borderColor`: 다이얼로그의 테두리 색상을 설정합니다.
 * - `backgroundColor`: 다이얼로그의 배경 색상을 설정합니다.
 * - `dialogWidth`, `dialogHeight`: 다이얼로그의 너비와 높이를 설정합니다.
 * - `dialogPadding`: 다이얼로그 내부 여백을 설정합니다.
 * - `icon`: 다이얼로그에 표시할 아이콘을 설정할 수 있습니다.
 *
 * 사용 예제:
 * ```dart
 * CustomYesOrNoAlertDialog(
 *   titleWidget: Text('제목을 여기에 작성'),
 *   messageWidget: Text('메시지를 여기에 작성'),
 *   confirmButtonWidget: CustomButton(
 *     child: Text("예"),
 *     onPressed: () => Navigator.pop(context, true),
 *   ),
 *   cancelButtonWidget: CustomButton(
 *     child: Text("아니요"),
 *     onPressed: () => Navigator.pop(context, false),
 *   ),
 *   borderRadius: 16.0,
 *   borderColor: Colors.blue,
 *   backgroundColor: Colors.white,
 *   dialogWidth: 600.0,
 *   dialogHeight: 200.0,
 *   dialogPadding: 16.0,
 *   icon: Icon(Icons.info_outline, size: 24.0),
 * )
 * ```
 */

class CustomYesOrNoAlertDialog extends StatefulWidget {
  final Widget titleWidget;
  final Widget messageWidget;
  final Widget confirmButtonWidget;
  final Widget cancelButtonWidget;
  final double borderRadius;
  final Color borderColor;
  final Color backgroundColor;
  final double? dialogWidth;
  final double? dialogHeight;
  final double dialogPadding;
  final double? dialogBorderWidth;
  final Widget? icon;

  const CustomYesOrNoAlertDialog({
    super.key,
    required this.titleWidget,
    required this.messageWidget,
    required this.confirmButtonWidget,
    required this.cancelButtonWidget,
    this.borderRadius = 16.0,
    this.borderColor = Colors.blue,
    this.backgroundColor = Colors.white,
    this.dialogBorderWidth,
    this.dialogWidth = 600.0,
    this.dialogHeight = 200.0,
    this.dialogPadding = 16.0,
    this.icon,
  });

  @override
  State<CustomYesOrNoAlertDialog> createState() =>
      _CustomAlertDialogWithCancelState();
}

class _CustomAlertDialogWithCancelState
    extends State<CustomYesOrNoAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: Container(
        width: widget.dialogWidth,
        height: widget.dialogHeight,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: (widget.borderColor != null && widget.dialogBorderWidth != null)
              ? Border.all(
            color: widget.borderColor!,
            width: widget.dialogBorderWidth!,
          )
              : null,
        ),
        child: Padding(
          padding: EdgeInsets.all(widget.dialogPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) widget.icon!,
              SizedBox(height: 16.0.h),
              widget.titleWidget,
              SizedBox(height: 8.0.h),
              widget.messageWidget,
              SizedBox(height: 20.0.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.cancelButtonWidget,
                  SizedBox(width: 16.w,),
                  widget.confirmButtonWidget,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
