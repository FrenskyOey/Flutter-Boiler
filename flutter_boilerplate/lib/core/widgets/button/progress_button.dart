import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProgressButton extends HookWidget {
  final String text;
  final FutureOr<void> Function()? onPressed;
  final bool isLoading;
  final double? width;

  const ProgressButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(this.isLoading);
    return SizedBox(
      width: width ?? double.infinity,
      child: FilledButton(
        onPressed: isLoading.value
            ? null
            : () async {
                isLoading.value = true;
                if (onPressed != null) {
                  await onPressed!();
                }
                if (!context.mounted) {
                  return;
                }
                isLoading.value = false;
              },
        child: isLoading.value
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : Text(text),
      ),
    );
  }
}
