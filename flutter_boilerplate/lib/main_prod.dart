import 'package:flutter_boilerplate/core/configs/flavors_config.dart';
import 'package:flutter_boilerplate/main_common.dart';
import 'package:flutter_boilerplate/core/constants/key_constant.dart';

void main() async {
  final flavorConfig = FlavorConfig()
    ..title = 'Boiler Plate'
    ..baseUrl = 'https://something.com'
    .. env = KeyConstant.envProdFile
    ..flavor = Flavor.production;

  mainCommon(flavorConfig);
}
