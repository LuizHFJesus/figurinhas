import 'package:flutter/material.dart';
import 'package:sticker_manager_wc22/core/theme/color_schemes.dart';
import 'package:sticker_manager_wc22/core/theme/text_styles.dart';

class AppTheme {
  static ThemeData light() {
    final colorScheme = AppColorSchemes.light;

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: AppTextStyles.textTheme.apply(
        bodyColor: colorScheme.onSurface,
        displayColor: colorScheme.onSurface,
      ),
      scaffoldBackgroundColor: colorScheme.surface,
      canvasColor: colorScheme.surface,
    );
  }

  static ThemeData dark() {
    final colorScheme = AppColorSchemes.dark;

    return ThemeData(
      useMaterial3: true,
      colorScheme: AppColorSchemes.dark,
      textTheme: AppTextStyles.textTheme.apply(
        bodyColor: colorScheme.onSurface,
        displayColor: colorScheme.onSurface,
      ),
      scaffoldBackgroundColor: colorScheme.surface,
      canvasColor: colorScheme.surface,
    );
  }
}
