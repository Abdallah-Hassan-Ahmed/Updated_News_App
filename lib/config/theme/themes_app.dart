import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_color.dart';

class ThemesApp {
  static ThemeData lightThemeData = ThemeData(
    scaffoldBackgroundColor: AppColor.bgLight,
  );
  static ThemeData darkThemeData = ThemeData(
    scaffoldBackgroundColor: AppColor.bgDark,
  );
}
