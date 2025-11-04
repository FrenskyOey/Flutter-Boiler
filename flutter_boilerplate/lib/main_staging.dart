import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter_boilerplate/core/configs/flavors_config.dart';
import 'package:flutter_boilerplate/main_common.dart';
import 'package:flutter_boilerplate/core/constants/key_constant.dart';

void main() async {
  ChuckerFlutter.showOnRelease = true;
  ChuckerFlutter.showNotification = true;

  final flavorConfig = FlavorConfig()
    ..title = 'Boiler Plate'
    ..baseUrl = 'https://digimon-api.vercel.app'
    ..env = KeyConstant.envStagingFile
    ..flavor = Flavor.staging;

  mainCommon(flavorConfig);
}
