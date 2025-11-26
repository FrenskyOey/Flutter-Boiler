import 'dart:io';
import 'package:flutter_boilerplate/features/shared/data/models/device_config.dart';
import 'package:flutter_boilerplate/features/shared/data/models/entity/email.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';

Future<Isar> initializeIsar() async {
  final directory = await getApplicationDocumentsDirectory();
  Isar isar = await Isar.open(
    [EmailSchema],
    inspector: true,
    directory: directory.path,
  );
  return isar;
}

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
  final String appVersion = '${packageInfo.version}+${packageInfo.buildNumber}';

  return DeviceConfig(
    deviceOs: deviceOs,
    deviceModel: deviceModel,
    osVersion: osVersion,
    appVersion: appVersion,
  );
}
