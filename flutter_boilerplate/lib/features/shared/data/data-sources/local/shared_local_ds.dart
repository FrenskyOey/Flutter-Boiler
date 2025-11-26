import 'package:flutter_boilerplate/core/constants/preferences_constant.dart';
import 'package:flutter_boilerplate/features/shared/provider/global_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'shared_local_ds.g.dart';

@Riverpod(keepAlive: true)
ShareLocalDataSource shareLocalDataSource(Ref ref) {
  final pref = ref.read(sharedPreferencesClientProvider);
  return SharedLocalDataSourceImpl(prefs: pref);
}

abstract class ShareLocalDataSource {
  String authToken();
}

class SharedLocalDataSourceImpl implements ShareLocalDataSource {
  final SharedPreferences prefs;
  SharedLocalDataSourceImpl({required this.prefs});

  @override
  String authToken() {
    final String? token = prefs.getString(PreferencesConstant.authToken);
    return token ?? "";
  }
}
