import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final tokenStorageProvider = Provider<TokenStorageService>((ref) {
  return TokenStorageService();
});

class TokenStorageService {
  final _storage = FlutterSecureStorage();

  String? _cachedToken;

  static const _tokenKey = 'TOKEN';

  Future<void> saveToken(String token) {
    _cachedToken = token;
    return _storage.write(key: _tokenKey, value: token);
  }

  Future<String?> getToken() async {
    if (_cachedToken != null) {
      return _cachedToken;
    }
    return _storage.read(key: _tokenKey);
  }
}
