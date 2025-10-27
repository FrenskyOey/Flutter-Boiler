import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/themes/app_color.dart';

import 'package:google_fonts/google_fonts.dart';

class AppText {
  static final baseTextTheme = GoogleFonts.epilogueTextTheme().copyWith(
    headlineLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColor.textPrimary(),
    ),
    headlineMedium: TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColor.textPrimary(),
    ),
    headlineSmall: TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColor.textPrimary(),
    ),
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColor.textPrimary(),
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColor.textPrimary(),
    ),
    titleSmall: TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColor.textPrimary(),
    ),
    // BODY: Regular and Black
    bodyLarge: TextStyle(
      fontWeight: FontWeight.normal,
      color: AppColor.textPrimary(),
    ),
    bodyMedium: TextStyle(
      fontWeight: FontWeight.normal,
      color: AppColor.textPrimary(),
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.normal,
      color: AppColor.textPrimary(),
    ),
    // CAPTION: Light and Primary Color
    labelSmall: TextStyle(
      fontWeight: FontWeight.w300,
      color: AppColor.textSecondary(),
    ),
    labelLarge: TextStyle(
      fontWeight: FontWeight.w300,
      color: AppColor.textSecondary(),
    ),
  );

  static final darkTextTheme = GoogleFonts.epilogueTextTheme().copyWith(
    headlineLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColor.textPrimary(isDarkMode: true),
    ),
    headlineMedium: TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColor.textPrimary(isDarkMode: true),
    ),
    headlineSmall: TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColor.textPrimary(isDarkMode: true),
    ),
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColor.textPrimary(isDarkMode: true),
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColor.textPrimary(isDarkMode: true),
    ),
    titleSmall: TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColor.textPrimary(isDarkMode: true),
    ),
    // BODY: Regular and Black
    bodyLarge: TextStyle(
      fontWeight: FontWeight.normal,
      color: AppColor.textPrimary(isDarkMode: true),
    ),
    bodyMedium: TextStyle(
      fontWeight: FontWeight.normal,
      color: AppColor.textPrimary(isDarkMode: true),
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.normal,
      color: AppColor.textPrimary(isDarkMode: true),
    ),
    // CAPTION: Light and Primary Color
    labelSmall: TextStyle(
      fontWeight: FontWeight.w300,
      color: AppColor.textSecondary(isDarkMode: true),
    ),
    labelLarge: TextStyle(
      fontWeight: FontWeight.w300,
      color: AppColor.textSecondary(isDarkMode: true),
    ),
  );
}
