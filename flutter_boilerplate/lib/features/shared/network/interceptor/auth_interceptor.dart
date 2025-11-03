import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/features/shared/data/data-sources/local/shared_local_ds.dart';
import 'package:flutter_boilerplate/features/shared/data/models/device_config.dart';

/// A Dio Interceptor that adds Auth token and Device/App info to request headers.
class AuthInterceptor extends Interceptor {
  final ShareLocalDataSource dataSource;
  AuthInterceptor({required this.dataSource});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // 1. Load token and device Config
    final String token = dataSource.authToken();
    final DeviceConfig deviceConfig = await dataSource.deviceConfig();

    if (token.isNotEmpty) {
      // Add Authorization header
      options.headers['Authorization'] = 'Bearer $token';
    }

    // 2. Add Device and App Information Headers
    // Note: It's common to prefix custom headers with 'X-' or 'App-'
    options.headers['X-Device-OS'] = deviceConfig.deviceOs;
    options.headers['X-Device-OS-Version'] = deviceConfig.osVersion;
    options.headers['X-Device-Model'] = deviceConfig.deviceModel;
    options.headers['X-App-Version'] = deviceConfig.appVersion;

    // Optional: Add a consolidated User-Agent header
    options.headers['User-Agent'] = deviceConfig.userAgent;
    // Continue the request chain
    handler.next(options);
  }

  // You can optionally implement onError and onResponse as needed.
  // For instance, onError could check for 401/403 errors and trigger a logout.

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // parsing error here latter if needed
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // manipulate response here if needed
    super.onResponse(response, handler);
  }
}
