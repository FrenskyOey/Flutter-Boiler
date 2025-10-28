import 'package:flutter/material.dart';

extension TextThemeExtensions on BuildContext {
  
  // Getter for the current [TextTheme].
  TextTheme get textTheme => Theme.of(this).textTheme;

  // --- Display Styles (Large, typically reserved for large-screen typography) ---

  /// Display Large style from the theme's text theme.
  TextStyle? get displayLarge => textTheme.displayLarge;

  /// Display Medium style.
  TextStyle? get displayMedium => textTheme.displayMedium;

  /// Display Small style.
  TextStyle? get displaySmall => textTheme.displaySmall;

  // --- Headline Styles (For titles and primary headings) ---

  /// Headline Large style (e.g., major screen titles).
  TextStyle? get headlineLarge => textTheme.headlineLarge;

  /// Headline Medium style.
  TextStyle? get headlineMedium => textTheme.headlineMedium;

  /// Headline Small style.
  TextStyle? get headlineSmall => textTheme.headlineSmall;

  // --- Title Styles (For subtitles and smaller section headers) ---

  /// Title Large style.
  TextStyle? get titleLarge => textTheme.titleLarge;

  /// Title Medium style.
  TextStyle? get titleMedium => textTheme.titleMedium;

  /// Title Small style.
  TextStyle? get titleSmall => textTheme.titleSmall;

  // --- Body Styles (For general text, paragraphs) ---

  /// Body Large style (standard, readable body text).
  TextStyle? get bodyLarge => textTheme.bodyLarge;

  /// Body Medium style (default text style).
  TextStyle? get bodyMedium => textTheme.bodyMedium;

  /// Body Small style.
  TextStyle? get bodySmall => textTheme.bodySmall;

  // --- Label Styles (For labels, captions, buttons) ---

  /// Label Large style (e.g., primary button text).
  TextStyle? get labelLarge => textTheme.labelLarge;

  /// Label Medium style (e.g., small captions, input hints).
  TextStyle? get labelMedium => textTheme.labelMedium;

  /// Label Small style.
  TextStyle? get labelSmall => textTheme.labelSmall;
}

// Example Usage:
/*
Text(
  'Welcome!',
  // Clean access:
  style: context.headlineLarge?.copyWith(
    color: context.colorScheme.primary, // Using color extension too!
  ),
),
*/