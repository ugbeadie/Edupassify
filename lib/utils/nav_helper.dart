import 'package:flutter/material.dart';

class AppNavigator {
  /// Push with fade transition
  static void fadeTo(
    BuildContext context,
    Widget page, {
    bool replace = false,
  }) {
    final route = PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 600),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );

    if (replace) {
      Navigator.pushReplacement(context, route);
    } else {
      Navigator.push(context, route);
    }
  }

  /// Push with slide transition (right-to-left)
  static void slideTo(
    BuildContext context,
    Widget page, {
    bool replace = false,
  }) {
    final route = PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 600),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeInOut));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );

    if (replace) {
      Navigator.pushReplacement(context, route);
    } else {
      Navigator.push(context, route);
    }
  }
}
