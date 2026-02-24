import 'package:flutter/material.dart';
import 'package:news_app/config/theme/theme_provider.dart';
import 'package:news_app/core/extension/extensions.dart';
import 'package:news_app/feature/home/presentation/widget/is_selected_item.dart';
import 'package:news_app/feature/home/presentation/widget/un_selected_item.dart';
import 'package:news_app/generated/l10n.dart';
import 'package:provider/provider.dart';

class ThemingBottomSheet extends StatelessWidget {
  const ThemingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var themingProvider = Provider.of<ThemeProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.height * 0.04,
        vertical: context.height * 0.033,
      ),
      height: context.height * 0.22,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => themingProvider.changeTheme(ThemeMode.light),
            child: themingProvider.themeMode == ThemeMode.light
                ? IsSelectedItem(text: S.of(context).light)
                : UnSelectedItem(text: S.of(context).light),
          ),
          SizedBox(height: context.height * 0.02),
          GestureDetector(
            onTap: () => themingProvider.changeTheme(ThemeMode.dark),
            child: themingProvider.themeMode == ThemeMode.dark
                ? IsSelectedItem(text: S.of(context).dark)
                : UnSelectedItem(text: S.of(context).dark),
          ),
        ],
      ),
    );
  }
}
