import 'package:flutter/material.dart';
import 'package:news_app/config/routes/app_routes.dart';
import 'package:news_app/config/theme/theme_provider.dart';
import 'package:news_app/core/extension/extensions.dart';
import 'package:news_app/core/utils/app_image.dart';
import 'package:news_app/feature/home/data/model/category_model.dart';
import 'package:news_app/feature/home/presentation/widget/card_item.dart';
import 'package:news_app/generated/l10n.dart';
import 'package:provider/provider.dart';

class NewsCategoryList extends StatelessWidget {
  NewsCategoryList({super.key});

  final List<CategoryModel> categoryModel = [
    CategoryModel(
      id: 'general',
      title: S.current.general,
      imageLight: AppImages.general,
      imageDark: AppImages.generalDark,
    ),
    CategoryModel(
      id: 'business',
      title: S.current.business,
      imageLight: AppImages.business,
      imageDark: AppImages.businessDark,
    ),
    CategoryModel(
      id: 'sports',
      title: S.current.sport,
      imageLight: AppImages.sports,
      imageDark: AppImages.sportsDark,
    ),
    CategoryModel(
      id: 'health',
      title: S.current.health,
      imageLight: AppImages.health,
      imageDark: AppImages.healthDark,
    ),
    CategoryModel(
      id: 'entertainment',
      title: S.current.entertainment,
      imageLight: AppImages.entertainment,
      imageDark: AppImages.entertainmentDark,
    ),
    CategoryModel(
      id: 'technology',
      title: S.current.technology,
      imageLight: AppImages.technology,
      imageDark: AppImages.technologyDark,
    ),
    CategoryModel(
      id: 'science',
      title: S.current.science,
      imageLight: AppImages.science,
      imageDark: AppImages.scienceDark,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: categoryModel.length,
      separatorBuilder: (context, index) =>
          SizedBox(height: context.height * 0.02),
      itemBuilder: (context, index) {
        return CardContentItem(
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.category,
              arguments: {
                'id': categoryModel[index].id,
                'title': categoryModel[index].title,
              },
            );
          },
          num: index + 1,
          text: categoryModel[index].title,
          imagePath: themeProvider.isDark()
              ? categoryModel[index].imageLight
              : categoryModel[index].imageDark,
        );
      },
    );
  }
}
