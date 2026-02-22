import 'package:flutter/material.dart';

class LocalizationProvider extends ChangeNotifier {
  String localeState = "ar";

  void changeLang(String newLocale) {
    if (localeState == newLocale) return;
    localeState = newLocale;
    notifyListeners();
  }

  bool isEnglish() {
    return localeState == "en";
  }
}
