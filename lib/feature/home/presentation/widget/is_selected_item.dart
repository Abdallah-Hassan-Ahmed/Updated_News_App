import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_font_styles.dart';

class IsSelectedItem extends StatelessWidget {
  const IsSelectedItem({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: AppFont.semi14Black.copyWith(
            fontSize: 18,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
        Spacer(),
        Icon(
          Icons.check_sharp,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ],
    );
  }
}
