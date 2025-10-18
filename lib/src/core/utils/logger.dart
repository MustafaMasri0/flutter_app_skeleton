import 'dart:developer' as developer;

/// Log levels for categorizing log messages.
enum LogLevel { debug, info, warning, error }

/// A utility class for logging messages with different log levels.
///
/// This logger uses the `dart:developer` package to log messages with timestamps,
/// log levels, and optional error details.
class Logger {
  static const String _name = 'PropExcel';

  /// Logs a debug message.
  static void debug(
    String message, {
    String? tag,
    dynamic error,
    StackTrace? stackTrace,
  }) {
    _log(
      LogLevel.debug,
      message,
      tag: tag,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Logs an informational message.
  static void info(
    String message, {
    String? tag,
    dynamic error,
    StackTrace? stackTrace,
  }) {
    _log(
      LogLevel.info,
      message,
      tag: tag,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Logs a warning message.
  static void warning(
    String message, {
    String? tag,
    dynamic error,
    StackTrace? stackTrace,
  }) {
    _log(
      LogLevel.warning,
      message,
      tag: tag,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Logs an error message.
  static void error(
    String message, {
    String? tag,
    dynamic error,
    StackTrace? stackTrace,
  }) {
    _log(
      LogLevel.error,
      message,
      tag: tag,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Internal method to log messages with the specified log level.
  static void _log(
    LogLevel level,
    String message, {
    String? tag,
    dynamic error,
    StackTrace? stackTrace,
  }) {
    final tagName = tag != null ? '$_name.$tag' : _name;
    final levelName = level.name.toUpperCase();
    final timestamp = DateTime.now().toIso8601String();
    final logMessage = '[$timestamp] [$levelName] $message';

    switch (level) {
      case LogLevel.debug:
        developer.log(
          logMessage,
          name: tagName,
          level: 500,
          error: error,
          stackTrace: stackTrace,
        );
        break;
      case LogLevel.info:
        developer.log(
          logMessage,
          name: tagName,
          level: 800,
          error: error,
          stackTrace: stackTrace,
        );
        break;
      case LogLevel.warning:
        developer.log(
          logMessage,
          name: tagName,
          level: 900,
          error: error,
          stackTrace: stackTrace,
        );
        break;
      case LogLevel.error:
        developer.log(
          logMessage,
          name: tagName,
          level: 1000,
          error: error,
          stackTrace: stackTrace,
        );
        break;
    }
  }
}
