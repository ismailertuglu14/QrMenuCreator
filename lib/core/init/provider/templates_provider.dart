import 'package:flutter/material.dart';

import '../../../view/pages/category/model/get_category_response_model.dart';
import '../../../view/pages/dashboard/model/get_restaurant_menus_response_model.dart';
import '../../../view/pages/products/model/get_products_by_category_id_response_model.dart';
import '../../constans/enum/template_keys.dart';

class TemplatesProvider extends ChangeNotifier {
  static TemplatesProvider? _instance;

  static TemplatesProvider get instance {
    _instance ??= TemplatesProvider._();
    return _instance!;
  }

  TemplatesProvider._();
  TemplateKeys _selectedTemplateKey = TemplateKeys.FULVOUS;

  TemplateKeys get selectedTemplateKey => _selectedTemplateKey;
  bool _isBottomSheetOpen = false;
  String? _selectedMenuId;
  List<RestaurantMenuData>? _menus;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String? get selectedMenuId => _selectedMenuId;

  List<RestaurantMenuData>? get menus => _menus;
  List<GetCategoriesData> _categories = [];
  List<GetProductsByMenuIdData> _products = [];

  List<GetProductsByMenuIdData> get products => _products;

  List<GetCategoriesData> get categories => _categories;
  bool get isBottomSheetOpen => _isBottomSheetOpen;

  void changeLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  void changeProducts(List<GetProductsByMenuIdData> products) {
    _products = products;
    notifyListeners();
  }

  void changeCategories(List<GetCategoriesData> categories) {
    _categories = categories;
    notifyListeners();
  }

  void changeMenus(List<RestaurantMenuData>? menus) {
    _menus = menus;
    notifyListeners();
  }

  void changeMenuId(String? menuId) {
    _selectedMenuId = menuId;
    notifyListeners();
  }

  void changeTemplateKey(TemplateKeys templateKey) {
    _selectedTemplateKey = templateKey;
    notifyListeners();
  }

  void toggleBottomSheet() {
    _isBottomSheetOpen = !_isBottomSheetOpen;
    notifyListeners();
  }
}
