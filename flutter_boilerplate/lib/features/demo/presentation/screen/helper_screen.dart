import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/helpers/dialog_helper.dart';
import 'package:flutter_boilerplate/core/helpers/snackbar_helper.dart';
import 'package:flutter_boilerplate/features/demo/presentation/components/showcase_widget.dart';
import 'package:flutter_boilerplate/features/demo/presentation/models/showcase_item.dart';

class HelperScreen extends StatelessWidget {
  const HelperScreen({super.key});

  List<ShowcaseItem> get helperCaseItem => [
    ShowcaseItem(
      icon: Icons.brightness_auto,
      title: 'Snackbar Default',
      subtitle: 'Show default snackbar',
    ),
    ShowcaseItem(
      icon: Icons.check_circle,
      title: 'Snackbar Success',
      subtitle: 'Show snackbar with success state',
    ),
    ShowcaseItem(
      icon: Icons.warning,
      title: 'Snackbar Warning',
      subtitle: 'Show snackbar with warning state',
    ),
    ShowcaseItem(
      icon: Icons.cancel,
      title: 'Snackbar Error',
      subtitle: 'Show snackbar with error state',
    ),
    ShowcaseItem(
      icon: Icons.aspect_ratio,
      title: 'Approval Dialog',
      subtitle: 'Show sample approval dialog',
    ),
    ShowcaseItem(
      icon: Icons.crop,
      title: 'Standard Dialog',
      subtitle: 'Show sample standard dialog',
    ),
  ];

  void _onPressed(int index, BuildContext context) {
    switch (index) {
      case 0:
        {
          SnackBarHelper.showSnackBar(
            context,
            "Default",
            "Showing Default Snackbar",
          );
        }
      case 1:
        {
          SnackBarHelper.showSuccess(context, "Showing Success Snackbar");
        }
      case 2:
        {
          SnackBarHelper.showWarning(context, "Showing Warning Snackbar");
        }
      case 3:
        {
          SnackBarHelper.showError(context, "Showing Error Snackbar");
        }
      case 4:
        {
          DialogHelper.showConfirmation(
            context: context,
            title: "Confirmation",
            content: "Are you sure to delete this record?",
            onButtonPress: (buttonState) {
              switch (buttonState) {
                case DialogButtonType.primary:
                  {
                    SnackBarHelper.showWarning(context, "User click deletion");
                  }

                case DialogButtonType.secondary:
                  {
                    SnackBarHelper.showWarning(context, "User cancel deletion");
                  }
              }
            },
          );
        }
      case 5:
        {
          DialogHelper.show(
            context: context,
            title: "Standard Dialog",
            content: "Standard Dialog shown",
            hideCloseBtn: true,
            onButtonPress: (buttonState) {
              switch (buttonState) {
                case DialogButtonType.primary:
                  {
                    SnackBarHelper.showSuccess(context, "User click Confirm");
                  }

                case _:
                  {}
              }
            },
          );
        }
      case _:
        {
          SnackBarHelper.showError(context, "Feature is Not Found");
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Helper Showcase')),
      body: ListView.builder(
        // Add a small padding at the top to separate from the AppBar
        padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
        itemCount: helperCaseItem.length,
        itemBuilder: (context, index) {
          return ShowcaseWidget(
            item: helperCaseItem[index],
            onPressed: () {
              _onPressed(index, context);
            },
          );
        },
      ),
    );
  }
}
