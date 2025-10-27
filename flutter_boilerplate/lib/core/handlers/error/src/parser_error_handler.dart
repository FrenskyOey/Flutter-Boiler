import 'package:flutter_boilerplate/core/handlers/error/error_handler.dart';

class ParserErrorHandler extends BaseErrorHandler {
  @override
  String handleError(error, [StackTrace? stackTrace]) {
    if (error is FormatException) {
      return 'The data received from the server is in an unexpected format.';
    } else if (error is TypeError) {
      return 'Data mismatch: the server response structure is incorrect.';
    } else {
      return 'A data processing error occurred.';
    }
  }
}
