import 'package:flutter/material.dart';

import '../../../view/pages/dashboard/model/get_restaurant_menus_response_model.dart';

class DashboardProvider extends ChangeNotifier {
  static DashboardProvider? _instance;

  static DashboardProvider get instance {
    _instance ??= DashboardProvider._();
    return _instance!;
  }

  DashboardProvider._();

  List<RestaurantMenuData>? _restaurantMenus;

  String? _selectedMenuId;

  bool _isLoading = false;

  String? get selectedMenuId => _selectedMenuId;

  bool get isLoading => _isLoading;

  List<RestaurantMenuData>? get restaurantMenus => _restaurantMenus;

  void removeRestaurantMenu(String? menuId) {
    _restaurantMenus?.removeWhere((element) => element.id == menuId);
    notifyListeners();
  }

  void setSelectedMenuId(String? menuId) {
    _selectedMenuId = menuId;
    notifyListeners();
  }

  void addRestaurantMenu(RestaurantMenuData restaurantMenu) {
    _restaurantMenus?.add(restaurantMenu);
    notifyListeners();
  }

  void changeLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  set setRestaurantMenus(List<RestaurantMenuData>? restaurantMenus) {
    _restaurantMenus = restaurantMenus;
    notifyListeners();
  }
}
