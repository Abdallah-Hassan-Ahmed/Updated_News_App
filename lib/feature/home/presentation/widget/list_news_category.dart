import 'package:flutter/material.dart';
import 'package:news_app/config/routes/app_routes.dart';
import 'package:news_app/config/theme/theme_provider.dart';
import 'package:news_app/core/extension/extensions.dart';
import 'package:news_app/core/utils/app_image.dart';
import 'package:news_app/feature/home/presentation/widget/card_item.dart';
import 'package:news_app/generated/l10n.dart';
import 'package:provider/provider.dart';

class NewsCategoryList extends StatelessWidget {
  NewsCategoryList({super.key});
  List<String> title = [
    S.current.general,
    S.current.business,
    S.current.sport,
    S.current.health,
    S.current.entertainment,
    S.current.technology,
    S.current.science,
  ];
  List<String> imageLight = [
    AppImages.general,
    AppImages.business,
    AppImages.sports,
    AppImages.health,
    AppImages.entertainment,
    AppImages.technology,
    AppImages.science,
  ];
  List<String> imageDark = [
    AppImages.generalDark,
    AppImages.businessDark,
    AppImages.sportsDark,
    AppImages.healthDark,
    AppImages.entertainmentDark,
    AppImages.technologyDark,
    AppImages.scienceDark,
  ];

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: title.length,
      separatorBuilder: (context, index) =>
          SizedBox(height: context.height * 0.015),
      itemBuilder: (context, index) {
        return CardContentItem(
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.category,
              arguments: title[index],
            );
          },
          num: index + 1,
          text: title[index],
          imagePath: themeProvider.isDark()
              ? imageLight[index]
              : imageDark[index],
        );
      },
    );
  }
}
