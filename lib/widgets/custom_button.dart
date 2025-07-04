import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/color/app_colors.dart';

/**
 * CustomButton
 *
 * 이 클래스는 Flutter의 커스텀 버튼을 생성하는 위젯입니다.
 *
 * 사용법:
 *
 * CustomButton(
 *   child: Text("버튼 텍스트"),
 *   onPressed: () { 버튼 클릭 시 실행될 함수 },
 *   isDisabled: 버튼 비활성화 여부 (기본값: false),
 *   isLoading: 로딩 상태 여부 (기본값: false),
 *   backgroundColor: 버튼의 배경색 (기본값: 파란색),
 *   pressedColor: 버튼이 눌렸을 때의 색상,
 *   disabledColor: 버튼이 비활성화되었을 때의 색상,
 *   borderColor: 버튼 테두리 색상,
 *   disabledBorderColor: 버튼이 비활성화되었을 때의 테두리 색상,
 *   borderWidth: 버튼 테두리 두께 (기본값: 1.0),
 *   width: 버튼의 너비 (기본값: 최대),
 *   height: 버튼의 높이 (기본값: 50),
 *   borderRadius: 버튼의 모서리 둥글기 (기본값: 8),
 * )
 *
 * 예제:
 *
 * CustomButton(
 *   child: Text("로그인"),
 *   onPressed: () {
 *     print("로그인 버튼 클릭!");
 *   },
 *   isDisabled: false,
 *   isLoading: false,
 *   backgroundColor: Colors.blue,
 *   pressedColor: Colors.blueAccent,
 *   disabledColor: Colors.grey,
 *   borderColor: Colors.black,
 *   disabledBorderColor: Colors.grey.shade700,
 *   borderWidth: 2.0,
 * )
 *
 * 기능:
 * - 버튼 상태(기본, 눌림, 비활성화)에 따라 색상이 변경됨
 * - GestureDetector를 활용하여 터치 이벤트 감지
 * - 로딩 상태에서는 CircularProgressIndicator 표시
 * - 버튼 테두리 색상 및 두께를 지정 가능
 * - BoxDecoration을 활용하여 그림자 효과 추가
 */

class CustomButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final Color backgroundColor;
  final Color disabledColor;
  final Color pressedColor;
  final bool isLoading;
  final bool isDisabled;
  final double width;
  final double height;
  final bool isShadow;

  final Color borderColor;
  final Color disabledBorderColor;
  final double borderRadius;
  final double borderWidth;

  const CustomButton({
    super.key,
    required this.child,
    this.onPressed,
    this.backgroundColor = Colors.blue,
    this.disabledColor = Colors.grey,
    this.pressedColor = Colors.blueAccent,
    this.borderRadius = 8.0,
    this.isLoading = false,
    this.isDisabled = false,
    this.width = 100.0,
    this.height = 50.0,
    this.isShadow = true,

    this.borderColor = Colors.transparent, // 기본값 투명
    this.disabledBorderColor = Colors.grey,
    this.borderWidth = 1.0,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        if (!widget.isDisabled && !widget.isLoading) {
          setState(() => isPressed = true);
        }
      },
      onTapUp: (_) {
        if (!widget.isDisabled && !widget.isLoading) {
          setState(() => isPressed = false);
          widget.onPressed?.call();
        }
      },
      onTapCancel: () {
        setState(() => isPressed = false);
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: widget.isDisabled
              ? widget.disabledColor
              : isPressed
              ? widget.pressedColor
              : widget.backgroundColor,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: Border.all(
            color: widget.isDisabled ? widget.disabledBorderColor : widget.borderColor,
            width: widget.borderWidth,
          ),
          boxShadow: [
            if (widget.isShadow && !widget.isDisabled)
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                offset: const Offset(2, 4),
              ),
          ],
        ),
        child: widget.isLoading
            ? SizedBox(
          width: 16.w, // 원하는 크기로 조정
          height: 16.w,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: AppColors.white,
          ),
        )
            : widget.child,
      ),
    );
  }
}
