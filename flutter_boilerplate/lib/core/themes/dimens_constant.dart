// A static class holding all standardized dimension constants (Design Tokens).
/// This T-shirt size scale is based on a **base unit of 8.0** for consistency.
class Dimens {
  // The fundamental spacing unit, often 4.0 or 8.0
  static const double base = 8.0;

  // --- Standardized Spacing Scale (T-Shirt Sizing) ---

  /// **Extra Small** spacing (4.0) - Ideal for tiny margins, dividers, or item list gaps.
  static const double xs = 0.5 * base; // 4.0

  /// **Small** spacing (8.0) - Standard internal padding for small components, buttons, or icons.
  static const double sm = 1.0 * base; // 8.0

  /// **Medium Small** spacing (12.0) - Standard internal padding for small components, buttons, or icons.
  static const double ms = 1.5 * base; // 12.0

  /// **Medium** spacing (16.0) - Standard spacing between major components or cards.
  static const double md = 2.0 * base; // 16.0

  /// **Large** spacing (20.0) - Spacing between sections or major layout groups.
  static const double lg = 2.5 * base; // 20.0

  /// **Extra Large (XL)** spacing (24.0) - Significant gaps in layout, often for vertical section spacing.
  static const double xl = 3.0 * base; // 24.0

  /// **Double Extra Large (XXL)** spacing (28.0) - Very large margins or page headers padding.
  static const double xxl = 3.5 * base; // 28.0

  /// **Triple Extra Large (XXXL)** spacing (32.0) - Maximum top/bottom screen padding or large empty states.
  static const double xxxl = 4.0 * base; // 32.0

  // --- Other useful constants ---

  /// Standard corner radius for cards and containers.
  static const double borderRadius = 10.0; // 10.0

  /// Standard thickness for subtle dividers or card borders.
  static const double stroke = 1.0;

  /// Standard icon size.
  static const double iconSize = 24.0;
}

// Example Usage:
/*
Column(
  children: <Widget>[
    // Spacing between a header and a list
    const SizedBox(height: AppDimens.lg), // 20.0
    
    Card(
      child: Padding(
        // Uniform padding inside the card
        padding: const EdgeInsets.all(AppDimens.md), // 16.0
        child: Row(
          children: <Widget>[
            Text('Item'),
            const SizedBox(width: AppDimens.sm), // 8.0
            Icon(Icons.star),
          ],
        ),
      ),
    ).onTap(() => print('Card Tapped')), // Using the widget extension!
    
    // Spacing between cards
    const SizedBox(height: AppDimens.xs), // 4.0
    
    // Another card...
  ],
)
*/
