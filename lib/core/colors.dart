// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AppColors {
  // ===== Brand =====
  static const Color brandGreen = Color(0xFF25D366);
  static const Color accentTeal = Color(0xFF00A884);
  static const Color brandDark = Color(0xFF075E54);

  // ===== Surfaces / Backgrounds =====
  static const Color backgroundLight = Color(0xFFF0F2F5); 
  static const Color surfaceLight = Color(0xFFFFFFFF); 
  static const Color backgroundDark = Color(0xFF0B141A);
  static const Color surfaceDark = Color(0xFF111B21);

  // ===== AppBar / Header =====
  static const Color appBarLight = surfaceLight;
  static const Color appBarDark = Color(0xFF202C33);

  // ===== Text =====
  static const Color textPrimaryLight = Color(0xFF111B21);
  static const Color textSecondaryLight = Color(0xFF667781);
  static const Color textPrimaryDark = Color(0xFFE9EDEF);
  static const Color textSecondaryDark = Color(0xFF8696A0);

  // ===== Icons =====
  static const Color iconLight = Color(0xFF54656F); 
  static const Color iconDark = Color(0xFFAEBAC1);

  // ===== Dividers / Strokes =====
  static const Color dividerLight = Color(0xFFE6E6E6);
  static const Color dividerDark = Color(0xFF2A3942); 

  // ===== Chat Bubbles =====
  static const Color chatIncomingLight = surfaceLight;
  static const Color chatOutgoingLight = Color(0xFFDCF8C6);
  static const Color chatIncomingDark = Color(0xFF1F2C34);
  static const Color chatOutgoingDark = Color(0xFF005C4B);

  // ===== Badges / Status =====
  static const Color badgeUnreadBg = brandGreen; 
  static const Color badgeUnreadText = Colors.white;
  static const Color onlineDot = Color(0xFF25D366);

  // ===== Feedback =====
  static const Color error = Color(0xFFFF3B30);
  static const Color onError = Colors.white;

  // ===== Overlays =====
  static const Color overlayBlack = Color(0x66000000);
}

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