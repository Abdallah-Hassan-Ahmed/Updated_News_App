import 'package:flutter/material.dart';
import 'package:news_app/config/widget/custom_text_field.dart';
import 'package:news_app/core/extension/extensions.dart';
import 'package:news_app/core/utils/app_color.dart';
import 'package:news_app/generated/l10n.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    required this.text,
    this.onPressed,
    this.isSearch = true,
    required this.controller,
    this.onPressed2,
  });
  final String text;
  final void Function()? onPressed;
  final void Function()? onPressed2;
  final bool isSearch;
  final TextEditingController controller;

  @override
  Size get preferredSize =>
      Size.fromHeight(isSearch ? kToolbarHeight * 0.7 : kToolbarHeight * 1.5);

  @override
  Widget build(BuildContext context) {
    return isSearch
        ? AppBar(
            titleSpacing: 4,
            centerTitle: true,
            elevation: 0,
            scrolledUnderElevation: 0,
            backgroundColor: AppColor.transparent,
            title: Text(text, style: Theme.of(context).textTheme.titleMedium),
            actions: [
              IconButton(onPressed: onPressed, icon: Icon(Icons.search)),
            ],
          )
        : Padding(
            padding: EdgeInsets.all(context.height * 0.015),
            child: SafeArea(
              child: CustomTextField(
                controller: controller,
                hint: S.of(context).search,
                prefixIcon: Icon(
                  Icons.search,
                  size: 20,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                suffixIcons: IconButton(
                  color: Colors.amberAccent,
                  onPressed: onPressed2,
                  icon: Icon(
                    size: 20,
                    Icons.close,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ),
            ),
          );
  }
}
