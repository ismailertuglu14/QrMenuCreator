import 'package:flutter/material.dart';

import '../../../view/pages/category/model/get_category_response_model.dart';
import '../../../view/pages/dashboard/model/get_restaurant_menus_response_model.dart';
import '../../../view/pages/products/model/get_products_by_category_id_response_model.dart';
import '../../../view/pages/templates/model/base_template_model.dart';
import '../../constans/enum/template_keys.dart';

class TemplatesProvider extends ChangeNotifier {
  static TemplatesProvider? _instance;

  static TemplatesProvider get instance {
    _instance ??= TemplatesProvider._();
    return _instance!;
  }

  TemplatesProvider._();
  TemplateKeys _selectedTemplateKey = TemplateKeys.FULVOUS;
  String? _selectedMenuId;
  final List<RestaurantMenuData> _menus = [
    RestaurantMenuData(
        id: "DEFAULT",
        name: "DEFAULT",
        templateId: 0,
        restaurantId: "DEFAULT",
        productCount: 0,
        categoryCount: 0)
  ];
  TemplateKeys get selectedTemplateKey => _selectedTemplateKey;
  bool _isBottomSheetOpen = false;

  bool _isLoading = false;

  List<Widget>? _templates;
  BaseTemplateModel? _model;

  bool get isLoading => _isLoading;

  BaseTemplateModel? get model => _model;

  List<Widget>? get templates => _templates;

  String? get selectedMenuId => _selectedMenuId;

  List<RestaurantMenuData>? get menus => _menus;
  List<GetCategoriesData> _categories = [];
  List<GetProductsByMenuIdData> _products = [];

  List<GetProductsByMenuIdData> get products => _products;

  List<GetCategoriesData> get categories => _categories;
  bool get isBottomSheetOpen => _isBottomSheetOpen;

  set setModel(BaseTemplateModel? model) {
    _model = model;
    notifyListeners();
  }

  set setTemplates(List<Widget>? templates) {
    _templates = templates;
    notifyListeners();
  }

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

  void addMenus(List<RestaurantMenuData> menus) {
    List<String> existingIds = _menus.map((e) => e.id).toList();
    List<RestaurantMenuData> newMenus =
        menus.where((menu) => !existingIds.contains(menu.id)).toList();

    if (newMenus.isNotEmpty) {
      _menus.addAll(newMenus);
      notifyListeners();
    }
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
