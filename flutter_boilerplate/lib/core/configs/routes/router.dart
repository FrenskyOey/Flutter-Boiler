import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/configs/routes/route_names.dart';
import 'package:flutter_boilerplate/features/not_found_screen.dart';
import 'package:flutter_boilerplate/features/onboarding/presentation/screens/demo_screen.dart';
import 'package:flutter_boilerplate/features/onboarding/presentation/screens/intro/intro_screen.dart';
import 'package:flutter_boilerplate/features/splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part 'redirection.dart';

final routeProvider = Provider((ref) {
  return GoRouter(
    initialLocation: "/splash-screen",
    errorBuilder: (context, state) {
      return NotFoundScreen();
    },
    redirect: (context, state) {
      final redirect = handleRedirect(context, state, ref);
      return redirect;
    },
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: RouteNames.splash,
        path: "/splash-screen",
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        name: RouteNames.intro,
        path: "/intro",
        builder: (context, state) => const IntroScreen(),
      ),
      GoRoute(
        name: RouteNames.demo,
        path: "/demo",
        builder: (context, state) => const DemoScreen(),
      ),
    ],
  );
});
