
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_color.dart';
import 'package:news_app/core/utils/app_font_styles.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.prefixIcon,
    this.suffixIcons,
    this.obscureText = false,
    this.validator,
    this.textStyle,
    this.maxLine,
    this.onChange,
  });
  final TextEditingController controller;
  final String hint;
  final Icon? prefixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final IconButton? suffixIcons;
  final TextStyle? textStyle;
  final int? maxLine;
  final Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLine ?? 1,
      onChanged: onChange,
      validator: validator,
      cursorColor: AppColor.bgLight,
      obscureText: obscureText,
      controller: controller,
      
      style:
          textStyle ??
          Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 16),
      decoration: InputDecoration(
        errorStyle: AppFont.bold16Black.copyWith(color: AppColor.grayColor),
        suffixIcon: suffixIcons,
        prefixIcon: prefixIcon,
        prefixIconColor: Theme.of(context).colorScheme.primary,
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
          fontSize: 13,
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.bgLight, width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.grayColor, width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.grayColor, width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
