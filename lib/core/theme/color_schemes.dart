import 'package:flutter/material.dart';
import 'package:sticker_manager_wc22/core/theme/palette.dart';

class AppColorSchemes {
  static final light = ColorScheme.fromSeed(
    seedColor: AppPalette.brand,
    surface: AppPalette.surfaceLight,
    surfaceContainer: AppPalette.surfaceContainerLight,
  );

  static final dark = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: AppPalette.brand,
  );
}
