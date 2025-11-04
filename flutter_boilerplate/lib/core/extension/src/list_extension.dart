import 'package:flutter/material.dart';

extension CollectionSafetyExtensions<T> on Iterable<T>? {
  /// Checks if the iterable is null or empty.
  bool get isNullOrEmpty {
    return this == null || this!.isEmpty;
  }

  /// Checks if the iterable is NOT null and NOT empty.
  bool get isNotNullOrEmpty {
    return !isNullOrEmpty;
  }

  /// Returns the iterable or an empty list if it is null.
  Iterable<T> get valueOrEmpty => this ?? [];

  /// Returns the first element of the iterable, or null if the iterable is null or empty.
  T? get safeFirst => isNotNullOrEmpty ? this!.first : null;
}

/// Extension methods on non-nullable [Iterable] for common collection utilities.
extension IterableUtilityExtensions<T> on Iterable<T> {
  /// Converts the iterable into a list of widgets, applying a separator (like a SizedBox)
  /// between each item.
  List<Widget> toWidgetListWithSeparator({
    required Widget separator,
    required Widget Function(T item) builder,
  }) {
    final list = <Widget>[];
    final items = toList();

    for (int i = 0; i < items.length; i++) {
      list.add(builder(items[i]));
      // Add separator after every item except the last one
      if (i < items.length - 1) {
        list.add(separator);
      }
    }
    return list;
  }

  /// Converts the iterable into a list of widgets, mapping each element.
  List<Widget> toWidgetList(Widget Function(T item) builder) {
    return map(builder).toList();
  }

  /// Attempts to get the element at the given [index], returning null if the index is out of bounds.
  T? safeElementAt(int index) {
    if (index >= 0 && index < length) {
      return elementAt(index);
    }
    return null;
  }
}

// Example Usage:
/*
List<String>? data;
if (data.isNotNullOrEmpty) {
  // Safe to use 'data!'
}

List<String> items = ['A', 'B', 'C'];
// Creating a column with 8 pixels of vertical spacing between each Text widget
Column(
  children: items.toWidgetListWithSeparator(
    separator: const SizedBox(height: 8.0),
    builder: (item) => Text('Item: $item'),
  ),
);
*/
