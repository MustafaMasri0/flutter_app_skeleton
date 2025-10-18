import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_app_skeleton/src/core/configs/env_keys.dart';
import 'package:flutter_app_skeleton/src/core/errors/exceptions.dart';
import 'package:flutter_app_skeleton/src/core/network/dio_error_handler.dart';
import 'interceptors/auth_interceptor.dart';

final dioProvider = Provider<Dio>((ref) {
  final authInterceptor = ref.watch(authInterceptorProvider);
  final dio = Dio(BaseOptions(baseUrl: dotenv.get(EnvKeys.API_BASE_URL)));
  dio.interceptors.add(authInterceptor);
  return dio;
});

final dioClientProvider = Provider<DioClient>((ref) {
  final dio = ref.watch(dioProvider);
  return DioClient(dio: dio);
});

class DioClient {
  final Dio _dio;

  DioClient({required Dio dio}) : _dio = dio;

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    try {
      return await _dio.get(
        path,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: options,
      );
    } on DioException catch (e) {
      throw DioErrorHandler.handleError(e);
    } catch (e) {
      throw UnknownException(message: 'An unexpected error occurred: ${e.toString()}', details: e);
    }
  }

  Future<Response> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    try {
      return await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: options,
      );
    } on DioException catch (e) {
      throw DioErrorHandler.handleError(e);
    } catch (e) {
      throw UnknownException(message: 'An unexpected error occurred: ${e.toString()}', details: e);
    }
  }

  Future<Response> patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    try {
      return await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: options,
      );
    } on DioException catch (e) {
      throw DioErrorHandler.handleError(e);
    } catch (e) {
      throw UnknownException(message: 'An unexpected error occurred: ${e.toString()}', details: e);
    }
  }
}
