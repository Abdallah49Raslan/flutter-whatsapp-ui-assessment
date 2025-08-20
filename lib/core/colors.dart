// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AppColors {
  // ===== Brand =====
  static const Color brandGreen = Color(0xFF25D366); // يستخدم كـ لون أساسي (Primary): أزرار تأكيد، Badges غير المقروء
  static const Color accentTeal = Color(0xFF00A884); // لون ثانوي (Secondary): عناصر تفاعلية ثانوية، شِبْه الروابط
  static const Color brandDark = Color(0xFF075E54); // للخلفيات الداكنة المرتبطة بالعلامة (AppBar/Headers في ثيم داكن)

  // ===== Surfaces / Backgrounds =====
  static const Color backgroundLight = Color(0xFFF0F2F5); // خلفية عامة للتطبيق (الشاشات)
  static const Color surfaceLight = Color(0xFFFFFFFF); // بطاقات/حاويات/قوائم (Light)
  static const Color backgroundDark = Color(0xFF0B141A); // خلفية عامة (Dark)
  static const Color surfaceDark = Color(0xFF111B21); // بطاقات/حاويات/قوائم (Dark)

  // ===== AppBar / Header =====
  static const Color appBarLight = surfaceLight; // AppBar في الوضع الفاتح
  static const Color appBarDark = Color(0xFF202C33); // AppBar في الوضع الداكن

  // ===== Text =====
  static const Color textPrimaryLight = Color(0xFF111B21); // نص أساسي (عناوين/محتوى أساسي)
  static const Color textSecondaryLight = Color(0xFF667781); // نص ثانوي (معلومات مساعدة/تاريخ الرسالة)
  static const Color textPrimaryDark = Color(0xFFE9EDEF); // نص أساسي في الداكن
  static const Color textSecondaryDark = Color(0xFF8696A0); // نص ثانوي في الداكن

  // ===== Icons =====
  static const Color iconLight = Color(0xFF54656F); // أيقونات في الفاتح (AppBar/Tab/Actions)
  static const Color iconDark = Color(0xFFAEBAC1); // أيقونات في الداكن

  // ===== Dividers / Strokes =====
  static const Color dividerLight = Color(0xFFE6E6E6); // فواصل قوائم وبوردارات خفيفة (Light)
  static const Color dividerDark = Color(0xFF2A3942); // فواصل قوائم وبوردارات خفيفة (Dark)

  // ===== Chat Bubbles =====
  static const Color chatIncomingLight = surfaceLight; // فقاعة الرسالة المستقبَلة (Light)
  static const Color chatOutgoingLight = Color(0xFFDCF8C6); // فقاعة الرسالة المُرسَلة (Light)
  static const Color chatIncomingDark = Color(0xFF1F2C34); // فقاعة الرسالة المستقبَلة (Dark)
  static const Color chatOutgoingDark = Color(0xFF005C4B); // فقاعة الرسالة المُرسَلة (Dark)

  // ===== Badges / Status =====
  static const Color badgeUnreadBg = brandGreen; // خلفية عدّاد الرسائل غير المقروءة
  static const Color badgeUnreadText = Colors.white; // نصّ العدّاد
  static const Color onlineDot = Color(0xFF25D366); // نقطة الحالة (متصل)

  // ===== Feedback =====
  static const Color error = Color(0xFFFF3B30); // رسائل خطأ/حالات سلبية
  static const Color onError = Colors.white; // لون النص فوق خلفيات الخطأ

  // ===== Overlays =====
  static const Color overlayBlack = Color(0x66000000); // تغطية نصف شفافة (Dialogs/Story overlay)
}

/// مخططات الألوان الجاهزة للـ ThemeData
class AppColorScheme {
  static final ColorScheme light = ColorScheme.light(
    primary: AppColors.brandGreen,
    onPrimary: Colors.white,
    secondary: AppColors.accentTeal,
    onSecondary: Colors.white,
    background: AppColors.backgroundLight,
    onBackground: AppColors.textPrimaryLight,
    surface: AppColors.surfaceLight,
    onSurface: AppColors.textPrimaryLight,
    surfaceVariant: AppColors.dividerLight,
    error: AppColors.error,
    onError: AppColors.onError,
  );

  static final ColorScheme dark = ColorScheme.dark(
    primary: AppColors.brandGreen,
    onPrimary: Colors.white,
    secondary: AppColors.accentTeal,
    onSecondary: Colors.white,
    background: AppColors.backgroundDark,
    onBackground: AppColors.textPrimaryDark,
    surface: AppColors.surfaceDark,
    onSurface: AppColors.textPrimaryDark,
    surfaceVariant: AppColors.dividerDark,
    error: AppColors.error,
    onError: AppColors.onError,
  );
}