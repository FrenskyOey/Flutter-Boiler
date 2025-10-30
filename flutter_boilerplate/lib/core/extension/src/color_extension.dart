import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/themes/app_color.dart';

/// Extension methods on BuildContext to easily access Theme data.
///
/// This removes the need to constantly write 'Theme.of(context).'
extension ColorExtensions on BuildContext {
  /// Returns the entire [ThemeData] for the current context.
  ThemeData get theme => Theme.of(this);

  /// Returns the [ColorScheme] from the theme for easy access to colors.
  ColorScheme get colorScheme => theme.colorScheme;

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

  /// High-emphasis color for text and icons over background color.
  Color get textPrimary => AppColor.textPrimary();

  Color get textSecondary => AppColor.textSecondary();
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
