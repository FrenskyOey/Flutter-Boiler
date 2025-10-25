import 'package:flutter/material.dart';

/// Extension methods on BuildContext to easily access MediaQuery data,
/// simplifying responsive design checks and screen dimension retrieval.
extension MediaQueryExtensions on BuildContext {
  /// Returns the entire [MediaQueryData] for the current context.
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  // --- Screen Dimensions ---

  /// The total height of the screen (excluding system areas like notch/status bar).
  double get screenHeight => mediaQuery.size.height;

  /// The total width of the screen.
  double get screenWidth => mediaQuery.size.width;

  /// The height of the status bar (top padding).
  double get statusBarHeight => mediaQuery.padding.top;

  /// The height of the keyboard (zero if not visible).
  double get viewInsetsBottom => mediaQuery.viewInsets.bottom;

  /// The fraction of screen height that the keyboard occupies.
  double get keyboardFraction => viewInsetsBottom / screenHeight;

  // --- Orientation and Aspect Ratio ---

  /// Returns true if the device is in portrait mode.
  bool get isPortrait => mediaQuery.orientation == Orientation.portrait;

  /// Returns true if the device is in landscape mode.
  bool get isLandscape => mediaQuery.orientation == Orientation.landscape;

  // --- Responsive Design Helpers (Breakpoints based on common standards) ---

  /// Returns true if the screen width is small (e.g., typical mobile phone).
  /// (Max width up to 600)
  bool get isMobile => screenWidth < 600;

  /// Returns true if the screen width is medium (e.g., large phone or tablet in portrait).
  /// (Width between 600 and 1024)
  bool get isTablet => screenWidth >= 600 && screenWidth < 1024;

  /// Returns true if the screen width is large (e.g., desktop or large tablet in landscape).
  /// (Min width 1024)
  bool get isDesktop => screenWidth >= 1024;

  // --- Padding Accessors (System Insets) ---

  /// Returns the system padding (safe area) for all sides.
  EdgeInsets get viewPadding => mediaQuery.viewPadding;

  /// Returns the minimum safe area padding (useful for avoiding dynamic keyboard issues).
  EdgeInsets get viewInsets => mediaQuery.viewInsets;
}

// Example of how you would use this extension:
/*
class ResponsiveLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (context.isMobile) {
      return Container(height: context.screenHeight * 0.5, color: Colors.blue);
    } else if (context.isTablet) {
      return Container(height: context.screenHeight * 0.8, color: Colors.green);
    } else {
      return Container(height: context.screenHeight * 0.9, color: Colors.red);
    }
  }
}
*/
