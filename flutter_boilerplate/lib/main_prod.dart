import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter_boilerplate/core/configs/flavors_config.dart';
import 'package:flutter_boilerplate/main_common.dart';
import 'package:flutter_boilerplate/core/constants/key_constant.dart';

void main() async {
  ChuckerFlutter.showOnRelease = false;
  ChuckerFlutter.showNotification = false;

  final flavorConfig = FlavorConfig()
    ..title = 'Boiler Plate'
    ..baseUrl = 'https://swapi.info'
    ..env = KeyConstant.envProdFile
    ..flavor = Flavor.production;

  mainCommon(flavorConfig);
}
