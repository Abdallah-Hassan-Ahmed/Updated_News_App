import 'package:flutter/material.dart';
import 'package:news_app/core/api/api%20manager/news_api.dart';
import 'package:news_app/feature/news/data/model/news_by_sources.dart';
import 'package:news_app/feature/news/data/model/news_response.dart';
import 'package:news_app/feature/news/presentation/widget/error_widget.dart';
import 'package:news_app/feature/news/presentation/widget/news_card_widget.dart';
import 'package:news_app/generated/l10n.dart';

class NewsSourcesBody extends StatefulWidget {
  const NewsSourcesBody({
    super.key,
    required this.source,
    required this.isSearch,
    required this.text,
  });

  final Sources source;
  final bool isSearch;
  final String text;

  @override
  State<NewsSourcesBody> createState() => _NewsSourcesBodyState();
}

class _NewsSourcesBodyState extends State<NewsSourcesBody> {
  late Future<NewsResponseBySource> _newsFuture;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    final String query =
      widget.text.trim().isEmpty ? "news" : widget.text.trim();
    _newsFuture = widget.isSearch
        ? NewsApiManager.getNewsBySources(widget.source.id ?? '')
        :NewsApiManager.search(query) ;
  }

  @override
  void didUpdateWidget(covariant NewsSourcesBody oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.text != widget.text ||
        oldWidget.isSearch != widget.isSearch ||
        oldWidget.source.id != widget.source.id) {
      setState(() {
        _loadData();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponseBySource>(
      future: _newsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError || snapshot.data?.status != "ok") {
          return ErrorsWidget(
            title: S.of(context).server_error_user,
            onPressed: () {
              setState(() {
                _loadData();
              });
            },
          );
        }

        final listItem = snapshot.data?.articles ?? [];

        if (listItem.isEmpty) {
          return Center(
            child: Text(
              "S.of(context).no_data_found,",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          );
        }

        return ListView.builder(
          itemCount: listItem.length,
          itemBuilder: (context, index) {
            return NewsCard(news: listItem[index]);
          },
        );
      },
    );
  }
}