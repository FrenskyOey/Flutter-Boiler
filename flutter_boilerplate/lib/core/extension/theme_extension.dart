import 'package:flutter/material.dart';

/// Extension methods on BuildContext to easily access Theme data.
///
/// This removes the need to constantly write 'Theme.of(context).'
extension ThemeExtensions on BuildContext {
  /// Returns the entire [ThemeData] for the current context.
  ThemeData get theme => Theme.of(this);

  /// Returns the [ColorScheme] from the theme for easy access to colors.
  ColorScheme get colorScheme => theme.colorScheme;

  /// Returns the [TextTheme] from the theme for easy access to styles.
  TextTheme get textTheme => theme.textTheme;

  // --- Color Accessors (from ColorScheme) ---

  /// Primary color, typically used for main UI elements.
  Color get primary => colorScheme.primary;

  /// Secondary color, often used for accents and floating action buttons.
  Color get secondary => colorScheme.secondary;

  /// Tertiary color, used for contrasting accents.
  Color get tertiary => colorScheme.tertiary;

  /// Background color.
  Color get background => colorScheme.surface;

  /// Surface color, typically used for cards and sheets.
  Color get surface => colorScheme.surface;

  /// Color used for error messages and indicators.
  Color get error => colorScheme.error;

  /// High-emphasis color for text and icons over primary color.
  Color get onPrimary => colorScheme.onPrimary;

  /// High-emphasis color for text and icons over surface color.
  Color get onSurface => colorScheme.onSurface;

  /// High-emphasis color for text and icons over background color.
  Color get onBackground => colorScheme.onSurface;

  /// High-emphasis color for text and icons over error color.
  Color get onError => colorScheme.onError;

  // --- Text Style Accessors (from TextTheme) ---

  /// Largest text style for headlines.
  TextStyle? get displayLarge => textTheme.displayLarge;

  /// Large text style for headlines.
  TextStyle? get displayMedium => textTheme.displayMedium;

  /// Medium text style for headlines.
  TextStyle? get displaySmall => textTheme.displaySmall;

  /// Largest text style for headings.
  TextStyle? get headlineLarge => textTheme.headlineLarge;

  /// Medium text style for headings.
  TextStyle? get headlineMedium => textTheme.headlineMedium;

  /// Small text style for headings.
  TextStyle? get headlineSmall => textTheme.headlineSmall;

  /// Largest text style for titles (e.g., app bar titles).
  TextStyle? get titleLarge => textTheme.titleLarge;

  /// Medium text style for titles.
  TextStyle? get titleMedium => textTheme.titleMedium;

  /// Small text style for titles.
  TextStyle? get titleSmall => textTheme.titleSmall;

  /// Largest text style for body text.
  TextStyle? get bodyLarge => textTheme.bodyLarge;

  /// Medium text style for body text (default body style).
  TextStyle? get bodyMedium => textTheme.bodyMedium;

  /// Smallest text style for body text.
  TextStyle? get bodySmall => textTheme.bodySmall;

  /// Text style for buttons and other prominent UI elements.
  TextStyle? get labelLarge => textTheme.labelLarge;

  /// Medium text style for labels (e.g., form field hints).
  TextStyle? get labelMedium => textTheme.labelMedium;

  /// Smallest text style for labels.
  TextStyle? get labelSmall => textTheme.labelSmall;
}

// Example of how you would use this extension:
/*
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.background, // Used to be: Theme.of(context).colorScheme.background
      child: Text(
        'Themed Text',
        style: context.bodyLarge?.copyWith(
          color: context.primary, // Used to be: Theme.of(context).colorScheme.primary
        ),
      ),
    );
  }
}
*/
