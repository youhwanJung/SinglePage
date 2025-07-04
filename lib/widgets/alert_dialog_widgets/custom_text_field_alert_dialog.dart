import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_templete/widgets/no_padding_icon_button.dart';

class CustomTextFieldAlertDialog extends StatefulWidget {
  final Widget titleWidget;
  final Widget messageWidget;
  final Widget buttonWidget;
  final Widget textFieldWidget;
  final double borderRadius;
  final Color borderColor;
  final Color backgroundColor;
  final double? dialogWidth;
  final double? dialogHeight;
  final double dialogPadding;
  final double? dialogBorderWidth;
  final Widget? icon;

  const CustomTextFieldAlertDialog({
    super.key,
    required this.titleWidget,
    required this.messageWidget,
    required this.buttonWidget,
    required this.textFieldWidget,
    this.borderRadius = 16.0,
    this.borderColor = Colors.blue,
    this.backgroundColor = Colors.white,
    this.dialogBorderWidth,
    this.dialogWidth = 300.0,
    this.dialogHeight = 200.0,
    this.dialogPadding = 16.0,
    this.icon,
});

  @override
  State<CustomTextFieldAlertDialog> createState() => _CustomSingleAlertDialogState();
}

class _CustomSingleAlertDialogState extends State<CustomTextFieldAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius)
      ),
      child: Container(
        width: widget.dialogWidth,
        height: widget.dialogHeight,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: (widget.borderColor != null && widget.dialogBorderWidth != null)
              ? Border.all(color: widget.borderColor!, width: widget.dialogBorderWidth!)
              : null,
        ),
        child: Padding(
          padding: EdgeInsets.all(widget.dialogPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null)
                widget.icon!,
              SizedBox(height: 16.0.h),
              widget.titleWidget,
              SizedBox(height: 8.0.h),
              widget.messageWidget,
              SizedBox(height: 16.0.h),
              widget.textFieldWidget,
              SizedBox(height: 20.0.h),
              widget.buttonWidget,
            ],
          ),
        ),
      ),
    );
  }
}
