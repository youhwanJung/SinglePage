import 'package:flutter/material.dart';

class NoPaddingIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final Color? color;

  const NoPaddingIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.width,
    required this.height,
    this.color = Colors.transparent
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,  // 배경 투명하게 유지
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: onPressed,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
          alignment: Alignment.center,
          child: icon,
        ),
      ),
    );
  }
}