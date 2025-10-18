import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_app_skeleton/src/core/services/token_storage_service.dart';

final authInterceptorProvider = Provider<AuthInterceptor>((ref) {
  final tokenStorage = ref.watch(tokenStorageProvider);
  return AuthInterceptor(tokenStorageService: tokenStorage);
});

class AuthInterceptor extends Interceptor {
  final TokenStorageService _tokenStorage;

  AuthInterceptor({required TokenStorageService tokenStorageService})
    : _tokenStorage = tokenStorageService;
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final authKey = 'Authorization';
    // ? Attach token to every outgoing request if available
    final token = await _tokenStorage.getToken();
    if (token != null && token.isNotEmpty && options.headers[authKey] == null) {
      options.headers[authKey] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }
}
