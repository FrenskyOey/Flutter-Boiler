import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/extension/index.dart';
import 'package:flutter_boilerplate/core/themes/app_color.dart';
import 'package:flutter_boilerplate/core/themes/dimens_constant.dart';

/// A custom, generic button component for social sign-in,
/// designed to match the provided border and click style.
class SocialLoginButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final String logoUrl;

  const SocialLoginButton({
    super.key,
    this.text = "Sign in with Google",
    required this.onPressed,
    this.logoUrl = 'https://developers.google.com/identity/images/g-logo.png',
  });

  // Default color for the border
  static const Color _borderColor = Color(0xFF757575);
  static const double _buttonHeight = 48.0;
  static const double _borderRadius = 8.0;
  static const double _logoSize = 20.0;

  @override
  Widget build(BuildContext context) {
    return Material(
      // The button's main container with border and background
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_borderRadius),
        side: const BorderSide(color: _borderColor, width: 1.0),
      ),
      elevation: 0,

      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(_borderRadius),
        child: Container(
          height: _buttonHeight,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.network(
                logoUrl,
                width: _logoSize,
                height: _logoSize,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.public,
                  color: AppColor.secondary,
                  size: _logoSize,
                ),
              ).paddingAll(2.0),
              Dimens.sm.space,
              Text(
                text,
                style: context.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
