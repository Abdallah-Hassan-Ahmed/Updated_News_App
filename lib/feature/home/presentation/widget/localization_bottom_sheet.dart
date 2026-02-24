import 'package:flutter/material.dart';
import 'package:news_app/config/language/localization_provider.dart';
import 'package:news_app/core/extension/extensions.dart';
import 'package:news_app/feature/home/presentation/widget/is_selected_item.dart';
import 'package:news_app/feature/home/presentation/widget/un_selected_item.dart';
import 'package:news_app/generated/l10n.dart';
import 'package:provider/provider.dart';

class LocalizationBottomSheet extends StatelessWidget {
  const LocalizationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var localProvider = Provider.of<LocalizationProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.height * 0.04,
        vertical: context.height * 0.033,
      ),
      height: context.height * 0.22,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () => localProvider.changeLang("en"),
            child: localProvider.localeState == "en"
                ? IsSelectedItem(text: S.current.english)
                : UnSelectedItem(text: S.current.english),
          ),
          SizedBox(height: context.height * 0.02),
          GestureDetector(
            onTap: () => localProvider.changeLang("ar"),
            child: localProvider.localeState == "ar"
                ? IsSelectedItem(text: S.current.arabic)
                : UnSelectedItem(text: S.current.arabic),
          ),
        ],
      ),
    );
  }
}
