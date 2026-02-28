import 'package:flutter/material.dart';
import 'package:news_app/feature/news/data/model/news_response.dart';

class TabName extends StatelessWidget {
  const TabName({
    super.key,
    required this.sourcesList,
    required this.isSelected,
  });
  final Sources sourcesList;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Text(
      sourcesList.name ?? '',
      style: isSelected
          ? Theme.of(context).textTheme.headlineMedium
          : Theme.of(context).textTheme.headlineSmall,
    );
  }
}
