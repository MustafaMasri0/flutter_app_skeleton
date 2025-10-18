import 'package:dio/dio.dart';

import '../constants/error_codes.dart';
import '../errors/exceptions.dart';

/// Handles DioException and maps them to appropriate AppException
class DioErrorHandler {
  /// Maps DioException to AppException
  static AppException handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return TimeoutException(
          message: 'Connection timeout. Please check your internet connection.',
          code: ErrorCodes.CONNECTION_TIMEOUT,
          details: error,
        );

      case DioExceptionType.sendTimeout:
        return TimeoutException(
          message: 'Send timeout. Please check your internet connection.',
          code: ErrorCodes.SEND_TIMEOUT,
          details: error,
        );

      case DioExceptionType.receiveTimeout:
        return TimeoutException(
          message: 'Receive timeout. Please check your internet connection.',
          code: ErrorCodes.RECEIVE_TIMEOUT,
          details: error,
        );

      case DioExceptionType.connectionError:
        return NetworkException(
          message: 'No internet connection. Please check your network.',
          code: ErrorCodes.NO_INTERNET,
          details: error,
        );

      case DioExceptionType.badResponse:
        return _handleBadResponse(error);

      case DioExceptionType.cancel:
        return NetworkException(
          message: 'Request was cancelled.',
          code: ErrorCodes.CANCELLED,
          details: error,
        );

      case DioExceptionType.unknown:
        return NetworkException(
          message: 'An unexpected network error occurred.',
          code: ErrorCodes.UNKNOWN,
          details: error,
        );

      case DioExceptionType.badCertificate:
        return NetworkException(
          message: 'SSL certificate error. Please check your connection.',
          code: ErrorCodes.BAD_CERTIFICATE,
          details: error,
        );
    }
  }

  /// Handles bad response errors (HTTP error status codes)
  static AppException _handleBadResponse(DioException error) {
    final statusCode = error.response?.statusCode;
    final message = _getErrorMessage(error);

    switch (statusCode) {
      case 400:
        return ValidationException(
          message: message,
          code: ErrorCodes.BAD_REQUEST,
          details: error.response?.data,
        );

      case 401:
        return UnauthorizedException(
          message: message,
          code: ErrorCodes.UNAUTHORIZED,
          details: error.response?.data,
        );

      case 403:
        return UnauthorizedException(
          message: message,
          code: ErrorCodes.FORBIDDEN,
          details: error.response?.data,
        );

      case 404:
        return NetworkException(
          message: message,
          code: ErrorCodes.NOT_FOUND,
          details: error.response?.data,
        );

      case 408:
        return TimeoutException(
          message: message,
          code: ErrorCodes.REQUEST_TIMEOUT,
          details: error.response?.data,
        );

      case 422:
        return ValidationException(
          message: message,
          code: ErrorCodes.UNPROCESSABLE_ENTITY,
          details: error.response?.data,
        );

      case 429:
        return NetworkException(
          message: 'Too many requests. Please try again later.',
          code: ErrorCodes.TOO_MANY_REQUESTS,
          details: error.response?.data,
        );

      case 500:
        return ServerException(
          message: message,
          code: ErrorCodes.INTERNAL_SERVER_ERROR,
          details: error.response?.data,
        );

      case 502:
        return ServerException(
          message: message,
          code: ErrorCodes.BAD_GATEWAY,
          details: error.response?.data,
        );

      case 503:
        return ServerException(
          message: message,
          code: ErrorCodes.SERVICE_UNAVAILABLE,
          details: error.response?.data,
        );

      case 504:
        return ServerException(
          message: message,
          code: ErrorCodes.GATEWAY_TIMEOUT,
          details: error.response?.data,
        );

      default:
        if (statusCode != null && statusCode >= 500) {
          return ServerException(
            message: message,
            code: statusCode.toString(),
            details: error.response?.data,
          );
        } else if (statusCode != null && statusCode >= 400) {
          return NetworkException(
            message: message,
            code: statusCode.toString(),
            details: error.response?.data,
          );
        } else {
          return NetworkException(
            message: 'An unexpected error occurred.',
            code: statusCode?.toString(),
            details: error.response?.data,
          );
        }
    }
  }

  /// Extracts error message from DioException response
  static String _getErrorMessage(DioException error) {
    try {
      final responseData = error.response?.data;

      if (responseData is Map<String, dynamic>) {
        // Try common error message fields
        return responseData['message'] ??
            responseData['error'] ??
            responseData['detail'] ??
            responseData['description'] ??
            'An error occurred';
      } else if (responseData is String) {
        return responseData;
      }
    } catch (e) {
      // If parsing fails, use default message
    }

    // Fallback to Dio's message or default
    return error.message ?? 'An unexpected error occurred';
  }

  /// Checks if the error is a network connectivity issue
  static bool isNetworkError(DioException error) {
    return error.type == DioExceptionType.connectionError ||
        error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout;
  }

  /// Checks if the error is a server error (5xx status codes)
  static bool isServerError(DioException error) {
    final statusCode = error.response?.statusCode;
    return statusCode != null && statusCode >= 500 && statusCode < 600;
  }

  /// Checks if the error is a client error (4xx status codes)
  static bool isClientError(DioException error) {
    final statusCode = error.response?.statusCode;
    return statusCode != null && statusCode >= 400 && statusCode < 500;
  }

  /// Checks if the error is an authentication error (401, 403)
  static bool isAuthError(DioException error) {
    final statusCode = error.response?.statusCode;
    return statusCode == 401 || statusCode == 403;
  }
}
