// ignore_for_file: constant_identifier_names

class NetworkConstants {
  static NetworkConstants? _instance;

  static NetworkConstants get instance {
    _instance ??= NetworkConstants._();
    return _instance!;
  }

  NetworkConstants._();

  // Authentication Endpoints
  static const String LOGIN = "/auth/signin";

  static const String REGISTER = "/auth/signup";

  // Restaurant Endpoints

  static const String CHANGE_COVER_IMAGE =
      "/v1/restaurant/change-profile-image";

//Map Endpoints

  static const String GET_LOCATION_NAME =
      "https://api.bigdatacloud.net/data/reverse-geocode-client?";

  static const String CHECK_UPDATE_VERSION = "check-update-version";

//Category Endpoints

  static const String CREATE_CATEGORY = "/category/create";
//Product Endpoints

  static const String CREATE_PRODUCT = "/product/create";

//Menu Enpoints
  static const String GET_RESTAURANT_MENUS = "/menu/all";
  static const String CREATE_MENU = "/menu/create";
}
