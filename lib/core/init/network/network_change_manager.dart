import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

typedef NetworkCallBack = void Function(NetworkResult result);

abstract class INetworkChangeManager {
  Future<NetworkResult> checkNetworkFirstTime();
  void handleNetworkChange(NetworkCallBack onChange);
  void dispose();
}

class NetworkChangeManager extends INetworkChangeManager {
  NetworkChangeManager() {
    _connectivity = Connectivity();
  }
  late final Connectivity _connectivity;
  StreamSubscription<ConnectivityResult>? _subscription;

  @override
  Future<NetworkResult> checkNetworkFirstTime() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    return NetworkResult.checkConnectivityResult(connectivityResult);
  }

  @override
  void handleNetworkChange(NetworkCallBack onChange) =>
      _subscription = _connectivity.onConnectivityChanged.listen((event) =>
          onChange.call(NetworkResult.checkConnectivityResult(event)));

  @override
  void dispose() {
    _subscription?.cancel();
  }
}

enum NetworkResult {
  on,
  off;

  static NetworkResult checkConnectivityResult(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      return NetworkResult.off;
    } else if (result != ConnectivityResult.none &&
        result == ConnectivityResult.vpn) {
      return NetworkResult.off;
    } else {
      return NetworkResult.on;
    }
  }
}
