import 'package:flutter_boilerplate/core/handlers/log/base_log.dart';
import 'package:flutter_boilerplate/core/handlers/log/src/logger_adapter.dart';

class LogHelper {
  static final BaseLog _logger = LoggerAdapter();

  static void debug(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.debug(message, error: error, stackTrace: stackTrace);
  }

  static void info(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.info(message, error: error, stackTrace: stackTrace);
  }

  static void warn(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.warning(message, error: error, stackTrace: stackTrace);
  }

  static void error(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.error(message, error: error, stackTrace: stackTrace);
  }
}
