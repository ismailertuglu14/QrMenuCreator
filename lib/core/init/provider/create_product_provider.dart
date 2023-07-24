import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qrmenu/core/constans/enum/image_keys.dart';
import 'package:qrmenu/view/pages/createproduct/model/create_product_response_model.dart';

import '../../../view/pages/createproduct/model/get_product_by_id_response_model.dart';

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

  List<Allergen> _allergenSuggestions = [
    Allergen(name: "Molluscs", isAllergen: false),
    Allergen(name: "Egg", isAllergen: false),
    Allergen(name: "Fish", isAllergen: false),
    Allergen(name: "Lupin", isAllergen: false),
    Allergen(name: "Soya", isAllergen: false),
    Allergen(name: "Milk", isAllergen: false),
    Allergen(name: "Peanuts", isAllergen: false),
    Allergen(name: "Gluten", isAllergen: false),
    Allergen(name: "Mustard", isAllergen: false),
    Allergen(name: "Nut", isAllergen: false),
    Allergen(name: "Sesame", isAllergen: false),
    Allergen(name: "Celery", isAllergen: false),
    Allergen(name: "Sulphites", isAllergen: false),
    Allergen(name: "Crutaceans", isAllergen: false),
  ];

  List<Nutrition> _nutritions = [
    Nutrition(name: "Protein", value: 0),
    Nutrition(name: "Carbs", value: 0),
    Nutrition(name: "Fats", value: 0),
    Nutrition(name: "Fibre", value: 0),
  ];
  List<int> _allergens = [];
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
  List<Nutrition> get nutritions => _nutritions;
  bool get isAddeedFibre => _isAddeedFibre;

  List<ImageKeys> get allergensSuggesitonIcons => _allergensSuggesitonIcons;

  List<Allergen> get allergenSuggestions => _allergenSuggestions;

  int get fibre => _fibre;

  bool get kcalCalculate => _kcalCalculate;
  int get protein => _protein;
  int get carbohydrate => _carbohydrate;
  int get fat => _fat;
  int get kcal => _kcal;

  bool get isActive => _isActive;

  List<int> get allergens => _allergens;

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

  void changeNutritions(int index, int value) {
    _nutritions = _nutritions
        .map((e) => e.name == _nutritions[index].name
            ? Nutrition(name: e.name, value: value)
            : e)
        .toList();
    notifyListeners();
  }

  void changeAllergenState(int index) {
    _allergenSuggestions[index].isAllergen =
        !_allergenSuggestions[index].isAllergen;
    notifyListeners();
  }

  void changeAllergenSuggestions(List<Allergen> value) {
    _allergenSuggestions = value;
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

  void changeKcal(int value) {
    _kcal = value;
    notifyListeners();
  }

  void changeKcalCalculate(bool value) {
    _kcalCalculate = value;
    notifyListeners();
  }

  void changeAllergens(List<int> value) {
    _allergens = value;
    notifyListeners();
  }

  void addAllergens(int value) {
    _allergens.add(value);
    notifyListeners();
  }

  void removeAllergens(int value) {
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
