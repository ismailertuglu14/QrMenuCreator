import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../view/pages/dashboard/model/get_restaurant_menus_response_model.dart';
import '../../constans/enum/template_keys.dart';

class DashboardProvider extends ChangeNotifier {
  static DashboardProvider? _instance;

  static DashboardProvider get instance {
    _instance ??= DashboardProvider._();
    return _instance!;
  }

  DashboardProvider._();

  List<RestaurantMenuData>? _restaurantMenus;

  String? _selectedMenuId;
  int _selectedMenuIndex = 0;
  XFile? _menuImage;

  bool _isLoading = false;
 

  XFile? get menuImage => _menuImage;

 

  List<RestaurantMenuData>? _menus;
  String? get selectedMenuId => _selectedMenuId;
  late final TextEditingController _menuNameController;

  List<RestaurantMenuData>? get menus => _menus;

  int get selectedMenuIndex => _selectedMenuIndex;

  bool get isLoading => _isLoading;

  List<RestaurantMenuData>? get restaurantMenus => _restaurantMenus;

  set setMenuImage(XFile? menuImage) {
    _menuImage = menuImage;
    notifyListeners();
  }

  

  set setRestaurantMenus(List<RestaurantMenuData>? restaurantMenus) {
    _restaurantMenus = restaurantMenus;
    notifyListeners();
  }

  set setMenus(List<RestaurantMenuData>? menus) {
    _menus = menus;
    notifyListeners();
  }

  void changeLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  void setSelectedMenuId(String? menuId) {
    _selectedMenuId = menuId;
    notifyListeners();
  }

  set setSelectedMenuIndex(int index) {
    _selectedMenuIndex = index;

    notifyListeners();
  }

  void removeRestaurantMenu(String? menuId) {
    _restaurantMenus?.removeWhere((element) => element.id == menuId);
    notifyListeners();
  }

  void addRestaurantMenu(RestaurantMenuData restaurantMenu) {
    _restaurantMenus?.add(restaurantMenu);
    notifyListeners();
  }
}
