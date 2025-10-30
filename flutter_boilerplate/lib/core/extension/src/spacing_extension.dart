import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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

  /// Example: `8.allSpace` creates `SizedBox(width: 8.0)`
  SizedBox get allSpace => SizedBox(width: toDouble(), height: toDouble());

  // --- Shorthands for cleaner syntax ---
  Gap get space => Gap(toDouble());

  /// Shorthand for [verticalSpace].
  SizedBox get vSpace => verticalSpace;

  /// Shorthand for [horizontalSpace].
  SizedBox get hSpace => horizontalSpace;

  /// Shorthand for [allSpace].
  SizedBox get aSpace => allSpace;
}
