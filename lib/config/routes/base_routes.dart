import 'package:flutter/material.dart';

class BaseRoute<T> extends PageRouteBuilder<T> {
  BaseRoute({required Widget page})
      : super(
          pageBuilder: (_, __, ___) => page,
          transitionsBuilder: (_, animation, __, child) {
            final curve = CurvedAnimation(
              parent: animation,
              curve: Curves.linearToEaseOut,
            );

            return ScaleTransition(
              scale: Tween(begin: 0.0, end: 1.0).animate(curve),
              child: child,
            );
          },
        );
}
