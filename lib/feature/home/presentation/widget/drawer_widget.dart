import 'package:flutter/material.dart';
import 'package:news_app/config/routes/base_routes.dart';
import 'package:news_app/config/widget/custom_botton_widget.dart';
import 'package:news_app/core/extension/extensions.dart';
import 'package:news_app/core/utils/app_color.dart';
import 'package:news_app/core/utils/app_font_styles.dart';
import 'package:news_app/core/utils/app_image.dart';
import 'package:news_app/feature/home/presentation/view/home_view.dart';
import 'package:news_app/feature/home/presentation/widget/localization_bottom_sheet.dart';
import 'package:news_app/feature/home/presentation/widget/theming_bottom_sheet.dart';
import 'package:news_app/generated/l10n.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: context.width * 0.65,
      shape: BeveledRectangleBorder(),
      child: Container(
        color: AppColor.bgDark,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: context.height * 0.19,
              color: AppColor.bgLight,
              child: Text(S.of(context).news_app, style: AppFont.bold24Black),
            ),

            SizedBox(height: context.height * 0.01),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(context.width * 0.035),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    GestureDetector(
                      onTap: () =>
                          Navigator.push(context, BaseRoute(page: HomeView())),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(AppImages.homeIcon),
                          SizedBox(width: context.width * 0.03),
                          Text(
                            S.of(context).go_to_home,
                            style: AppFont.bold20White,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: context.height * 0.01),

                    Divider(color: AppColor.bgLight, thickness: 1.5),

                    SizedBox(height: context.height * 0.025),

                    // todo : theming
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(AppImages.themeIcon),
                        SizedBox(width: context.width * 0.03),
                        Text(S.of(context).theme, style: AppFont.bold20White),
                      ],
                    ),

                    SizedBox(height: context.height * 0.01),

                    CustomButton(
                      text: S.of(context).light,
                      onPressed: () {
                        showThemeBottomSheet(context);
                      },
                      bgColor: AppColor.transparent,
                      textStyle: AppFont.semi20White.copyWith(fontSize: 18),
                      borderColor: AppColor.bgLight,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: AppColor.bgLight,
                        size: 28,
                      ),
                    ),

                    SizedBox(height: context.height * 0.01),

                    Divider(color: AppColor.bgLight, thickness: 1.5),

                    SizedBox(height: context.height * 0.025),

                    // todo : language
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(AppImages.langIcon),
                        SizedBox(width: context.width * 0.03),
                        Text(
                          S.of(context).language,
                          style: AppFont.bold20White,
                        ),
                      ],
                    ),

                    SizedBox(height: context.height * 0.01),

                    CustomButton(
                      text: context.localProvider.isEnglish()
                          ? S.of(context).english
                          : S.of(context).arabic,
                      onPressed: () {
                        showLanguageModalBottomSheet(context);
                      },
                      bgColor: AppColor.transparent,
                      textStyle: AppFont.semi20White.copyWith(fontSize: 18),
                      borderColor: AppColor.bgLight,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: AppColor.bgLight,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showLanguageModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => LocalizationBottomSheet(),
    );
  }

  void showThemeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => ThemingBottomSheet(),
    );
  }
}
