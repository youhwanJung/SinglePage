import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final Color backgroundColor;
  final Color disabledColor;
  final Color pressedColor;
  final bool isLoading;
  final bool isDisabled;
  final double? width;
  final double height;

  final Color borderColor;
  final Color disabledBorderColor;
  final double borderRadius;
  final double borderWidth;
  final double? horizontalPadding;
  final Alignment? alignment;

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
    this.width,
    this.height = 50.0,
    this.borderColor = Colors.transparent,
    this.disabledBorderColor = Colors.transparent,
    this.borderWidth = 1.0,
    this.horizontalPadding,
    this.alignment = Alignment.center,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final buttonContent = Container(
      width: widget.width,
      height: widget.height,
      padding: widget.horizontalPadding != null
          ? EdgeInsets.symmetric(horizontal: widget.horizontalPadding!)
          : null,
      alignment: widget.alignment,
      decoration: BoxDecoration(
        color: widget.isDisabled
            ? widget.disabledColor
            : isPressed
            ? widget.pressedColor
            : widget.backgroundColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: Border.all(
          color: widget.isDisabled
              ? widget.disabledBorderColor
              : widget.borderColor,
          width: widget.borderWidth,
        ),
      ),
      child: widget.isLoading
          ? SizedBox(
        width: 16.w,
        height: 16.w,
        child: const CircularProgressIndicator(
          strokeWidth: 2,
          color: Colors.white,
        ),
      )
          : widget.child,
    );

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
      child: widget.width == null
          ? IntrinsicWidth(child: buttonContent)
          : buttonContent,
    );
  }
}
