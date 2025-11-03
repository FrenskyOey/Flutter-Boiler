import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/extension/index.dart';
import 'package:flutter_boilerplate/core/themes/dimens_constant.dart';

class ErrorStateWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onButtonPressed;

  const ErrorStateWidget({
    super.key,
    this.imagePath = "assets/images/error.png",
    this.title = "Error",
    this.subtitle = "Please try again latter",
    this.buttonText = "Retry",
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(height: Dimens.xxxl),
            Text(
              title,
              style: context.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12.0),
            Text(
              subtitle,
              style: context.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 36.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onButtonPressed,
                child: Text(buttonText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
