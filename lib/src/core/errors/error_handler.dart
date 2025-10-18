import 'package:flutter_app_skeleton/src/core/constants/error_codes.dart';
import 'package:flutter_app_skeleton/src/core/errors/result.dart';
import 'package:flutter_app_skeleton/src/core/utils/logger.dart';

import 'exceptions.dart';

class ErrorHandler {
  /// Executes an asynchronous operation with standardized error handling.
  ///
  /// - Wraps the result in a [Success] if the operation completes successfully.
  /// - Catches [AppException] and returns a [Failure] containing the exception.
  ///   Also logs the error using [Logger.error].
  /// - Catches any other unknown exceptions, logs them, and wraps them into
  ///   an [UnknownException] returned as a [Failure].
  ///
  /// This method is ideal for safely calling async operations without throwing
  /// exceptions to the caller, ensuring consistent error handling across the app.
  ///
  /// Example usage:
  /// ```dart
  /// final result = await ErrorHandler.runAsyncGuarded(() async {
  ///   return await api.getUser(id);
  /// });
  /// ```
  static FutureResult<T> runAsyncGuarded<T>(
    Future<T> Function() operation,
  ) async {
    try {
      final result = await operation();
      return Success<T>(result);
    } on AppException catch (e, stackTrace) {
      Logger.error(e.message, tag: e.code, stackTrace: stackTrace, error: e);
      return Failure<T>(e);
    } catch (e, stackTrace) {
      Logger.error('Unknown exception', error: e, stackTrace: stackTrace);
      return Failure<T>(
        UnknownException(
          message: e.toString(),
          code: ErrorCodes.UNKNOWN,
          details: e,
        ),
      );
    }
  }

  /// Executes a synchronous operation with standardized error handling.
  ///
  /// - Wraps the result in a [Success] if the operation completes successfully.
  /// - Catches [AppException] and returns a [Failure] containing the exception.
  ///   Also logs the error using [Logger.error].
  /// - Catches any other unknown exceptions, logs them, and wraps them into
  ///   an [UnknownException] returned as a [Failure].
  ///
  /// This method is useful for safely executing synchronous operations without
  /// throwing exceptions to the caller.
  ///
  /// Example usage:
  /// ```dart
  /// final result = ErrorHandler.runSyncGuarded(() {
  ///   return database.getUser(id);
  /// });
  /// ```
  static Result<T> runSyncGuarded<T>(T Function() operation) {
    try {
      final result = operation();
      return Success<T>(result);
    } on AppException catch (e, stackTrace) {
      Logger.error(e.message, tag: e.code, stackTrace: stackTrace, error: e);
      return Failure<T>(e);
    } catch (e, stackTrace) {
      Logger.error('Unknown exception', error: e, stackTrace: stackTrace);
      return Failure<T>(
        UnknownException(
          message: e.toString(),
          code: ErrorCodes.UNKNOWN,
          details: e,
        ),
      );
    }
  }
}
