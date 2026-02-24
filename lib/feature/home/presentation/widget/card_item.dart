import 'package:flutter/material.dart';
import 'package:news_app/core/extension/extensions.dart';
import 'package:news_app/core/utils/app_color.dart';
import 'package:news_app/generated/l10n.dart';

class CardContentItem extends StatelessWidget {
  CardContentItem({
    super.key,
    required this.text,
    required this.imagePath,
    required this.num,
    required this.onTap,
  });
  final String text;
  final String imagePath;
  final int num;
  late bool isRight = num % 2 == 0;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
      height: context.height * 0.25,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(24),
            child: Image.asset(
              imagePath,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: !isRight ? context.width * 0.08 : null,
            left: !isRight ? null : context.width * 0.05,
            top: context.width * 0.09,
            child: Text(
              text,
              style: Theme.of(
                context,
              ).textTheme.labelMedium!.copyWith(fontSize: 26),
            ),
          ),
          Positioned(
            right: !isRight ? context.width * 0.08 : null,
            left: !isRight ? null : context.width * 0.05,
            top: context.width * 0.24,
            child: Container(
              width: context.width * 0.4,
              height: context.height * 0.063,
              decoration: BoxDecoration(
                color: AppColor.grayColor,
                borderRadius: BorderRadius.circular(90),
              ),
              child: GestureDetector(
                onTap: onTap,
                child: !isRight
                    ? Row(
                        children: [
                          SizedBox(width: context.width * 0.04),
                          Text(
                            S.current.view_all,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            width: context.height * 0.06,
                            height: context.height * 0.06,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onPrimary,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.chevron_right,
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Container(
                            width: context.height * 0.06,
                            height: context.height * 0.06,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onPrimary,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.chevron_left,
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            S.current.view_all,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                          ),
                          SizedBox(width: context.width * 0.04),
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
