import 'dart:async';

import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/configs/routes/route_names.dart';
import 'package:flutter_boilerplate/features/apishowcase/presentation/screens/api_screen.dart';
import 'package:flutter_boilerplate/features/demo/presentation/screen/design_screen.dart';
import 'package:flutter_boilerplate/features/demo/presentation/screen/helper_screen.dart';
import 'package:flutter_boilerplate/features/demo/presentation/screen/intro_screen.dart';
import 'package:flutter_boilerplate/features/not_found_screen.dart';
import 'package:flutter_boilerplate/features/splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part 'redirection.dart';

final routeProvider = Provider((ref) {
  return GoRouter(
    observers: [ChuckerFlutter.navigatorObserver],
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
        name: RouteNames.design,
        path: "/design",
        builder: (context, state) => const DesignScreen(),
      ),
      GoRoute(
        name: RouteNames.helper,
        path: "/helper",
        builder: (context, state) => const HelperScreen(),
      ),
      GoRoute(
        name: RouteNames.apiDemo,
        path: "/api-demo",
        builder: (context, state) => const DemoApiScreen(),
      ),
    ],
  );
});
