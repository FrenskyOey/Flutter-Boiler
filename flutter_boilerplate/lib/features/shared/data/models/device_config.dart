class DeviceConfig {
  final String deviceOs;
  final String deviceModel;
  final String osVersion;
  final String appVersion;

  DeviceConfig({
    required this.deviceOs,
    required this.deviceModel,
    required this.osVersion,
    required this.appVersion,
  });

  /// Example of how to structure a complete User-Agent header if needed
  /// For this interceptor, we will use separate headers as requested.
  String get userAgent =>
      '$deviceOs/$osVersion ($deviceModel); App/$appVersion';
}
