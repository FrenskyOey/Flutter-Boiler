import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/extension/index.dart';
import 'package:flutter_boilerplate/core/themes/dimens_constant.dart';

class EmptyStateWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const EmptyStateWidget({
    super.key,
    this.imagePath = "assets/images/empty.png",
    this.title = "Attention",
    this.subtitle = "The Data is Empty",
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
            ).paddingAll(Dimens.md),
            const SizedBox(height: 40),
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
          ],
        ),
      ),
    );
  }
}
