import 'package:flutter/material.dart';

import '../../../view/pages/createproduct/model/create_product_response_model.dart';

class ProductsProvider extends ChangeNotifier {
  static ProductsProvider? _instance;

  static ProductsProvider get instance {
    _instance ??= ProductsProvider._();
    return _instance!;
  }

  ProductsProvider._();

  List<CreateProductData> _productList = [];

  List get productList => _productList;

  set setProductList(List<CreateProductData>  value) {
    _productList = value;
    notifyListeners();
  }

  void addProductItem(CreateProductData sectionItem) {
    _productList.add(sectionItem);
    notifyListeners();
  }

  void removeProductItem(int index) {
    _productList.removeAt(index);
    notifyListeners();
  }
}
