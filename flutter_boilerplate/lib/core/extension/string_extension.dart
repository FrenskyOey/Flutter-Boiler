/// Extension methods on [String?] for common validation, safety checks,
/// and utility functions.
extension StringValidationExtensions on String? {
  /// Checks if the string is null or empty (including strings that only contain whitespace).
  bool get isNullOrEmpty {
    return this == null || this!.trim().isEmpty;
  }

  /// Checks if the string is NOT null and NOT empty.
  bool get isNotNullOrEmpty {
    return !isNullOrEmpty;
  }

  /// Returns the string value, or an empty string if it is null.
  String get valueOrEmpty => this ?? '';

  // --- Validation ---

  /// A basic validation check for a typical email format.
  bool get isValidEmail {
    if (isNullOrEmpty) return false;
    // Regex for basic email format (user@domain.tld)
    final emailRegex = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    );
    return emailRegex.hasMatch(this!);
  }

  /// Checks if the password meets a minimum length requirement (e.g., 8 characters).
  bool isPasswordMinLength(int minLength) {
    if (isNullOrEmpty) return false;
    return this!.length >= minLength;
  }

  /// Checks if the string contains only digits.
  bool get isNumeric {
    if (isNullOrEmpty) return false;
    return double.tryParse(this!) != null;
  }

  /// Checks if the string is a valid URL (basic check).
  bool get isValidUrl {
    if (isNullOrEmpty) return false;
    return Uri.tryParse(this!.trim())?.hasAbsolutePath ?? false;
  }
}

/// Extension methods on [String] for formatting and manipulation.
extension StringFormattingExtensions on String {
  /// Returns the string with the first letter capitalized.
  ///
  /// Example: 'hello world' -> 'Hello world'
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  /// Returns the string with every word's first letter capitalized.
  ///
  /// Example: 'hello world' -> 'Hello World'
  String toTitleCase() {
    if (isEmpty) return this;
    return split(' ').map((word) => word.capitalize()).join(' ');
  }

  /// Truncates the string if it exceeds [maxLength], adding '...' at the end.
  String truncate({int maxLength = 100}) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}...';
  }
}
