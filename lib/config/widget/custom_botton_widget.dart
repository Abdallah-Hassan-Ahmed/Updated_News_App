import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_color.dart';
import 'package:news_app/core/utils/app_font_styles.dart';

enum ButtonContentAlignment { left, center, right }

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.bgColor,
    this.icon,
    this.iconColor = Colors.white,
    this.iconSize = 20,
    this.spacing = 8,
    this.contentAlignment = ButtonContentAlignment.center,
    this.borderColor,
    this.textStyle,
    this.isLoading = false,
  });

  final String text;
  final VoidCallback onPressed;
  final Color? bgColor;
  final Color? borderColor;

  final Widget? icon;
  final TextStyle? textStyle;
  final Color iconColor;
  final double iconSize;
  final double spacing;
  final bool isLoading;

  final ButtonContentAlignment contentAlignment;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: bgColor ?? AppColor.transparent,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: borderColor ?? AppColor.bgLight,
              width: 1.5,
            ),
          ),
        ),
        child: isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(color: AppColor.grayColor),
              )
            : Align(alignment: _getAlignment(), child: _buildContent()),
      ),
    );
  }

  Alignment _getAlignment() {
    switch (contentAlignment) {
      case ButtonContentAlignment.left:
        return Alignment.centerLeft;
      case ButtonContentAlignment.right:
        return Alignment.centerRight;
      default:
        return Alignment.center;
    }
  }

  Widget _buildContent() {
    if (icon == null) {
      return Text(text, style: textStyle ?? AppFont.bold16Black);
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(text, style: textStyle ?? AppFont.bold16Black),
        Spacer(),
        SizedBox(width: spacing),
        if (icon != null) icon!,
        if (icon == null) SizedBox(width: spacing),
      ],
    );
  }
}
