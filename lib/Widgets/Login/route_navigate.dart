import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

Route createScaleRoute_login(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = 0.0; // بداية الحجم من 0
      const end = 1.0; // النهاية بالحجم الكامل
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

Route createSlideRoute_forget(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // الحصول على اتجاه الكتابة (LTR أو RTL)
      final isRtl = Directionality.of(context) == TextDirection.rtl;

      // تحديد نقطة البداية بناءً على اللغة
      const begin = Offset(1.0, 0.0); // بداية من اليمين
      final end = Offset.zero; // النهاية في المنتصف

      // إذا كانت اللغة RTL، نبدأ من الشمال
      final startOffset = isRtl ? Offset(-1.0, 0.0) : begin;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: startOffset, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
