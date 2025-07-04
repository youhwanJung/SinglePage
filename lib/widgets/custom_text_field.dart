import 'package:flutter/material.dart';
import '../core/color/app_colors.dart';

/**
 * CustomTextField
 *
 * 이 위젯은 사용자 정의 텍스트 필드입니다. 사용자가 원하는 크기, 색상, 테두리 스타일, 글꼴 등을 설정할 수 있으며,
 * `prefixIcon` 및 `suffixIcon`을 추가하여 텍스트 필드의 왼쪽과 오른쪽에 아이콘을 배치할 수 있습니다.
 * 또한, 패딩을 설정하여 텍스트 필드의 내부 여백을 자유롭게 조절할 수 있습니다.
 *
 * 주요 기능:
 * - `width`와 `height`를 통해 텍스트 필드의 크기를 조정합니다.
 * - `borderColor`, `backgroundColor`, `borderRadius`, `borderWidth` 등을 사용하여 텍스트 필드의 스타일을 조정합니다.
 * - `fontSize`, `fontColor`를 사용하여 텍스트의 크기와 색상을 설정할 수 있습니다.
 * - `prefixIcon`과 `suffixIcon`을 통해 텍스트 필드의 양옆에 아이콘을 배치할 수 있습니다.
 * - `prefixIconTextFieldSpace`를 사용하여 아이콘과 텍스트 필드 사이의 간격을 설정할 수 있습니다.
 *
 * 특징:
 * - `prefixIcon`: 텍스트 필드 왼쪽에 표시될 아이콘을 설정합니다.
 * - `suffixIcon`: 텍스트 필드 오른쪽에 표시될 아이콘을 설정합니다.
 * - `prefixIconTextFieldSpace`: `prefixIcon`과 텍스트 필드 사이의 여백을 설정합니다.
 * - `hintText`: 텍스트 필드가 비어 있을 때 표시되는 힌트 텍스트입니다.
 * - `enabled`: 텍스트 필드를 활성화 또는 비활성화합니다.
 *
 * 사용 예제:
 * ```dart
 * CustomTextField(
 *   width: 300.0,
 *   height: 50.0,
 *   fontSize: 16.0,
 *   fontColor: Colors.black,
 *   horizontalPadding: 10.0,
 *   verticalPadding: 8.0,
 *   hintText: '검색어를 입력하세요',
 *   hintColor: Colors.grey,
 *   hintFontSize: 12.0,
 *   enabled: true,
 *   prefixIcon: Icon(Icons.search, size: 20.0),
 *   suffixIcon: Icon(Icons.clear, size: 20.0),
 *   prefixIconTextFieldSpace: 8.0,
 * )
 * ```
 */

class CustomTextField extends StatefulWidget {
  final double width;
  final double height;
  final Color borderColor;
  final Color backgroundColor;
  final double borderRadius;
  final double borderWidth;
  final double fontSize;
  final Color fontColor;
  final double horizontalPadding;
  final double verticalPadding;
  final String hintText;
  final Color hintColor;
  final double hintFontSize;
  final bool enabled;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? prefixIconTextFieldSpace;

  const CustomTextField({
    super.key,
    required this.width,
    required this.height,
    required this.fontSize,
    required this.fontColor,
    required this.horizontalPadding,
    required this.verticalPadding,
    this.borderColor = AppColors.black,
    this.backgroundColor = AppColors.white,
    this.borderRadius = 0,
    this.borderWidth = 0,
    this.hintText = "",
    this.hintColor = Colors.grey,
    this.hintFontSize = 10,
    this.enabled = true,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    this.prefixIconTextFieldSpace
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.enabled ? null : () {},
      child: AbsorbPointer(
        absorbing: !widget.enabled,
        child: Container(
            width: widget.width,
            height: widget.height,
            padding: EdgeInsets.symmetric(
              horizontal: widget.horizontalPadding,
            ),
            decoration: BoxDecoration(
                color: widget.backgroundColor,
                borderRadius: BorderRadius.circular(widget.borderRadius),
                border: Border.all(
                  color: widget.borderColor,
                  width: widget.borderWidth,
                )
            ),
            child: Row(
              children: [
                if (widget.prefixIcon != null)
                  ...[
                    widget.prefixIcon!,
                    SizedBox(width: widget.prefixIconTextFieldSpace)
                  ],
                Expanded(
                  child: TextField(
                    enabled: widget.enabled,
                    onChanged: widget.onChanged,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      isDense: true,
                      hintText: widget.hintText,
                      hintStyle: TextStyle(
                        color: widget.hintColor,
                        fontSize: widget.hintFontSize,
                      ),
                    ),
                    style: TextStyle(
                        fontSize: widget.fontSize
                    ),
                  ),
                ),
                if (widget.suffixIcon != null)
                  widget.suffixIcon!,
              ],
            )
        ),
      ),
    );
  }
}
