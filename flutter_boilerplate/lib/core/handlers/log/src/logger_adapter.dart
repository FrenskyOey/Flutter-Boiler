import 'package:flutter_boilerplate/core/handlers/log/base_log.dart';
// ignore: depend_on_referenced_packages
import 'package:logger/logger.dart';
import 'package:stack_trace/stack_trace.dart';

class LoggerAdapter implements BaseLog {
  final Logger _logger;

  LoggerAdapter()
    : _logger = Logger(
        printer: PrettyPrinter(
          methodCount: 0,
          errorMethodCount: 8,
          lineLength: 120,
          colors: true,
          printEmojis: true,
          dateTimeFormat: DateTimeFormat.onlyTime,
        ),
      );

  // Helper to format the stack trace nicely using the stack_trace package
  StackTrace? _formatStackTrace(StackTrace? stackTrace) {
    if (stackTrace == null) return null;
    return Trace.from(stackTrace).terse.vmTrace;
  }

  @override
  void debug(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.d(message, error: error, stackTrace: _formatStackTrace(stackTrace));
  }

  @override
  void info(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.i(message, error: error, stackTrace: _formatStackTrace(stackTrace));
  }

  @override
  void warning(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.w(message, error: error, stackTrace: _formatStackTrace(stackTrace));
  }

  @override
  void error(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.e(message, error: error, stackTrace: _formatStackTrace(stackTrace));
  }
}
