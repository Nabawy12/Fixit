
import 'package:flutter/material.dart';

enum TransitionType { fade, scale, slide, rightToLeft, leftToRight, bottomToTop }

class FadeRoute extends PageRouteBuilder {
  final Widget page;
  FadeRoute(this.page)
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = 0.0;
      const end = 1.0;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var fadeAnimation = animation.drive(tween);

      return FadeTransition(
        opacity: fadeAnimation,
        child: child,
      );
    },
  );
}

class ScaleRoute extends PageRouteBuilder {
  final Widget page;
  ScaleRoute(this.page)
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = 0.0;
      const end = 1.0;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var scaleAnimation = animation.drive(tween);

      return ScaleTransition(
        scale: scaleAnimation,
        child: child,
      );
    },
  );
}

class SlideRoute extends PageRouteBuilder {
  final Widget page;
  final Offset begin;
  final Offset end;
  SlideRoute(this.page, {this.begin = const Offset(0.0, 1.0), this.end = Offset.zero})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var tween = Tween(begin: begin, end: end);
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}