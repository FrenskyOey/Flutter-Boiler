import 'package:chucker_flutter/chucker_flutter.dart';

import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/core/configs/flavors_config.dart';
import 'package:flutter_boilerplate/core/handlers/log/log_helper.dart';
import 'package:flutter_boilerplate/features/shared/data/data-sources/local/shared_local_ds.dart';
import 'package:flutter_boilerplate/features/shared/data/models/entity/email.dart';
import 'package:flutter_boilerplate/features/shared/network/interceptor/auth_interceptor.dart';
import 'package:flutter_boilerplate/main_common.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'global_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Dio> dio(Ref ref) async {
  final flavorConfig = ref.read(flavorConfigProvider);
  final ShareLocalDataSource dataSource = await ref.watch(
    shareLocalDataSourceProvider.future,
  );

  final authInterceptor = AuthInterceptor(dataSource: dataSource);
  final chuckerInterceptor = ChuckerDioInterceptor();
  final logInterceptor = LogInterceptor(
    requestBody: true,
    responseBody: true,
    // Use the custom logger instance
    logPrint: (obj) {
      // Log all interceptor output at the 'info' level
      LogHelper.info(obj.toString());
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

      // *** ESSENTIAL CONFIGURATIONS ***
      // 1. Timeouts: Crucial for a good user experience on slow networks.
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

  dio.interceptors.add(authInterceptor);
  dio.interceptors.add(chuckerInterceptor);
  dio.interceptors.add(logInterceptor);
  return dio;
}

@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPreferences(Ref ref) async {
  final shared = await SharedPreferences.getInstance();
  return shared;
}

@Riverpod(keepAlive: true)
Future<Isar> isar(Ref ref) async {
  final directory = await getApplicationDocumentsDirectory();
  Isar isar = await Isar.open(
    [EmailSchema],
    inspector: true,
    directory: directory.path,
  );
  return isar;
}
