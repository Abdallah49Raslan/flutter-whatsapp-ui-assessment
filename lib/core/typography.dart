import 'package:flutter/material.dart';
import 'colors.dart';

/// هرم النص القياسي: title, subtitle, body, caption, overline
class AppTypography {
  // ملاحظة: لم نحدد fontFamily لتجنب الاعتماد على أصول خارجية.

  // أحجام + أوزان + line-height (height = lineHeight / fontSize)
  static const double _titleSize = 20; // عناوين أساسية (AppBar/شاشات)
  static const double _subtitleSize = 16; // عناوين فرعية/عناصر القوائم
  static const double _bodySize = 14; // نصوص عامة ورسائل
  static const double _captionSize = 12; // طوابع الوقت/نص ثانوي
  static const double _overlineSize = 10; // وسوم صغيرة/حالات ثانوية

  static const double _titleLH = 24; // line-height بالنقاط
  static const double _subtitleLH = 22;
  static const double _bodyLH = 20;
  static const double _captionLH = 16;
  static const double _overlineLH = 14;

  // TextStyles الأساسية
  static const TextStyle title = TextStyle(
    fontSize: _titleSize,
    fontWeight: FontWeight.w700,
    height: _titleLH / _titleSize,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: _subtitleSize,
    fontWeight: FontWeight.w600,
    height: _subtitleLH / _subtitleSize,
  );

  static const TextStyle body = TextStyle(
    fontSize: _bodySize,
    fontWeight: FontWeight.w400,
    height: _bodyLH / _bodySize,
  );

  static const TextStyle caption = TextStyle(
    fontSize: _captionSize,
    fontWeight: FontWeight.w400,
    height: _captionLH / _captionSize,
  );

  static const TextStyle overline = TextStyle(
    fontSize: _overlineSize,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.4,
    height: _overlineLH / _overlineSize,
  );

  /// TextTheme مُوحّد، الألوان تُطبَّق لاحقًا عبر `apply` حسب الثيم
  static const TextTheme baseTextTheme = TextTheme(
    titleLarge: title,
    titleMedium: subtitle,
    bodyLarge: body,
    bodyMedium: body,
    bodySmall: caption,
    labelSmall: overline,
  );

  static TextTheme lightTextTheme() => baseTextTheme.apply(
        bodyColor: AppColors.textPrimaryLight,
        displayColor: AppColors.textPrimaryLight,
      );

  static TextTheme darkTextTheme() => baseTextTheme.apply(
        bodyColor: AppColors.textPrimaryDark,
        displayColor: AppColors.textPrimaryDark,
      );
}