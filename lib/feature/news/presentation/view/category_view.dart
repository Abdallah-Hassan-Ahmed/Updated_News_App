import 'package:flutter/material.dart';
import 'package:news_app/core/api/api%20manager/news_api.dart';
import 'package:news_app/feature/home/presentation/widget/app_bar_widget.dart';
import 'package:news_app/feature/home/presentation/widget/drawer_widget.dart';
import 'package:news_app/feature/news/data/model/news_response.dart';
import 'package:news_app/feature/news/presentation/widget/error_widget.dart';
import 'package:news_app/feature/news/presentation/widget/item_tabs.dart';
import 'package:news_app/generated/l10n.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  static const String routeName = "categoryName";

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  Future<NewsResponseTabs>? _newsFuture;
  String? categoryId;
  String? categoryTitle;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

      categoryId = args['id'];
      categoryTitle = args['title'];

      _newsFuture = NewsApiManager.getResponse(categoryId!);

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    /// لسه البيانات مجتش
    if (categoryTitle == null || _newsFuture == null) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      );
    }

    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBarWidget(text: categoryTitle! , controller: TextEditingController() , onPressed: () {
        
      },),
      body: FutureBuilder<NewsResponseTabs>(
        future: _newsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            );
          }

          if (snapshot.hasError) {
            return ErrorsWidget(
              title: S.of(context).server_error_user,
              onPressed: () {
                setState(() {
                  _newsFuture = NewsApiManager.getResponse(categoryId!);
                });
              },
            );
          }

          if (snapshot.data?.status != "ok") {
            return ErrorsWidget(
              title: S.of(context).server_error,
              onPressed: () {
                setState(() {
                  _newsFuture = NewsApiManager.getResponse(categoryId!);
                });
              },
            );
          }

          return ItemTabs(sourcesList: snapshot.data?.sources ?? []);
        },
      ),
    );
  }
}
