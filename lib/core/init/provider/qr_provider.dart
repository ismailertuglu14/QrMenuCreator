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
  bool? _isPublished;

  String? _selectedMenu;

  String? get selectedMenu => _selectedMenu;
  bool? get isPublished => _isPublished;
  TemplateKeys? get selectedTemplate => _selectedTemplate;
  List<RestaurantMenuData>? get getMenus => menus;

  void changeIsPublished(bool value) {
    _isPublished = value;
    notifyListeners();
  }

  void changeSelectedTemplate(TemplateKeys value) {
    _selectedTemplate = value;
    notifyListeners();
  }

  void changeSelectedMenu(String value, bool isPublished) {
    _selectedMenu = value;
    _isPublished = isPublished;
    notifyListeners();
  }

  void changeMenus(List<RestaurantMenuData> value) {
    menus = value;
    notifyListeners();
  }
}
