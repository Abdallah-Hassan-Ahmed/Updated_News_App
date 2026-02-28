import 'package:flutter/material.dart';
import 'package:news_app/config/widget/custom_botton_widget.dart';
import 'package:news_app/core/extension/extensions.dart';
import 'package:news_app/generated/l10n.dart';

class ErrorsWidget extends StatelessWidget {
  const ErrorsWidget({super.key, required this.title, required this.onPressed});
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(context.height * 0.035),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text(title)),
          SizedBox(height: context.height * 0.04),
          CustomButton(
            text:S.of(context).try_again,
            textStyle: Theme.of(context).textTheme.bodyMedium,
            borderColor: Theme.of(context).colorScheme.onSecondary,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
