import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../view/pages/createitem/model/allergens_model.dart';

class CreateItemProvider extends ChangeNotifier {
  static CreateItemProvider? _instance;

  static CreateItemProvider get instance {
    _instance ??= CreateItemProvider._init();
    return _instance!;
  }

  CreateItemProvider._init();

  bool _isGluetenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isHalal = false;
  bool _isActive = false;
  bool _kcalCalculate = false;

  double _protein = 0;
  double _carbohydrate = 0;
  double _fat = 0;
  double _kcal = 0;

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
  double get protein => _protein;
  double get carbohydrate => _carbohydrate;
  double get fat => _fat;
  double get kcal => _kcal;
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

  void changeProtein(double value) {
    _protein = value;
    notifyListeners();
  }

  void changeCarbohydrate(double value) {
    _carbohydrate = value;
    notifyListeners();
  }

  void changeFat(double value) {
    _fat = value;
    notifyListeners();
  }

  void changeKcal(double value) {
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
