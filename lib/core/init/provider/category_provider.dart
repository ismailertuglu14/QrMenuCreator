import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qrmenu/view/pages/category/model/get_category_response_model.dart';

import '../../../view/pages/category/model/create_category_response_model.dart';

class CategoryProvider extends ChangeNotifier {
  static CategoryProvider? _instance;

  static CategoryProvider get instance {
    _instance ??= CategoryProvider._();
    return _instance!;
  }

  CategoryProvider._() {
    _categoryController = TextEditingController();
  }

  final List<String> _categorySuggestionList = [
    "Beer",
    "Breakfast",
    "Brunch",
    "Dessert",
    "Dinner",
    "Lunch",
    "Main Courses"
  ];
  List<GetCategoriesData> _categoryList = [];

  bool _isLoading = false;

  int? _selectedSuggestionIndex;

  XFile? _categoryImage;

  List<GetCategoriesData>? get categoryList => _categoryList;

  late final TextEditingController _categoryController;

  XFile? get categoryImage => _categoryImage;

  bool get isLoading => _isLoading;

  List<String> get categorySuggestionList => _categorySuggestionList;

  int? get selectedSuggestionIndex => _selectedSuggestionIndex;
  TextEditingController get categoryController => _categoryController;

  set setCategoryList(List<GetCategoriesData> categoryList) {
    _categoryList = categoryList;
    notifyListeners();
  }

  void addCategory(GetCategoriesData category) {
    _categoryList.add(category);

    notifyListeners();
  }

  void changeLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  set categoryImage(XFile? categoryImage) {
    _categoryImage = categoryImage;
    notifyListeners();
  }

  set setSelectedSuggestionIndex(int? selectedSuggestionIndex) {
    _selectedSuggestionIndex = selectedSuggestionIndex;
    notifyListeners();
  }

  set setCategoryImage(XFile? categoryImage) {
    _categoryImage = categoryImage;
    notifyListeners();
  }
}
