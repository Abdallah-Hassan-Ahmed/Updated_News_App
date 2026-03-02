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
  late Future<NewsResponseTabs> _newsFuture;
  String? categoryId;
  String? categoryTitle;
  bool isSearch = true;
  TextEditingController controller = TextEditingController();

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
    if (categoryTitle == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBarWidget(
        text: categoryTitle!,
        isSearch: isSearch,
        controller: controller,
        onChange: (value) {
          setState(() {}); // بس عشان يبعت text جديد
        },
        onPressed: () {
          setState(() {
            isSearch = !isSearch;
          });
        },
        onPressed2: () {
          setState(() {
            isSearch = !isSearch;
          });
        },
      ),
      body: FutureBuilder<NewsResponseTabs>(
        future: _newsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || snapshot.data?.status != "ok") {
            return ErrorsWidget(
              title: S.of(context).server_error,
              onPressed: () {
                setState(() {
                  _newsFuture = NewsApiManager.getResponse(categoryId!);
                });
              },
            );
          }

          return ItemTabs(
            sourcesList: snapshot.data!.sources ?? [],
            isSearch: isSearch,
            text: controller.text,
          );
        },
      ),
    );
  }
}
