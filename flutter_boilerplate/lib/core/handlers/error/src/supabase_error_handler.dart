import 'package:flutter_boilerplate/core/handlers/error/error_handler.dart';

class SupabaseErrorHandler implements BaseErrorHandler {
  @override
  String handleError(error, [StackTrace? stackTrace]) {
    // will handling later, after adding supabase library {not all project will need supabase library}
    return 'An unexpected error occurred. Please try again.';
  }
}
