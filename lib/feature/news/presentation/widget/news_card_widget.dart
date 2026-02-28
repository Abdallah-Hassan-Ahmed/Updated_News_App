import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/core/extension/extensions.dart';
import 'package:news_app/core/utils/app_color.dart';
import 'package:news_app/core/utils/app_font_styles.dart';
import 'package:news_app/feature/news/data/model/news_by_sources.dart';
import 'package:news_app/feature/news/presentation/widget/news_details.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.news});
  final News news;
  String formatDate(String? date) {
    if (date == null || date.isEmpty) return '';
    final parsed = DateTime.parse(date).toLocal();
    return DateFormat('dd MMM yyyy').format(parsed);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showModalBottomNewsSheet(context),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: context.height * 0.015,
          horizontal: context.width * 0.03,
        ),
        margin: EdgeInsets.only(
          left: context.height * 0.02,
          right: context.height * 0.02,
          top: context.height * 0.02,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: Theme.of(context).colorScheme.onSecondary,
            width: 1.5,
          ),
        ),
        child: Column(
          children: [
            Visibility(
              visible: news.urlToImage != null && news.urlToImage!.isNotEmpty,
              child: SizedBox(
                height: context.height * 0.25,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: news.urlToImage!,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: AppColor.grayColor.withOpacity(0.09),
                      child: Icon(
                        Icons.broken_image,
                        color: AppColor.grayColor,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: context.height * 0.01),

            Text(
              news.title ?? '',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(),
            ),
            SizedBox(height: context.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "By : ${news.author ?? ''}",
                    // maxLines: 3,
                    // softWrap: true,
                    style: AppFont.semi12Gray,
                  ),
                ),
                Text(formatDate(news.publishedAt), style: AppFont.semi12Gray),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showModalBottomNewsSheet(BuildContext context) {
    showModalBottomSheet(
      elevation: 0,
      backgroundColor: AppColor.transparent,
      context: context,
      builder: (context) => NewsDetails(news: news),
    );
  }
}
