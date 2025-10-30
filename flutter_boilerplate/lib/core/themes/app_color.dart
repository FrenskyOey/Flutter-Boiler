import 'package:flutter/material.dart';

class AppColor {
  static const Color primary = Color(0xFF4CA034);
  static const Color secondary = Color(0xFF638763);
  static const Color tertiary = Color(0xFFE8F7E8);
  static const Color error = Color(0xFFFF453A);

  // Dynamic Colors (Theme-dependent logic)

  /// Returns the primary background color based on the mode.
  static Color background({bool isDarkMode = false}) {
    // True Black for Dark, Very Light Gray for Light
    return isDarkMode ? Colors.black : const Color(0xFFFFFFFF);
  }

  /// Returns the primary surface color (e.g., card, AppBar) based on the mode.
  static Color surface({bool isDarkMode = false}) {
    // Dark Slate for Dark, Pure White for Light
    return isDarkMode ? const Color(0xFF1C1C1E) : Colors.white;
  }

  /// Returns the primary text color based on the mode.
  static Color textPrimary({bool isDarkMode = false}) {
    return isDarkMode ? Colors.white : const Color(0xFF3E3E3E);
  }

  /// Returns the primary text color based on the mode.
  static Color textSecondary({bool isDarkMode = false}) {
    return isDarkMode ? Colors.grey.shade200 : secondary;
  }

  /// Returns the input field fill color based on the mode.
  static Color inputFill({bool isDarkMode = false}) {
    return isDarkMode ? const Color(0xFF2C2C2E) : surface();
  }

  static Color disabledColor({bool isDarkMode = false}) {
    return isDarkMode
        ? const Color(0xFF48484A)
        : const Color(0xFFC7C7CC); // Dark gray/Light gray
  }

  /// Returns the text color for disabled widgets (the foreground).
  static Color disabledTextColor({bool isDarkMode = false}) {
    return isDarkMode
        ? const Color(0xFF8E8E93)
        : const Color(0xFFAEAEB2); // Muted for contrast
  }
}
