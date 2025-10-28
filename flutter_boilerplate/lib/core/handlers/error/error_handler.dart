import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/core/handlers/log/log_helper.dart';

import 'index.dart';

abstract class BaseErrorHandler {
  String handleError(dynamic error, [StackTrace? stackTrace]);
}

class _ErrorFactory {
  static BaseErrorHandler getErrorHandler(dynamic error) {
    return switch (error) {
      // 1. Connectivity and Low-Level Network Errors
      SocketException() ||
      TimeoutException() ||
      HandshakeException() ||
      TlsException() ||
      HttpException() => NetworkIssueHandler(),

      // 2. Dio Expection Handler
      DioException() => DioErrorHandler(),

      // 3. Data Parsing and Format Errors
      FormatException() || TypeError() => ParserErrorHandler(),

      // 3. Catch-all for unexpected issues
      _ => GenericErrorHandler(),
    };
  }
}

String handleError(dynamic error, [StackTrace? stackTrace]) {
  final errorHandler = _ErrorFactory.getErrorHandler(error);
  final errorString = errorHandler.handleError(error, stackTrace);
  LogHelper.error(errorString, error: error, stackTrace: stackTrace);
  return errorString;
}
