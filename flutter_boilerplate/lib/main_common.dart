import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/configs/flavors_config.dart';
import 'package:flutter_boilerplate/core/configs/routes/router.dart';
import 'package:flutter_boilerplate/core/themes/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final flavorConfigProvider = Provider<FlavorConfig>((ref) {
  throw UnimplementedError();
});

void mainCommon(FlavorConfig config) async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: config.env);
  // how to load api key env
  // String apiKey = dotenv.get(KeyConstant.apiKey);

  runApp(
    ProviderScope(
      overrides: [flavorConfigProvider.overrideWith((ref) => config)],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routeProvider);
    return MaterialApp.router(
      title: 'App Showcase',
      darkTheme: AppTheme.dark,
      theme: AppTheme.light,

      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}
