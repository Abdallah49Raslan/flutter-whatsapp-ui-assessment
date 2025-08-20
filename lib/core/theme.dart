import 'package:flutter/material.dart';
import 'colors.dart';
import 'spacing.dart';
import 'typography.dart';

/// تكوين ThemeData للوضعين (Light/Dark)
/// القيم تأتي حصريًا من: colors/spacing/typography (لا قيم سحرية).
class AppTheme {
  static ThemeData light() {
    final scheme = AppColorScheme.light;
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      textTheme: AppTypography.lightTextTheme(),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.appBarLight,
        foregroundColor: scheme.onSurface,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.iconLight),
        titleTextStyle: AppTypography.title.copyWith(color: scheme.onSurface),
      ),
      iconTheme: IconThemeData(color: AppColors.iconLight),
      dividerColor: AppColors.dividerLight,
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: scheme.inverseSurface,
          borderRadius: BorderRadius.circular(Spacing.md),
        ),
        textStyle: AppTypography.caption.copyWith(color: scheme.onInverseSurface),
      ),
    );
  }

  static ThemeData dark() {
    final scheme = AppColorScheme.dark;
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      textTheme: AppTypography.darkTextTheme(),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.appBarDark,
        foregroundColor: scheme.onSurface,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.iconDark),
        titleTextStyle: AppTypography.title.copyWith(color: scheme.onSurface),
      ),
      iconTheme: IconThemeData(color: AppColors.iconDark),
      dividerColor: AppColors.dividerDark,
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: scheme.inverseSurface,
          borderRadius: BorderRadius.circular(Spacing.md),
        ),
        textStyle: AppTypography.caption.copyWith(color: scheme.onInverseSurface),
      ),
    );
  }
}