import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/configs/routes/route_names.dart';
import 'package:flutter_boilerplate/core/extension/index.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.delayed(const Duration(seconds: 2)).then((_) {
        if (!context.mounted) {
          return;
        }
        context.goNamed(RouteNames.intro);
      });
      return null;
    }, []);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.gamepad, size: 80, color: context.primary),
            40.space,
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
