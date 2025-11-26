import 'package:chucker_flutter/chucker_flutter.dart';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/core/configs/flavors_config.dart';
import 'package:flutter_boilerplate/features/shared/data/data-sources/local/shared_local_ds.dart';
import 'package:flutter_boilerplate/features/shared/data/models/device_config.dart';
import 'package:flutter_boilerplate/features/shared/network/interceptor/auth_interceptor.dart';
import 'package:flutter_boilerplate/main_common.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:isar_community/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'global_provider.g.dart';

@Riverpod(keepAlive: true)
Dio dioClient(Ref ref) {
  final flavorConfig = ref.read(flavorConfigProvider);

  final chuckerInterceptor = ChuckerDioInterceptor();
  final logInterceptor = LogInterceptor(
    requestBody: true,
    responseBody: true,
    logPrint: (obj) {
      log(obj.toString());
    },
  );

  final flavors = flavorConfig.flavor ?? Flavor.staging;
  final Duration kConnectTimeout = flavors == Flavor.production
      ? Duration(seconds: 15)
      : Duration(seconds: 8);
  final Duration kReceiveTimeout = flavors == Flavor.production
      ? Duration(seconds: 25)
      : Duration(seconds: 15);

  final dio = Dio(
    BaseOptions(
      baseUrl: flavorConfig.baseUrl,
      connectTimeout: kConnectTimeout,
      receiveTimeout: kReceiveTimeout,
      sendTimeout: kConnectTimeout,

      headers: {'Content-Type': 'application/json'},

      validateStatus: (status) {
        return status != null && status >= 200 && status < 300;
      },

      responseType: ResponseType.json,
    ),
  );

  dio.interceptors.add(chuckerInterceptor);

  final config = ref.read(devicConfigClientProvider);
  final dataLocalSource = ref.read(shareLocalDataSourceProvider);
  final authInterceptor = AuthInterceptor(
    dataSource: dataLocalSource,
    deviceConfig: config,
  );
  dio.interceptors.add(authInterceptor);
  dio.interceptors.add(logInterceptor);
  return dio;
}

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferencesClient(Ref ref) {
  throw UnimplementedError;
}

@Riverpod(keepAlive: true)
Isar isarClient(Ref ref) {
  throw UnimplementedError;
}

@Riverpod(keepAlive: true)
DeviceConfig devicConfigClient(Ref ref) {
  throw UnimplementedError();
}
