import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_color.dart';
import 'package:news_app/core/utils/app_font_styles.dart';

class ThemesApp {
  static ThemeData lightThemeData = ThemeData(
    scaffoldBackgroundColor: AppColor.bgLight,
    colorScheme: ColorScheme.light(
      onPrimary: AppColor.bgLight,
      onSecondary: AppColor.bgDark,
    ),

    // todo : textTheme Light
    textTheme: TextTheme(
      titleMedium: AppFont.semi20Black,
      bodyMedium: AppFont.semi20Black,
      labelMedium: AppFont.semi24White,
      headlineMedium: AppFont.bold16Black,
      headlineSmall: AppFont.semi14Black,
      bodySmall:AppFont.semi14White 
    ),
  );

  static ThemeData darkThemeData = ThemeData(
    scaffoldBackgroundColor: AppColor.bgDark,

    colorScheme: ColorScheme.dark(
      onPrimary: AppColor.bgDark,
      onSecondary: AppColor.bgLight,
    ),

    // todo : textTheme Black
    textTheme: TextTheme(
      titleMedium: AppFont.semi20White,
      bodyMedium: AppFont.semi20White,
      labelMedium: AppFont.semi24Black,
      headlineMedium: AppFont.bold16White,
      headlineSmall: AppFont.semi14White,
      bodySmall:AppFont.semi14Black
    ),
  );
}
