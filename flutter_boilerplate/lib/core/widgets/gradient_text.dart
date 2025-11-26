import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/themes/app_color.dart';

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    super.key,
    this.gradient = const LinearGradient(
      colors: <Color>[
        AppColor.primary,
        AppColor.secondary,
        Color.fromARGB(255, 1, 58, 23),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    this.style = const TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) {
        return gradient.createShader(
          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        );
      },
      child: Text(text, style: style),
    );
  }
}
