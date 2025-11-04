import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/extension/index.dart';
import 'package:flutter_boilerplate/core/themes/dimens_constant.dart';

/// Defines the possible states (types) for the custom SnackBar.
enum SnackBarState { Default, Success, Warning, Error }

class SnackBarHelper {
  static ({String title, Color color}) _getStateDetails(SnackBarState state) {
    switch (state) {
      case SnackBarState.Default:
        return (title: "", color: Colors.black);
      case SnackBarState.Success:
        return (title: "Success", color: Colors.green.shade700);
      case SnackBarState.Warning:
        return (title: "Warning", color: Colors.amber.shade700);
      case SnackBarState.Error:
        return (title: "Error", color: Colors.red.shade700);
    }
  }

  static Widget _snackbarContent(
    BuildContext context,
    SnackBarState state,
    String? title,
    String subtitle,
    VoidCallback? onPressed,
  ) {
    final details = _getStateDetails(state);
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: Dimens.ms,
        horizontal: Dimens.sm,
      ),
      decoration: BoxDecoration(
        color: details.color,
        borderRadius: BorderRadius.circular(
          Dimens.borderRadius,
        ), // Rounded corners for aesthetics
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
                  title ?? details.title,
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
            onPressed: onPressed,
            tooltip: 'Dismiss',
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }

  static void hideSnakcBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  /// The core method responsible for displaying the custom SnackBar UI.
  static void _showCustomSnackBar(
    BuildContext context,
    SnackBarState state,
    String subtitle, [
    String? title,
  ]) {
    final messenger = ScaffoldMessenger.of(context);

    messenger.hideCurrentSnackBar();

    final snackbarContents = _snackbarContent(
      context,
      state,
      title,
      subtitle,
      () {
        messenger.hideCurrentSnackBar();
      },
    );

    final customSnackBar = SnackBar(
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      margin: const EdgeInsets.all(Dimens.xs),
      dismissDirection: DismissDirection.down,
      backgroundColor:
          Colors.transparent, // Set to transparent to use custom content color
      //content: AnimatedSnackBarContent(child: snackbarContents),
      content: snackbarContents,
    );

    messenger.showSnackBar(customSnackBar);
  }

  // --- Public Helper Methods ---

  /// Generic method to show a SnackBar with a specified state.
  static void showSnackBar(
    BuildContext context,
    String title,
    String subtitle,
  ) {
    _showCustomSnackBar(context, SnackBarState.Default, subtitle, title);
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
