import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app/config/language/localization_provider.dart';
import 'package:news_app/config/theme/theme_provider.dart';
import 'package:news_app/config/theme/themes_app.dart';
import 'package:news_app/core/extension/extensions.dart';
import 'package:news_app/generated/l10n.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocalizationProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale(context.localProvider.localeState),
      theme: ThemesApp.lightThemeData,
      darkTheme: ThemesApp.darkThemeData,
      themeMode:context.themeProvider.themeMode ,

      home: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(S.current.home , style: TextStyle(color: Color(0xffFFFFFF)),), // ✅ مضمون
      ),
    );
  }
}
