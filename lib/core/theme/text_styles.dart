import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static final TextTheme textTheme = GoogleFonts.rajdhaniTextTheme().copyWith(
    headlineSmall: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
    titleLarge: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    titleMedium: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    titleSmall: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    bodyLarge: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    bodyMedium: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    bodySmall:  const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    labelLarge: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    labelMedium: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    labelSmall: const TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
  );
}
