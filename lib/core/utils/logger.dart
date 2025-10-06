import "package:logger/logger.dart";

/// Application logger instance
final appLogger = Logger(printer: PrettyPrinter(dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart));

/// Simple logger wrapper for consistent logging
class AppLogger {
  static void debug(String message, [dynamic error, StackTrace? stackTrace]) {
    appLogger.d(message, error: error, stackTrace: stackTrace);
  }

  static void info(String message, [dynamic error, StackTrace? stackTrace]) {
    appLogger.i(message, error: error, stackTrace: stackTrace);
  }

  static void warning(String message, [dynamic error, StackTrace? stackTrace]) {
    appLogger.w(message, error: error, stackTrace: stackTrace);
  }

  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    appLogger.e(message, error: error, stackTrace: stackTrace);
  }
}
