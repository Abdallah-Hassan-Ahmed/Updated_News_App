import 'package:flutter/material.dart';
import 'package:news_app/feature/home/presentation/view/home_view.dart';
import 'package:news_app/feature/news/presentation/view/category_view.dart';

class AppRoutes {
  static final String home = HomeView.routeName;
  static final String category = CategoryView.routeName;

  static Map<String, WidgetBuilder> routes = {
    home: (context) => HomeView(),
    category: (context) => CategoryView(),
  };
}
