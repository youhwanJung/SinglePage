import 'package:flutter/material.dart';

/**
 * NoPaddingIconButton
 *
 * 이 위젯은 기본 `IconButton`에서 패딩을 제거하고, 크기를 직접 지정할 수 있도록 개선한 커스텀 버튼입니다.
 *
 * 주요 기능:
 * - `icon`: 표시할 아이콘 위젯을 설정합니다.
 * - `onPressed`: 버튼 클릭 시 실행할 콜백 함수를 설정합니다.
 * - `width`: 버튼의 가로 크기를 설정합니다.
 * - `height`: 버튼의 세로 크기를 설정합니다.
 *
 * 특징:
 * - 기본 `IconButton`은 내부 패딩이 있어, 아이콘 크기에 관계없이 일정한 여백이 생깁니다.
 * - 이 위젯은 `SizedBox`를 사용하여 버튼 크기를 직접 제어하며, `padding: EdgeInsets.zero`를 적용하여 불필요한 여백을 제거합니다.
 * - `constraints: const BoxConstraints()`를 적용하여 기본 크기 제한을 없앴습니다.
 *
 * 사용 예제:
 * ```dart
 * NoPaddingIconButton(
 *   width: 32.0,
 *   height: 32.0,
 *   icon: Icon(Icons.search, size: 16.0, color: Colors.white),
 *   onPressed: () => print("검색 버튼 클릭"),
 * )
 * ```
 */

class NoPaddingIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;

  const NoPaddingIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: IconButton(
        icon: icon,
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        onPressed: onPressed,
      ),
    );
  }
}