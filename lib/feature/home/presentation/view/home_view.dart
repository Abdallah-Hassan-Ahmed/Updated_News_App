import 'package:flutter/material.dart';
import 'package:news_app/core/extension/extensions.dart';
import 'package:news_app/feature/home/presentation/widget/app_bar_widget.dart';
import 'package:news_app/feature/home/presentation/widget/drawer_widget.dart';
import 'package:news_app/feature/home/presentation/widget/list_news_category.dart';
import 'package:news_app/generated/l10n.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  static const String routeName = 'home_view';
  List<String> times = [
    S.current.good_morning,
    S.current.good_afternoon,
    S.current.good_evening,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBarWidget(text: S.of(context).home),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.height * 0.025,
          vertical: context.height * 0.01,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              timeShow(context),
              Text(
                S.of(context).news_for_you,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              NewsCategoryList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget timeShow(BuildContext context) {
    final hour = TimeOfDay.now().hour;

    if (hour < 12) {
      return Text(
        S.of(context).good_morning,
        style: Theme.of(context).textTheme.bodyMedium,
      );
    } else if (hour < 17) {
      return Text(
        S.of(context).good_afternoon,
        style: Theme.of(context).textTheme.bodyMedium,
      );
    } else {
      return Text(
        S.of(context).good_evening,
        style: Theme.of(context).textTheme.bodyMedium,
      );
    }
  }
}
