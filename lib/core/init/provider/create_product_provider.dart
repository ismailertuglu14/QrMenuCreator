import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../view/pages/createproduct/model/allergens_model.dart';

class CreateProductProvider extends ChangeNotifier {
  static CreateProductProvider? _instance;

  static CreateProductProvider get instance {
    _instance ??= CreateProductProvider._init();
    return _instance!;
  }

  CreateProductProvider._init();

  bool _isGluetenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isHalal = false;
  bool _isActive = false;
  bool _kcalCalculate = false;
  bool _isAddeedFibre = false;

  bool _isLoading = false;

  int _protein = 0;
  int _carbohydrate = 0;
  int _fat = 0;
  int _kcal = 0;
  int _fibre = 0;

  bool get isLoading => _isLoading;
  bool get isAddeedFibre => _isAddeedFibre;

  int get fibre => _fibre;

  List<AllergensModel> _allergens = [];
  final List<AllergensModel> _suggestionAllergens = [
    AllergensModel("Fish", Icons.food_bank),
    AllergensModel("Fish", Icons.food_bank),
    AllergensModel("Fish", Icons.food_bank),
    AllergensModel("Fish", Icons.food_bank),
    AllergensModel("Fish", Icons.food_bank),
    AllergensModel("Fish", Icons.food_bank),
    AllergensModel("Fish", Icons.food_bank),
    AllergensModel("Fish", Icons.food_bank),
    AllergensModel("Fish", Icons.food_bank),
    AllergensModel("Fish", Icons.food_bank),
    AllergensModel("Fish", Icons.food_bank),
    AllergensModel("Fish", Icons.food_bank),
  ];

  bool get kcalCalculate => _kcalCalculate;
  int get protein => _protein;
  int get carbohydrate => _carbohydrate;
  int get fat => _fat;
  int get kcal => _kcal;
  bool get isGluetenFree => _isGluetenFree;
  bool get isActive => _isActive;
  bool get isLactoseFree => _isLactoseFree;
  bool get isVegan => _isVegan;
  bool get isVegetarian => _isVegetarian;
  bool get isHalal => _isHalal;

  List<AllergensModel> get suggestionAllergens => _suggestionAllergens;

  List<AllergensModel> get allergens => _allergens;

  int _itemImageCurentIndex = 0;

  List<XFile> _itemPreviewList = [];

  List<XFile> get itemPreviewList => _itemPreviewList;

  int get itemImageCurentIndex => _itemImageCurentIndex;

  void clearAll() {
    _isGluetenFree = false;
    _isLactoseFree = false;
    _isVegan = false;
    _isVegetarian = false;
    _isHalal = false;
    _isActive = false;
    _kcalCalculate = false;
    _isLoading = false;
    _protein = 0;
    _carbohydrate = 0;
    _fat = 0;
    _kcal = 0;
    _allergens = [];
    _itemImageCurentIndex = 0;
    _itemPreviewList = [];
  }

  void changeIsAddeedFibre(bool value) {
    _isAddeedFibre = value;
    notifyListeners();
  }

  void changeLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  void changeProtein(int value) {
    _protein = value;
    notifyListeners();
  }

  void changeFibre(int value) {
    _fibre = value;
    notifyListeners();
  }

  void changeCarbohydrate(int value) {
    _carbohydrate = value;
    notifyListeners();
  }

  void changeFat(int value) {
    _fat = value;
    notifyListeners();
  }

  void changeKcal(int value) {
    _kcal = value;
    notifyListeners();
  }

  void changeKcalCalculate(bool value) {
    _kcalCalculate = value;
    notifyListeners();
  }

  void changeAllergens(List<AllergensModel> value) {
    _allergens = value;
    notifyListeners();
  }

  void addAllergens(AllergensModel value) {
    _allergens.add(value);
    notifyListeners();
  }

  void removeAllergens(AllergensModel value) {
    _allergens.remove(value);
    notifyListeners();
  }

  void changeIsActive(bool value) {
    _isActive = value;
    notifyListeners();
  }

  void changeIsGluetenFree(bool value) {
    _isGluetenFree = value;
    notifyListeners();
  }

  void changeIsLactoseFree(bool value) {
    _isLactoseFree = value;
    notifyListeners();
  }

  void changeIsVegan(bool value) {
    _isVegan = value;
    notifyListeners();
  }

  void changeIsVegetarian(bool value) {
    _isVegetarian = value;
    notifyListeners();
  }

  void changeIsHalal(bool value) {
    _isHalal = value;
    notifyListeners();
  }

  void changeItemImageCurentIndex(int index) {
    _itemImageCurentIndex = index;
    notifyListeners();
  }

  void addItemPreviewImage(XFile image) {
    _itemPreviewList.add(image);
    notifyListeners();
  }

  void addAllItemPreviewImage(List<XFile> imageList) {
    _itemPreviewList.addAll(imageList);
    notifyListeners();
  }

  void removeItemPreviewImage(XFile image) {
    _itemPreviewList.remove(image);
    notifyListeners();
  }

  void clearItemPreviewImageList() {
    _itemPreviewList.clear();
    notifyListeners();
  }

  void changeItemPreviewImageList(List<XFile> imageList) {
    _itemPreviewList = imageList;
    notifyListeners();
  }

  int calculateCalories() {
    const int proteinCalories = 4; // 1 gram protein = 4 kalori
    const int carbsCalories = 4; // 1 gram karbonhidrat = 4 kalori
    const int fatsCalories = 9; // 1 gram yağ = 9 kalori

    return (_protein * proteinCalories +
            _carbohydrate * carbsCalories +
            _fat * fatsCalories)
        .round();
  }
}
