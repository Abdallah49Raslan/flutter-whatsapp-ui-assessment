import 'package:flutter/widgets.dart';

/// مقياس ثابت للمسافات (استخدمه دائمًا بدل أرقام مباشرة)
class Spacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double xxl = 24;
  static const double xxxl = 32;
}

/// أدوات جاهزة للـ EdgeInsets + فجوات قياسية
class Insets {
  // all
  static const EdgeInsets allXs = EdgeInsets.all(Spacing.xs);
  static const EdgeInsets allSm = EdgeInsets.all(Spacing.sm);
  static const EdgeInsets allMd = EdgeInsets.all(Spacing.md);
  static const EdgeInsets allLg = EdgeInsets.all(Spacing.lg);
  static const EdgeInsets allXl = EdgeInsets.all(Spacing.xl);

  // symmetric helpers
  static EdgeInsets h(double v) => EdgeInsets.symmetric(horizontal: v);
  static EdgeInsets v(double v) => EdgeInsets.symmetric(vertical: v);

  // paddings الشائعة
  static const EdgeInsets listTile = EdgeInsets.symmetric(
    horizontal: Spacing.lg,
    vertical: Spacing.sm,
  );
}

class Gaps {
  static const SizedBox xs = SizedBox(width: Spacing.xs, height: Spacing.xs);
  static const SizedBox sm = SizedBox(width: Spacing.sm, height: Spacing.sm);
  static const SizedBox md = SizedBox(width: Spacing.md, height: Spacing.md);
  static const SizedBox lg = SizedBox(width: Spacing.lg, height: Spacing.lg);
  static const SizedBox xl = SizedBox(width: Spacing.xl, height: Spacing.xl);
}