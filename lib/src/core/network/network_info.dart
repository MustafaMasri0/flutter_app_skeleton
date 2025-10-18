import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

final connectivityProvider = Provider<Connectivity>((ref) => Connectivity());

/// Network info provider
final networkInfoProvider = Provider<NetworkInfo>((ref) {
  return NetworkInfo(ref.watch(connectivityProvider));
});

class NetworkInfo {
  final Connectivity _connectivity;
  NetworkInfo(this._connectivity);

  /// Check if device is connected to internet
  Future<bool> get isConnected async {
    final connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile);
  }

  /// Get current connectivity status
  Future<ConnectivityResult> get connectivityStatus async {
    return (await _connectivity.checkConnectivity()).first;
  }

  /// Stream of connectivity changes
  Stream<List<ConnectivityResult>> get connectivityStream {
    return _connectivity.onConnectivityChanged;
  }
}
