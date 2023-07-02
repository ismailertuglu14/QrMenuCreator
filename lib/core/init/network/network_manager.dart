// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:dio/dio.dart';

class NetworkManager {
  static NetworkManager? _instance;

  static NetworkManager get instance {
    _instance ??= NetworkManager._();
    return _instance!;
  }

  NetworkManager._();

  static const String BASE_IOS_URL = "http://localhost:3333/api";
  static const String BASE_ANDROID_URL = "http://10.0.2.2:3333/api/";

  static const int CONNECT_TIMEOUT = 5000;

  Dio dio = Dio(BaseOptions(
      baseUrl: Platform.isIOS ? BASE_IOS_URL : BASE_ANDROID_URL,
      receiveTimeout: const Duration(seconds: CONNECT_TIMEOUT)));
}
