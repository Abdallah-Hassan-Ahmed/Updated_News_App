import 'package:flutter/material.dart';
import 'package:news_app/core/extension/extensions.dart';
import 'package:news_app/core/utils/app_color.dart';
import 'package:news_app/feature/news/data/model/news_response.dart';
import 'package:news_app/feature/news/presentation/widget/news_sources_body.dart';
import 'package:news_app/feature/news/presentation/widget/tab_name.dart';

class ItemTabs extends StatefulWidget {
  const ItemTabs({super.key, required this.sourcesList});
  final List<Sources> sourcesList;

  @override
  State<ItemTabs> createState() => _ItemTapsState();
}

class _ItemTapsState extends State<ItemTabs> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
        children: [
          SizedBox(height: context.height * 0.01),
          TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            dividerColor: AppColor.transparent,
            indicatorColor: Theme.of(context).colorScheme.onSecondary,
            onTap: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
            tabs: widget.sourcesList.map((sources) {
              return TabName(
                sourcesList: sources,
                isSelected:
                    widget.sourcesList.indexOf(sources) == selectedIndex,
              );
            }).toList(),
          ),
          Expanded(
            child: NewsSourcesBody(source:widget.sourcesList[selectedIndex]),
          ),
        ],
      ),
    );
  }
}
