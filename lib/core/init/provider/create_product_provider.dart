import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qrmenu/core/constans/enum/image_keys.dart';
import 'package:qrmenu/view/pages/createproduct/model/create_product_response_model.dart';

import '../../../view/pages/createproduct/model/allergens_model.dart';

class CreateProductProvider extends ChangeNotifier {
  static CreateProductProvider? _instance;

  static CreateProductProvider get instance {
    _instance ??= CreateProductProvider._init();
    return _instance!;
  }

  CreateProductProvider._init();

  bool _isActive = true;
  bool _kcalCalculate = false;
  bool _isAddeedFibre = false;

  bool _isLoading = false;

  int _protein = 0;
  int _carbohydrate = 0;
  int _fat = 0;
  int _kcal = 0;
  int _fibre = 0;

  final List<Allergens> _allergenSuggestions = [
    Allergens(name: "Molluscs", isAllergen: false),
    Allergens(name: "Egg", isAllergen: false),
    Allergens(name: "Fish", isAllergen: false),
    Allergens(name: "Lupin", isAllergen: false),
    Allergens(name: "Soya", isAllergen: false),
    Allergens(name: "Milk", isAllergen: false),
    Allergens(name: "Peanuts", isAllergen: false),
    Allergens(name: "Gluten", isAllergen: false),
    Allergens(name: "Mustard", isAllergen: false),
    Allergens(name: "Nut", isAllergen: false),
    Allergens(name: "Sesame", isAllergen: false),
    Allergens(name: "Celery", isAllergen: false),
    Allergens(name: "Sulphites", isAllergen: false),
    Allergens(name: "Crutaceans", isAllergen: false),
  ];
  List<AllergensModel> _allergens = [];
  final List<ImageKeys> _allergensSuggesitonIcons = [
    ImageKeys.molluscs,
    ImageKeys.egg,
    ImageKeys.fish,
    ImageKeys.lupin,
    ImageKeys.soybean,
    ImageKeys.milk,
    ImageKeys.peanut,
    ImageKeys.gluten,
    ImageKeys.mustard,
    ImageKeys.nut,
    ImageKeys.sesame,
    ImageKeys.celery,
    ImageKeys.sulphurdioxide,
    ImageKeys.crustaceans,
  ];

  bool get isLoading => _isLoading;
  bool get isAddeedFibre => _isAddeedFibre;

  List<ImageKeys> get allergensSuggesitonIcons => _allergensSuggesitonIcons;

  List<Allergens> get allergenSuggestions => _allergenSuggestions;

  int get fibre => _fibre;

  bool get kcalCalculate => _kcalCalculate;
  int get protein => _protein;
  int get carbohydrate => _carbohydrate;
  int get fat => _fat;
  int get kcal => _kcal;

  bool get isActive => _isActive;

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

  void changeAllergenState(int index) {
    _allergenSuggestions[index].isAllergen =
        !_allergenSuggestions[index].isAllergen;
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
