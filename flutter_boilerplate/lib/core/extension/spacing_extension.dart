import 'package:flutter/material.dart';

/// Extension methods on [num] (int or double) to quickly create
/// [SizedBox] widgets for spacing and padding.
extension SpacingExtensions on num {
  /// Returns a [SizedBox] with the height set to the value of the number.
  ///
  /// Example: `16.verticalSpace` creates `SizedBox(height: 16.0)`
  SizedBox get verticalSpace => SizedBox(height: toDouble());

  /// Returns a [SizedBox] with the width set to the value of the number.
  ///
  /// Example: `8.horizontalSpace` creates `SizedBox(width: 8.0)`
  SizedBox get horizontalSpace => SizedBox(width: toDouble());

  // --- Shorthands for cleaner syntax ---

  /// Shorthand for [verticalSpace].
  SizedBox get vSpace => verticalSpace;

  /// Shorthand for [horizontalSpace].
  SizedBox get hSpace => horizontalSpace;

  // --- Widget extensions for symmetrical padding ---

  /// Wraps a widget with symmetrical vertical padding defined by the number.
  ///
  /// Example: `16.vPadding(myWidget)` adds 16.0 vertical padding.
  Widget vPadding(Widget child) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: toDouble()),
      child: child,
    );
  }

  /// Wraps a widget with symmetrical horizontal padding defined by the number.
  ///
  /// Example: `8.hPadding(myWidget)` adds 8.0 horizontal padding.
  Widget hPadding(Widget child) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: toDouble()),
      child: child,
    );
  }

  /// Wraps a widget with padding on all sides defined by the number.
  ///
  /// Example: `20.allPadding(myWidget)` adds 20.0 padding on all sides.
  Widget allPadding(Widget child) {
    return Padding(padding: EdgeInsets.all(toDouble()), child: child);
  }
}
