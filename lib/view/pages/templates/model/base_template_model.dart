import 'package:flutter/material.dart';

import '../../category/model/get_category_response_model.dart';
import '../../dashboard/model/get_restaurant_menus_response_model.dart';
import '../../products/model/get_products_by_category_id_response_model.dart';

class BaseTemplateModel extends ChangeNotifier {
  List<GetCategoriesData> categories;
  List<GetProductsByMenuIdData> products;

  BaseTemplateModel(this.categories, this.products);

  void updateCategories(List<GetCategoriesData> newCategories) {
    categories = newCategories;
    notifyListeners();
  }

  void updateProducts(List<GetProductsByMenuIdData> newProducts) {
    products = newProducts;
    notifyListeners();
  }
}
