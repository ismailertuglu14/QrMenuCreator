import 'package:dio/dio.dart';

extension DioTryExceptionExtension on Function {
  Future tryFunctionWithSafety<T>([T? defaultValue]) async {
    try {
      return await this();
    } on DioException {
      return defaultValue;
    }
  }
}

extension TryExceptionExtension on Function {
  Future tryFunctionWithSafety<T>([T? defaultValue]) async {
    try {
      return await this();
    } on Exception {
      return defaultValue;
    }
  }
}
