part of 'router.dart';

FutureOr<String?> handleRedirect(
  BuildContext context,
  GoRouterState state,
  Ref ref,
) async {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  final isSplashScreen = state.matchedLocation == RouteNames.splash;
  final isIntro = state.matchedLocation == RouteNames.intro;

  // by pass checking login on splash and into page
  if (isSplashScreen || isIntro) {
    return null;
  }

  /*final isAuthenticated = await _isAuthenticated(ref);
  if (!isAuthenticated) {
    return RouteNames.intro;
  }*/

  return null;
}

/*
Future<bool> _isAuthenticated(Ref ref) async {
  final sharedDataSources = await ref.read(shareLocalDataSourceProvider.future);
  final tokens = sharedDataSources.authToken();

  return tokens.isNotNullOrEmpty;
}*/
