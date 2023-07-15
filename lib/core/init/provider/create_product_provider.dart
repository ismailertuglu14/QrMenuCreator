import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qrmenu/core/constans/enum/image_keys.dart';

import '../../../view/pages/createproduct/model/allergens_model.dart';

class CreateProductProvider extends ChangeNotifier {
  static CreateProductProvider? _instance;

  static CreateProductProvider get instance {
    _instance ??= CreateProductProvider._init();
    return _instance!;
  }

  CreateProductProvider._init();

  bool _isActive = false;
  bool _kcalCalculate = false;
  bool _isAddeedFibre = false;
  bool _isNew = false;

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
    AllergensModel("Molluscs", ImageKeys.molluscs),
    AllergensModel("Egg", ImageKeys.egg),
    AllergensModel("Fish", ImageKeys.fish),
    AllergensModel("Lupin", ImageKeys.lupin),
    AllergensModel("Soya", ImageKeys.soybean),
    AllergensModel("Milk", ImageKeys.milk),
    AllergensModel("Peanuts", ImageKeys.peanut),
    AllergensModel("Gluten", ImageKeys.gluten),
    AllergensModel("Mustard", ImageKeys.mustard),
    AllergensModel("Nut", ImageKeys.nut),
    AllergensModel("Sesame", ImageKeys.sesame),
    AllergensModel("Celery", ImageKeys.celery),
    AllergensModel("Sulphites", ImageKeys.sulphurdioxide),
    AllergensModel("Crutaceans", ImageKeys.crustaceans),
  ];

  bool get kcalCalculate => _kcalCalculate;
  int get protein => _protein;
  int get carbohydrate => _carbohydrate;
  int get fat => _fat;
  int get kcal => _kcal;

  bool get isActive => _isActive;
  bool get isNew => _isNew;

  List<AllergensModel> get suggestionAllergens => _suggestionAllergens;

  List<AllergensModel> get allergens => _allergens;

  int _itemImageCurentIndex = 0;

  List<XFile> _itemPreviewList = [];

  List<XFile> get itemPreviewList => _itemPreviewList;

  int get itemImageCurentIndex => _itemImageCurentIndex;

  void clearAll() {
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

  void changeIsNew(bool value) {
    _isNew = value;
    notifyListeners();
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
