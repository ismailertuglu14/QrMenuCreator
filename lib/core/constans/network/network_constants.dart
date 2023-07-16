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
  static const String CHANGE_PASSWORD = "/auth/change-password";
  static const String GET_BUSINESS = "/restaurant";
  static const String DELETE_BUSINESS = "/restaurant/delete";

// Restaurant Endpoints
  static const String CHANGE_COVER_IMAGE = "/restaurant/change-profile-image";
  static const String ADD_SOCIAL_MEDIA = "/restaurant/social-media";

//Map Endpoints
  static const String GET_LOCATION_NAME =
      "https://api.bigdatacloud.net/data/reverse-geocode-client?";
  static const String CHECK_UPDATE_VERSION = "check-update-version";

//Category Endpoints
  static const String CREATE_CATEGORY = "/category/create";
  static const String GET_RESTAURANT_CATEGORIES = "/category/customer/all";
  static const String CATEGORY_DELETE = "/category/delete";
  static const String CATEGORY_RELOCATE = "/category/relocate";

//Product Endpoints
  static const String CREATE_PRODUCT = "/product/create";
  static const String GET_RESTAURANT_PRODUCTS = "/product/customer/all";
  static const String PRODUCT_DELETE = "/product/delete";
  static const String GET_PRODUCT_BY_ID = "/product/";
  static const String UPDATE_PRODUCT = "/product/update/";

//Menu Enpoints
  static const String GET_RESTAURANT_MENUS = "/menu/all";
  static const String CREATE_MENU = "/menu/create";
  static const String MENU_DELETE = "/menu/delete";
}
