import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_color.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key, required this.text});
  final String text;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 0.7);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 4,
      centerTitle: true,
      backgroundColor: AppColor.transparent,
      title: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
    );
  }
}
