import 'package:flutter/material.dart';

/// Extension methods on [Widget] to provide common styling, spacing,
/// and interaction wrappers without deeply nested code.
extension WidgetExtensions on Widget {
  // --- Sizing and Alignment ---

  /// Wraps the widget in a [SizedBox] with the given width.
  Widget withWidth(double width) {
    return SizedBox(width: width, child: this);
  }

  /// Wraps the widget in a [SizedBox] with the given height.
  Widget withHeight(double height) {
    return SizedBox(height: height, child: this);
  }

  /// Wraps the widget in a [SizedBox] with both width and height set.
  Widget withSize(double size) {
    return SizedBox(width: size, height: size, child: this);
  }

  /// Wraps the widget in a [Center] widget.
  Widget get centered => Center(child: this);

  /// Wraps the widget in a [Align] widget with the specified alignment.
  Widget withAlignment(Alignment alignment) {
    return Align(alignment: alignment, child: this);
  }

  // --- Padding ---

  /// Wraps the widget in [Padding] with uniform padding on all sides.
  Widget paddingAll(double value) {
    return Padding(padding: EdgeInsets.all(value), child: this);
  }

  /// Wraps the widget in [Padding] with symmetrical horizontal padding.
  Widget paddingHorizontal(double value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: value),
      child: this,
    );
  }

  /// Wraps the widget in [Padding] with symmetrical vertical padding.
  Widget paddingVertical(double value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: value),
      child: this,
    );
  }

  Widget paddingBoth(double vertical, double horizontal) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: this,
    );
  }

  /// Wraps the widget in [Padding] using [EdgeInsets.only].
  Widget paddingOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
      ),
      child: this,
    );
  }

  // --- Interaction ---

  /// Wraps the widget in a [GestureDetector] for a quick tap handler.
  Widget onTap(VoidCallback onTap) {
    return GestureDetector(onTap: onTap, child: this);
  }
}

// Example Usage:
/*
// Old way (nested hell):
Padding(
  padding: const EdgeInsets.all(16.0),
  child: SizedBox(
    width: 200,
    child: GestureDetector(
      onTap: () => print('Tapped'),
      child: const Text('Click Me').withAlignment(Alignment.center),
    ),
  ),
);

// New way with extensions (flat structure):
const Text('Click Me')
    .withAlignment(Alignment.center)
    .onTap(() => print('Tapped'))
    .withWidth(200)
    .paddingAll(16.0);
*/
