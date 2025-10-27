import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/core/handlers/error/error_handler.dart';

class DioErrorHandler implements BaseErrorHandler {
  @override
  String handleError(error, [StackTrace? stackTrace]) {
    if (error is DioException) {
      return switch (error.type) {
        // A. Low-Level Network Failures
        DioExceptionType.connectionTimeout =>
          'Connection attempt timed out. Check your network.',
        DioExceptionType.sendTimeout => 'Sending request timed out.',
        DioExceptionType.receiveTimeout => 'Receiving response timed out.',
        DioExceptionType.connectionError =>
          (error.error is SocketException)
              ? 'No internet connection. Please check your network settings.'
              : 'Connection failed due to a network error.',

        // B. HTTP Status Code Errors
        DioExceptionType.badResponse => _handleBadResponse(error),

        // C. Cancellation / Security / Unknown
        DioExceptionType.cancel => 'The network request was cancelled.',
        DioExceptionType.badCertificate =>
          'Secure connection failed due to an invalid security certificate.',
        DioExceptionType.unknown =>
          (error.error is FormatException)
              ? 'Data format error: The server response is unreadable.'
              : 'An unknown error occurred during communication.',
      };
    }
    return 'An unexpected error occurred. Please try again.';
  }

  String _handleBadResponse(DioException error) {
    final statusCode = error.response?.statusCode;
    switch (statusCode) {
      case 400:
        return 'Bad Request: The data sent was invalid.';
      case 401:
        return 'Unauthorized: Please log in again.';
      case 403:
        return 'Forbidden: You do not have permission to access this resource.';
      case 404:
        return 'Resource Not Found: The requested item does not exist.';
      case 422:
        return 'Validation Failed: The request could not be processed.';
      case 500:
        return 'Internal Server Error: Our servers are currently experiencing issues.';
      case 503:
        return 'Service Unavailable: Please try again in a moment.';
      default:
        return 'Server error with status code: $statusCode.';
    }
  }
}
