import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
/**
 * CustomLoadingDialog
 *
 * 이 위젯은 로딩 애니메이션과 메시지를 포함한 커스텀 다이얼로그입니다.
 * 사용자가 로딩 상태를 시각적으로 인식할 수 있도록 도와줍니다.
 * 다이얼로그의 스타일, 크기, 메시지 등을 커스터마이징할 수 있습니다.
 *
 * 주요 기능:
 * - `messageWidget`: 로딩 중에 표시할 메시지를 설정합니다.
 * - `loadingAnimation`: 로딩 애니메이션을 설정합니다. 예를 들어, 스피너나 다른 애니메이션을 넣을 수 있습니다.
 * - `borderRadius`: 다이얼로그의 모서리 둥글기를 설정합니다.
 * - `borderColor`: 다이얼로그의 테두리 색상을 설정합니다.
 * - `backgroundColor`: 다이얼로그의 배경 색상을 설정합니다.
 * - `dialogWidth`, `dialogHeight`: 다이얼로그의 너비와 높이를 설정합니다.
 * - `dialogPadding`: 다이얼로그 내부 여백을 설정합니다.
 * - `icon`: 다이얼로그에 표시할 아이콘을 설정할 수 있습니다.
 *
 * 사용 예제:
 * ```dart
 * CustomLoadingDialog(
 *   messageWidget: Text('로딩 중...'),
 *   loadingAnimation: SpinKitFadingCircle(
 *     color: Colors.blue,
 *     size: 30.0,
 *   ),
 *   borderRadius: 16.0,
 *   borderColor: Colors.blue,
 *   backgroundColor: Colors.white,
 *   dialogWidth: 250.0,
 *   dialogHeight: 150.0,
 *   dialogPadding: 16.0,
 * )
 * ```
 */

class CustomLoadingDialog extends StatelessWidget {
  final double? dialogWidth;
  final double? dialogHeight;
  final Color backgroundColor;
  final double borderRadius;
  final double? dialogBorderWidth;
  final Color borderColor;
  final double dialogPadding;
  final Widget messageWidget;
  final Widget loadingAnimation;

  const CustomLoadingDialog({
    super.key,
    this.dialogWidth = 250.0,
    this.dialogHeight = 150.0,
    required this.messageWidget,
    required this.loadingAnimation,
    this.backgroundColor = Colors.white,
    this.borderRadius = 16.0,
    this.borderColor = Colors.blue,
    this.dialogPadding = 16.0,
    this.dialogBorderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Container(
        width: dialogWidth,
        height: dialogHeight,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: (borderColor != null && dialogBorderWidth != null)
              ? Border.all(color: borderColor!, width: dialogBorderWidth!)
              : null,
        ),
        child: Padding(
          padding: EdgeInsets.all(dialogPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              loadingAnimation,
              SizedBox(height: 20.0.h),
              messageWidget
            ],
          ),
        ),
      ),
    );
  }
}
