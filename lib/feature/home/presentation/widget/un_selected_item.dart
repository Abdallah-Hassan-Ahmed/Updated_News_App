import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_font_styles.dart';

class UnSelectedItem extends StatelessWidget {
  const UnSelectedItem({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppFont.semi14Black.copyWith(
        fontSize: 18,
        color: Theme.of(context).colorScheme.onSecondary,
      ),
    );
  }
}
