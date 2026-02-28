import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_color.dart';

class AppFont {
  static Color _darkModeColor = AppColor.bgDark;
  static Color _lightModeColor = AppColor.bgLight;

  static final TextStyle bold24Black = TextStyle(
    color: _darkModeColor,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );
  static final TextStyle bold20White = TextStyle(
    color: _lightModeColor,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
  static final TextStyle semi12Gray = TextStyle(
    color: AppColor.grayColor,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  // light mode
  static final TextStyle semi20Black = TextStyle(
    color: _darkModeColor,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle semi24Black = TextStyle(
    color: _darkModeColor,
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle bold16Black = TextStyle(
    color: _darkModeColor,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle semi14Black = TextStyle(
    color: _darkModeColor,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  // dark mode
  static final TextStyle semi20White = TextStyle(
    color: _lightModeColor,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle semi24White = TextStyle(
    color: _lightModeColor,
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle bold16White = TextStyle(
    color: _lightModeColor,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle semi14White = TextStyle(
    color: _lightModeColor,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
}
