import 'package:flutter/material.dart';
import 'package:qrmenu/core/constans/enum/template_keys.dart';

import '../../../view/pages/dashboard/model/get_restaurant_menus_response_model.dart';

class QrProvider extends ChangeNotifier {
  static QrProvider? _instance;

  static QrProvider get instance {
    _instance ??= QrProvider._init();
    return _instance!;
  }

  QrProvider._init();
  List<RestaurantMenuData>? menus;
  TemplateKeys? _selectedTemplate;
  String? _selectedMenu;

  String? get selectedMenu => _selectedMenu;
  TemplateKeys? get selectedTemplate => _selectedTemplate;
  List<RestaurantMenuData>? get getMenus => menus;

  void changeSelectedTemplate(TemplateKeys value) {
    _selectedTemplate = value;
    notifyListeners();
  }

  void changeSelectedMenu(String value) {
    _selectedMenu = value;
    notifyListeners();
  }

  void changeMenus(List<RestaurantMenuData> value) {
    menus = value;
    notifyListeners();
  }

 
}
