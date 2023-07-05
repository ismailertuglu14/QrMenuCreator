import 'package:flutter/material.dart';

import '../../../view/pages/category/model/get_category_response_model.dart';
import '../../../view/pages/createproduct/model/create_product_response_model.dart';
import '../../../view/pages/products/model/get_products_by_menu_id_response_model.dart';

class ProductsProvider extends ChangeNotifier {
  static ProductsProvider? _instance;

  static ProductsProvider get instance {
    _instance ??= ProductsProvider._();
    return _instance!;
  }

  ProductsProvider._();

  List<GetProductsByMenuIdData>? _productList ;

  List<GetProductsByMenuIdData>? get productList => _productList;

  bool _isLoading = false;


  bool get isLoading => _isLoading;

  void changeLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  set setProductList(List<GetProductsByMenuIdData>  value) {
    _productList = value;
    notifyListeners();
  }

  void addProductItem(GetProductsByMenuIdData sectionItem) {
    _productList?.add(sectionItem);
    notifyListeners();
  }

  void removeProductItem(int index) {
    _productList?.removeAt(index);
    notifyListeners();
  }
}
