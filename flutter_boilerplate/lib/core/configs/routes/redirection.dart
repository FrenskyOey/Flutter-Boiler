part of 'router.dart';

FutureOr<String?> handleRedirect(
  BuildContext context,
  GoRouterState state,
  Ref ref,
) {
  final isSplashScreen = state.matchedLocation == RouteNames.splash;
  final isIntro = state.matchedLocation == RouteNames.intro;

  // by pass checking login on splash and into page
  if (isSplashScreen || isIntro) {
    return null;
  }

  /*// this will check, if user is not authenticate anymore, will redirect to login page
    // check if the user is logged in or not
    final isAuthenticated = _isAuthenticated(ref);
    if (!isAuthenticated) {
      return RouteNames.login;
    }
  */
  return null;
}

/*
bool _isAuthenticated(Ref<Object?> ref) {
  final user = ref.read(authNotifierProvider).maybeWhen(
        success: (user) => user,
        orElse: () => null,
      );
  return user != null;
}
*/
