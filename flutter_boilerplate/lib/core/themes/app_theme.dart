import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/themes/component/app_bar.dart';
import 'package:flutter_boilerplate/core/themes/component/app_button.dart';
import 'package:flutter_boilerplate/core/themes/app_color.dart';
import 'package:flutter_boilerplate/core/themes/component/app_input.dart';
import 'package:flutter_boilerplate/core/themes/app_text.dart';

class AppTheme {
  // --- LIGHT THEME (Base Theme) ---
  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: AppColor.primary,
        secondary: AppColor.secondary,
        tertiary: AppColor.tertiary,
        surface: AppColor.surface(),
        error: AppColor.error,
        onPrimary: Colors.white,
        onSurface: Colors.black,
      ),
      appBarTheme: appBarLight,
      textTheme: AppText.baseTextTheme,
      inputDecorationTheme: AppInput.inputLightTheme,
      // button styling
      elevatedButtonTheme: elevatedButton,
      filledButtonTheme: fillButton,
      outlinedButtonTheme: outlineButton,
      textButtonTheme: textButton,
      cardTheme: CardThemeData(
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }

  // --- DARK THEME ---
  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: AppColor.primary,
        secondary: AppColor.secondary,
        tertiary: AppColor.tertiary,
        surface: AppColor.surface(isDarkMode: true),
        error: AppColor.error,
        onPrimary: Colors.white,
        onSurface: Colors.white,
      ),
      appBarTheme: appBarDark,
      textTheme: AppText.darkTextTheme,
      inputDecorationTheme: AppInput.inputDarkTheme,
      // button styling
      elevatedButtonTheme: elevatedButton,
      filledButtonTheme: fillButton,
      outlinedButtonTheme: outlineButton,
      textButtonTheme: textButton,
      cardTheme: CardThemeData(
        color: const Color(0xFF2C2C2E),
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}
