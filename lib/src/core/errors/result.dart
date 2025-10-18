import 'package:flutter_app_skeleton/src/core/errors/exceptions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

typedef FutureResult<T> = Future<Result<T>>;

@freezed
class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success<T>;
  const factory Result.failure(AppException error) = Failure<T>;
}

extension ResultX<T> on Result<T> {
  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is Failure<T>;

  T? get dataOrNull => maybeWhen(success: (data) => data, orElse: () => null);
  AppException? get errorOrNull =>
      maybeWhen(failure: (error) => error, orElse: () => null);

  /// Map the success value to another type
  Result<R> mapSuccess<R>(R Function(T) transform) => when(
    success: (data) => Result.success(transform(data)),
    failure: (error) => Result.failure(error),
  );

  /// Map the failure message
  Result<T> mapFailure(AppException Function(AppException) transform) => when(
    success: (data) => Result.success(data),
    failure: (error) => Result.failure(transform(error)),
  );
}
