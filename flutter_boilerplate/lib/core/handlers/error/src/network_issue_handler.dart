import 'dart:async';
import 'dart:io';

import 'package:flutter_boilerplate/core/handlers/error/error_handler.dart';

class NetworkIssueHandler extends BaseErrorHandler {
  @override
  String handleError(error, [StackTrace? stackTrace]) {
    if (error is SocketException) {
      return 'No internet connection';
    } else if (error is TimeoutException) {
      return 'Request timed out';
    } else if (error is HandshakeException) {
      return 'Secure connection failed. The server certificate may be invalid.';
    } else if (error is TlsException) {
      return 'A secure communication error occurred.';
    } else if (error is HttpException) {
      return 'A generic communication error occurred with the server.';
    } else {
      return 'An error occurred';
    }
  }
}
