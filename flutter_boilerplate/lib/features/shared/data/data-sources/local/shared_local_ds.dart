import 'package:flutter_boilerplate/core/constants/preferences_constant.dart';
import 'package:flutter_boilerplate/features/shared/data/models/device_config.dart';
import 'package:flutter_boilerplate/features/shared/provider/global_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:io';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shared_local_ds.g.dart';

@riverpod
Future<ShareLocalDataSource> shareLocalDataSource(Ref ref) async {
  final pref = await ref.read(sharedPreferencesProvider.future);
  return SharedLocalDataSourceImpl(prefs: pref);
}

abstract class ShareLocalDataSource {
  Future<DeviceConfig> deviceConfig();
  String authToken();
}

class SharedLocalDataSourceImpl implements ShareLocalDataSource {
  final SharedPreferences prefs;
  SharedLocalDataSourceImpl({required this.prefs});

  @override
  Future<DeviceConfig> deviceConfig() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

    String deviceOs = '';
    String deviceModel = '';
    String osVersion = '';

    // 1. Get OS and Model Info
    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      deviceOs = 'Android';
      deviceModel = androidInfo.model;
      osVersion = androidInfo.version.release;
    } else if (Platform.isIOS) {
      final IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      deviceOs = 'iOS';
      deviceModel = iosInfo.utsname.machine;
      osVersion = iosInfo.systemVersion;
    } else {
      // Handle web/desktop cases if necessary
      deviceOs = Platform.operatingSystem;
      deviceModel = 'Unknown';
      osVersion = Platform.version;
    }

    // 2. Get App Version Code
    final String appVersion =
        '${packageInfo.version}+${packageInfo.buildNumber}';

    return DeviceConfig(
      deviceOs: deviceOs,
      deviceModel: deviceModel,
      osVersion: osVersion,
      appVersion: appVersion,
    );
  }

  @override
  String authToken() {
    final String? token = prefs.getString(PreferencesConstant.AUTH_TOKEN_KEY);
    return token ?? "";
  }
}
