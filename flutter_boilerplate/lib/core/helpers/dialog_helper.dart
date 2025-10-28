import 'package:flutter/material.dart';

/// Defines the type of action button pressed in the custom dialog.
enum DialogButtonType { 
  /// Represents the main, primary action (e.g., 'Ok', 'Open', 'Confirm').
  primary, 
  
  /// Represents the secondary, dismissive action (e.g., 'Cancel', 'Close').
  secondary 
}

/// A utility class to show a custom, aesthetically pleasing dialog based on the provided design.
class DialogHelper {
  /// Shows the custom dialog with the specified title, content, and action buttons.
  /// 
  /// Returns a Future that resolves to the [DialogButtonType] pressed by the user, 
  /// or null if the dialog was dismissed via the top-right 'X' icon or outside tap.
  static Future<DialogButtonType?> show({
    required BuildContext context,
    required String title,
    required String content,
    required String primaryButtonText,
    required String secondaryButtonText,
    // The callback accepts the type of button pressed
    required ValueChanged<DialogButtonType> onButtonPress,
  }) async {
    return await showDialog<DialogButtonType>(
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
  final String secondaryButtonText;
  final ValueChanged<DialogButtonType> onButtonPress;

  const _CustomDialog({
    required this.title,
    required this.content,
    required this.primaryButtonText,
    required this.secondaryButtonText,
    required this.onButtonPress,
  });

  // Defining the brand color based on the image (deep red/maroon)
  static const Color _primaryColor = Color(0xFFC62828); // Deep Red

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // Dialog shape and background
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.zero,
      
      // The main content structure
      content: IntrinsicHeight(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8, // Make it responsive
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10), // Internal padding
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Close Button (Top Right) & Title Container ---
              Stack(
                children: [
                  // Title and Separator Line
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF333333),
                            fontSize: 22,
                          ),
                        ),
                        // Separator line (matches image style)
                        Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 15),
                          height: 1.0,
                          width: double.infinity,
                          color: Colors.grey.shade300,
                        ),
                      ],
                    ),
                  ),

                  // Close Icon Button (Positioned in top right)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Material(
                      color: const Color(0xFFFFEBEE), // Light pink background for the 'X'
                      borderRadius: BorderRadius.circular(20),
                      child: InkWell(
                        onTap: () {
                          // Dismiss the dialog without returning a type (returns null)
                          Navigator.of(context).pop();
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.close,
                            color: _primaryColor, // Deep red icon
                            size: 20,
                          ),
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
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
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
                  // Secondary Button (Left/CANCEL): Outlined style
                  OutlinedButton(
                    onPressed: () {
                      onButtonPress(DialogButtonType.secondary);
                      Navigator.of(context).pop(DialogButtonType.secondary);
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: _primaryColor,
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Color(0xFFF44336), width: 1), // Red border
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                    child: Text(
                      secondaryButtonText.toUpperCase(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),

                  // Primary Button (Right/OK): Filled style
                  ElevatedButton(
                    onPressed: () {
                      onButtonPress(DialogButtonType.primary);
                      Navigator.of(context).pop(DialogButtonType.primary);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: _primaryColor,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      elevation: 4,
                    ),
                    child: Text(
                      primaryButtonText.toUpperCase(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
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

import 'package:flutter/material.dart';
import 'lib/utils/dialog_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dialog Helper Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _showDemoDialog(BuildContext context) {
    // Calling the helper exactly as requested:
    DialogHelper.show(
      context: context,
      title: "Confirm Data Deletion",
      content:
          "Are you sure you want to proceed with deleting this data? This operation cannot be undone and will permanently remove the selected records.",
      primaryButtonText: "DELETE",
      secondaryButtonText: "Cancel",
      onButtonPress: (type) {
        // The callback logic
        final message = type == DialogButtonType.primary 
            ? "Data deletion initiated!" 
            : "Deletion cancelled.";
        
        // Use ScaffoldMessenger for feedback (like your SnackBarHelper)
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dialog Helper Demo')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showDemoDialog(context),
          child: const Text("Show Custom Dialog"),
        ),
      ),
    );
  }
}
*/