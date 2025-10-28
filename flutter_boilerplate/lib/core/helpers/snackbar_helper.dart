import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/extension/index.dart';
import 'package:flutter_boilerplate/core/themes/dimens_constant.dart';

/// Defines the possible states (types) for the custom SnackBar.
enum SnackBarState { Success, Warning, Error }

class SnackBarHelper {
  static ({String title, Color color}) _getStateDetails(SnackBarState state) {
    switch (state) {
      case SnackBarState.Success:
        return (title: "Success", color: Colors.green.shade700);
      case SnackBarState.Warning:
        return (title: "Warning", color: Colors.amber.shade700);
      case SnackBarState.Error:
        return (title: "Error", color: Colors.red.shade700);
    }
  }

  /// The core method responsible for displaying the custom SnackBar UI.
  static void _showCustomSnackBar(
    BuildContext context,
    SnackBarState state,
    String subtitle,
  ) {
    final details = _getStateDetails(state);
    final messenger = ScaffoldMessenger.of(context);

    messenger.hideCurrentSnackBar();

    final customSnackBar = SnackBar(
      duration: const Duration(seconds: 4),
      behavior: SnackBarBehavior.floating,
      elevation: 6,
      margin: const EdgeInsets.all(Dimens.md),
      backgroundColor:
          Colors.transparent, // Set to transparent to use custom content color
      content: Container(
        padding: const EdgeInsets.symmetric(
          vertical: Dimens.ms,
          horizontal: Dimens.sm,
        ),
        decoration: BoxDecoration(
          color: details.color,
          borderRadius: BorderRadius.circular(
            Dimens.borderRadius,
          ), // Rounded corners for aesthetics
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    details.title,
                    style: context.titleSmall!.copyWith(color: Colors.white),
                  ),
                  Dimens.xs.verticalSpace,
                  Text(
                    subtitle,
                    style: context.bodyMedium!.copyWith(color: Colors.white),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Dimens.sm.horizontalSpace,
            IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 20),
              onPressed: () {
                messenger.hideCurrentSnackBar();
              },
              tooltip: 'Dismiss',
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
      ),
    );

    messenger.showSnackBar(customSnackBar);
  }

  // --- Public Helper Methods ---

  /// Generic method to show a SnackBar with a specified state.
  static void showSnackBar(
    BuildContext context,
    SnackBarState state,
    String subtitle,
  ) {
    _showCustomSnackBar(context, state, subtitle);
  }

  /// Convenience method to show a Success SnackBar (Green).
  static void showSuccess(BuildContext context, String subtitle) {
    _showCustomSnackBar(context, SnackBarState.Success, subtitle);
  }

  /// Convenience method to show a Warning SnackBar (Gold/Yellow).
  static void showWarning(BuildContext context, String subtitle) {
    _showCustomSnackBar(context, SnackBarState.Warning, subtitle);
  }

  /// Convenience method to show an Error SnackBar (Red).
  static void showError(BuildContext context, String subtitle) {
    _showCustomSnackBar(context, SnackBarState.Error, subtitle);
  }
}

// --- Example Usage Demonstration (Optional but helpful) ---
/*
  ElevatedButton(
              onPressed: () => SnackBarHelper.showWarning(
                  context, "Connection is interrupted. Retrying in 5 seconds."),
              child: const Text("Show Warning"),
            )
*/
