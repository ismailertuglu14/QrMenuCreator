// ignore_for_file: constant_identifier_names

class NetworkConstants {
  static NetworkConstants? _instance;

  static NetworkConstants get instance {
    _instance ??= NetworkConstants._();
    return _instance!;
  }

  NetworkConstants._();

  // Authentication Endpoints
  static const String AUTH_LOGIN = "/authentication/SignIn";
  static const String REFRESH_TOKEN = "/Authentication/RefreshToken";
  static const String SIGN_OUT_USER = "/authentication/signout";
  static const String CHANGE_PASSWORD = "/authentication/change-password";
  static const String RESET_PASSWORD = "/authentication/reset-password";

  static const String RESET_PASSWORD_CHECK_EMAIL =
      "/authentication/reset-password-request";
  static const String RESET_PASSWORD_CHECK_OTP_CODE =
      "/authentication/check-otp";



  static const String CHECK_UPDATE_VERSION = "/check-update-version";

}
