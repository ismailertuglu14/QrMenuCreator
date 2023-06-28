import '../constans/enum/route_keys.dart';

extension RouteExtension on RouterKeys {
  String get route {
    switch (this) {
      case RouterKeys.SPLASH:
        return "/splash";
      case RouterKeys.ONBOARD:
        return "/onboard";
      case RouterKeys.HOME:
        return "/home";
      case RouterKeys.ERROR:
        return "/error";
      case RouterKeys.LOGIN:
        return "/login";
      case RouterKeys.REGISTER:
        return "/register";
      case RouterKeys.RESET_PASSWORD:
        return "/reset_password";
      case RouterKeys.FEED_BACK:
        return "/feed_back";

      case RouterKeys.EDIT_PROFILE:
        return "/edit_profile";
    }
  }
}
