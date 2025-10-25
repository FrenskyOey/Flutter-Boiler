import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/configs/flavors_config.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Boiler Plate',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Center(child: const Text('This is Demo Page')),
    );
  }
}
