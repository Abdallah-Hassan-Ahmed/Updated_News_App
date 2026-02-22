import 'package:flutter/material.dart';
import 'package:news_app/core/extension/extensions.dart';

class CustomSnakBarWidget {
  static void SnakBar({BuildContext? context, Color? color, String text = ""}) {
    ScaffoldMessenger.of(context!).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(context.height*0.02),
        padding:EdgeInsets.all(context.height*0.02) ,
        backgroundColor: color, content: Text(text)),
    );
  }
}
