import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/extension/index.dart';
import 'package:flutter_boilerplate/core/themes/app_color.dart';
import 'package:flutter_boilerplate/core/themes/dimens_constant.dart';

enum DialogButtonType { primary, secondary }

/// A utility class to show a custom, aesthetically pleasing dialog based on the provided design.
class DialogHelper {
  static show({
    required BuildContext context,
    required String title,
    required String content,
    String primaryButtonText = "Confirm",
    String? secondaryButtonText = "Cancel",
    required ValueChanged<DialogButtonType> onButtonPress,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true, // Allows dialog to close on outside tap
      builder: (context) {
        return _CustomDialog(
          title: title,
          content: content,
          primaryButtonText: primaryButtonText,
          secondaryButtonText: secondaryButtonText,
          onButtonPress: onButtonPress,
        );
      },
    );
  }
}

// Internal widget to build the custom UI structure.
class _CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  final String primaryButtonText;
  final String? secondaryButtonText;
  final ValueChanged<DialogButtonType> onButtonPress;

  const _CustomDialog({
    required this.title,
    required this.content,
    required this.primaryButtonText,
    required this.secondaryButtonText,
    required this.onButtonPress,
  });

  // Defining the brand color based on the image (deep red/maroon)
  static const Color _primaryColor = AppColor.secondary;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // Dialog shape and background
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.md),
      ),
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.zero,

      // The main content structure
      content: IntrinsicHeight(
        child: Container(
          width: context.screenWidth * 0.8, // Make it responsive
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const EdgeInsets.fromLTRB(
            Dimens.lg,
            Dimens.lg,
            Dimens.lg,
            Dimens.sm,
          ), // Internal padding
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Close Button (Top Right) & Title Container ---
              Stack(
                children: [
                  // Title and Separator Line
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: context.headlineSmall),
                      // Separator line (matches image style)
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 15),
                        height: 1.0,
                        width: double.infinity,
                        color: AppColor.tertiary,
                      ),
                    ],
                  ).paddingVertical(Dimens.sm),
                  // Close Icon Button (Positioned in top right)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      borderRadius: BorderRadius.circular(Dimens.lg),
                      child: const Padding(
                        padding: EdgeInsets.all(Dimens.xs),
                        child: Icon(
                          Icons.close,
                          color: _primaryColor,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // --- Content ---
              Flexible(
                child: Text(
                  content,
                  style: context.bodyLarge?.copyWith(
                    color: Colors.grey.shade700,
                    height: 1.5,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // --- Action Buttons ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (secondaryButtonText != null)
                    // Secondary Button (Left/CANCEL): Outlined style
                    OutlinedButton(
                      onPressed: () {
                        onButtonPress(DialogButtonType.secondary);
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        secondaryButtonText!.toUpperCase(),
                        style: context.titleMedium,
                      ),
                    ),
                  // Primary Button (Right/OK): Filled style
                  ElevatedButton(
                    onPressed: () {
                      onButtonPress(DialogButtonType.primary);
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      primaryButtonText.toUpperCase(),
                      style: context.titleMedium,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
// Example Usage:
void _showDemoDialog(BuildContext context) {
    // Calling the helper exactly as requested:
    DialogHelper.show(
      context: context,
      title: "Confirm Data Deletion",
      content:
          "Are you sure you want to proceed with deleting this data? This operation cannot be undone and will permanently remove the selected records.",
      primaryButtonText: "Delete",
      secondaryButtonText: "Cancel",
      onButtonPress: (type) {
        // The callback logic
        if(type == DialogButtonType.primary){
            SnackBarHelper.showSuccess(context, "Data deletion initiated!");
        }else{
            SnackBarHelper.showError(context, "Deletion canceled");
        }
      },
    );
}

  ElevatedButton(
          onPressed: () => _showDemoDialog(context),
          child: const Text("Show Custom Dialog"),
        )
*/
