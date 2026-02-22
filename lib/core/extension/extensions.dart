import 'package:flutter/material.dart';
import 'package:news_app/config/language/localization_provider.dart';
import 'package:news_app/config/theme/theme_provider.dart';
import 'package:provider/provider.dart';

extension MediaQueryExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}

extension LocaleExtension on BuildContext {
  LocalizationProvider get localProvider => read<LocalizationProvider>();
}

extension ThemeExtension on BuildContext {
  ThemeProvider get themeProvider => read<ThemeProvider>();
}

extension NavigationExtension on BuildContext {

  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.pushNamed<T>(
      this,
      routeName,
      arguments: arguments,
    );
  }

  Future<T?> pushReplacementNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.pushReplacementNamed<T, T>(
      this,
      routeName,
      arguments: arguments,
    );
  }

  Future<T?> pushNamedAndRemoveUntil<T>(String routeName) {
    return Navigator.pushNamedAndRemoveUntil<T>(
      this,
      routeName,
      (route) => false,
    );
  }


  void pop<T extends Object?>([T? result]) {
    Navigator.pop(this, result);
  }
}
