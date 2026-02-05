import 'package:flutter/material.dart';
import 'package:sticker_manager_wc22/core/theme/palette.dart';

class AppConstants {
  static const brandGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppPalette.brand, AppPalette.brandDark],
  );
}
