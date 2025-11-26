import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/configs/flavors_config.dart';
import 'package:flutter_boilerplate/core/configs/routes/router.dart';
import 'package:flutter_boilerplate/core/themes/app_theme.dart';
import 'package:flutter_boilerplate/features/app_depedencies.dart';
import 'package:flutter_boilerplate/features/shared/data/models/device_config.dart';
import 'package:flutter_boilerplate/features/shared/provider/global_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:isar_community/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';

final flavorConfigProvider = Provider<FlavorConfig>((ref) {
  throw UnimplementedError();
});

Future<void> mainCommon(FlavorConfig config) async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: config.env);
  final SharedPreferences preference = await SharedPreferences.getInstance();
  final Isar isar = await initializeIsar();
  final DeviceConfig deviceConfigs = await deviceConfig();

  // how to load api key env
  // String apiKey = dotenv.get(KeyConstant.apiKey);
  runApp(
    ProviderScope(
      overrides: [
        flavorConfigProvider.overrideWith((ref) => config),
        sharedPreferencesClientProvider.overrideWith((ref) => preference),
        isarClientProvider.overrideWith((ref) => isar),
        devicConfigClientProvider.overrideWith((ref) => deviceConfigs),
      ],
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
