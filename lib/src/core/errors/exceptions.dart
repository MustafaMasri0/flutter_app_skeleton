abstract class AppException implements Exception {
  final String message;
  final String? code;
  final dynamic details;

  const AppException({required this.message, this.code, this.details});

  @override
  String toString() => 'AppException: $message';
}

class NetworkException extends AppException {
  const NetworkException({required super.message, super.code, super.details});
}

class ServerException extends AppException {
  const ServerException({required super.message, super.code, super.details});
}

class TimeoutException extends AppException {
  const TimeoutException({required super.message, super.code, super.details});
}

class UnauthorizedException extends AppException {
  const UnauthorizedException({
    required super.message,
    super.code,
    super.details,
  });
}

class CacheException extends AppException {
  const CacheException({required super.message, super.code, super.details});
}

class ValidationException extends AppException {
  const ValidationException({
    required super.message,
    super.code,
    super.details,
  });
}

class UnknownException extends AppException {
  UnknownException({required super.message, super.code, super.details});
}
