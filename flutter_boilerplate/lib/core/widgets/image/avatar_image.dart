import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/extension/src/text_style_extension.dart';
import 'package:flutter_boilerplate/core/themes/app_color.dart';

enum AvatarSize { small, medium, large }

/// A customizable avatar widget that displays a user's profile image from a URL,
/// or a fallback icon, or a text initial with a dynamically colored background.
class AvatarImage extends StatelessWidget {
  final String? src;
  final String? name;
  final AvatarSize size;
  final Color borderColor;
  final double borderWidth;

  const AvatarImage({
    super.key,
    this.src,
    this.name,
    this.size = AvatarSize.medium,
    this.borderColor = AppColor.secondary,
    this.borderWidth = 2.0,
  });

  /// Maps the AvatarSize enum to a specific pixel radius.
  double _getRadius(AvatarSize size) {
    switch (size) {
      case AvatarSize.small:
        return 16.0; // 32x32 total size
      case AvatarSize.medium:
        return 24.0; // 48x48 total size
      case AvatarSize.large:
        return 40.0; // 80x80 total size
    }
  }

  Color _getBackgroundColor(String? name) {
    if (name == null || name.isEmpty) {
      return Colors.lightGreen;
    }

    final String firstChar = name[0].toUpperCase();
    if (int.tryParse(firstChar) != null) {
      return Colors.black;
    }

    final Map<String, Color> colorMap = {
      'A': Colors.red.shade700,
      'B': Colors.green.shade700,
      'C': Colors.blue.shade700,
      'D': Colors.purple.shade700,
      'E': Colors.orange.shade700,
      'F': Colors.deepPurple.shade700,
      'G': Colors.teal.shade700,
      'H': Colors.indigo.shade700,
      'I': Colors.brown.shade700,
      'J': Colors.cyan.shade700,
      'K': Colors.lime.shade800,
      'L': Colors.pink.shade700,
      'M': Colors.amber.shade800,
      'N': Colors.lightBlue.shade700,
      'O': Colors.deepOrange.shade700,
      'P': Colors.blueGrey.shade700,
      'Q': Colors.redAccent.shade700,
      'R': Colors.greenAccent.shade700,
      'S': Colors.lightGreen.shade700,
      'T': Colors.grey.shade700,
      'U': Colors.indigoAccent.shade700,
      'V': Colors.tealAccent.shade700,
      'W': Colors.brown.shade700,
      'X': Colors.blueAccent.shade700,
      'Y': Colors.orangeAccent.shade700,
      'Z': Colors.purpleAccent.shade700,
    };

    return colorMap[firstChar] ??
        Colors.lightGreen; // Default if character not mapped
  }

  @override
  Widget build(BuildContext context) {
    Widget childWidget;
    Color backgroundColor = _getBackgroundColor(name);
    final double currentRadius = _getRadius(size);

    if (src != null && src!.isNotEmpty) {
      childWidget = Image.network(
        src!,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Icon(Icons.person, color: Colors.white, size: currentRadius);
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                : null,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            strokeWidth: 2,
          );
        },
      );
    } else if (name != null && name!.isNotEmpty) {
      final String initial = name![0].toUpperCase();
      childWidget = Text(
        initial,
        style: context.titleLarge?.copyWith(
          color: Colors.white,
          fontSize: currentRadius,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      childWidget = Icon(
        Icons.person,
        color: Colors.white,
        size: currentRadius,
      );
    }

    // The Container uses the calculated radius
    return Container(
      width: currentRadius * 2 + (borderWidth * 2),
      height: currentRadius * 2 + (borderWidth * 2),
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        border: Border.all(color: borderColor, width: borderWidth),
      ),
      child: ClipOval(child: Center(child: childWidget)),
    );
  }
}
