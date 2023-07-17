// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:dio/dio.dart';

import '../../constans/cache/locale_keys_enum.dart';
import '../cache/local_storage.dart';

class NetworkManager {
  static NetworkManager? _instance;

  static NetworkManager get instance {
    _instance ??= NetworkManager._();
    return _instance!;
  }

  NetworkManager._();

  static const String BASE_IOS_URL = "http://localhost:3333/api";
  static const String BASE_ANDROID_URL = "http://10.0.2.2:3333/api/v1";

  static const int CONNECT_TIMEOUT = 20;

  Dio dio = Dio(BaseOptions(
      headers: {
        'Authorization':
            'Bearer ${LocaleStorage.instance.getStringValue(LocaleKeys.ACCESS_TOKEN)}'
      },
      baseUrl: Platform.isIOS ? BASE_IOS_URL : BASE_ANDROID_URL,
      sendTimeout: const Duration(seconds: CONNECT_TIMEOUT),
      connectTimeout: const Duration(seconds: CONNECT_TIMEOUT),
      receiveTimeout: const Duration(seconds: CONNECT_TIMEOUT)));
}
