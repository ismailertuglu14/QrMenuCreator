// ignore_for_file: constant_identifier_names

class NetworkConstants {
  static NetworkConstants? _instance;

  static NetworkConstants get instance {
    _instance ??= NetworkConstants._();
    return _instance!;
  }

  NetworkConstants._();

  // Authentication Endpoints
  static const String LOGIN = "/v1/auth/signin";

  static const String REGISTER = "/v1/auth/signup";

  static const String CHECK_UPDATE_VERSION = "/check-update-version";
}
