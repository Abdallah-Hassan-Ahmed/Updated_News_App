import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/config/widget/custom_botton_widget.dart';
import 'package:news_app/core/extension/extensions.dart';
import 'package:news_app/core/utils/app_color.dart';

import 'package:news_app/feature/news/data/model/news_by_sources.dart';
import 'package:news_app/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({super.key, required this.news});
  final News news;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: EdgeInsets.all(context.height * 0.015),
      margin: EdgeInsets.all(context.height * 0.02),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(14),
            child: CachedNetworkImage(
              errorWidget: (context, url, error) => Container(
                color: AppColor.grayColor.withOpacity(0.09),
                child: Icon(
                  Icons.broken_image,
                  color: AppColor.grayColor,
                  size: 40,
                ),
              ),
              placeholder: (context, url) => CircularProgressIndicator(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              imageUrl: news.urlToImage ?? '',
            ),
          ),
          SizedBox(height: context.height * 0.01),
          Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            news.description ?? '',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Text(
            '[+${news.description?.length} char]',
            style: Theme.of(context).textTheme.bodySmall,
          ),

          SizedBox(height: context.height * 0.01),

          CustomButton(
            text: S.of(context).view_full_article,
            onPressed: () => _launchUrl(news.url ?? ''),
            textStyle: Theme.of(context).textTheme.bodySmall,
            borderColor: Theme.of(context).colorScheme.onPrimary,
          ),
        ],
      ),
    );
  }
}

void _launchUrl(String? url) async {
  Uri uri = Uri.parse(url ?? '');
  print(url);
  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $uri');
  }
}
