import 'package:flutter_boilerplate/core/handlers/error/error_handler.dart';
import 'package:flutter_boilerplate/core/handlers/log/log_helper.dart';
import 'package:isar_community/isar.dart';

class IsarErrorHandler extends BaseErrorHandler {
  @override
  String handleError(error, [StackTrace? stackTrace]) {
    if (error is IsarError) {
      // IsarError often contains a descriptive message, you can choose to expose
      // it directly or map it to a user-friendly string.
      LogHelper.debug('Isar Database Error: ${error.toString()}');
      return 'Local data access failed. Please restart the application.';
    }

    return 'A database-related error occurred.';
  }
}
