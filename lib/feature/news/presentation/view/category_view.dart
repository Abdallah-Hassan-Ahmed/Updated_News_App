import 'package:flutter/material.dart';
import 'package:news_app/feature/home/presentation/widget/app_bar_widget.dart';
import 'package:news_app/feature/home/presentation/widget/drawer_widget.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  static const String routeName = "categoryName";

  @override
  Widget build(BuildContext context) {
    final String title = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBarWidget(text: title),
      body: Center(child: Text(title)),
    );
  }
}
