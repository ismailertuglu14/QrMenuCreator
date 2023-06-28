import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';

import '../../constans/enum/gender_keys.dart';

class EditProfileProvider extends ChangeNotifier {
  static EditProfileProvider? _instance;

  static EditProfileProvider get instance {
    _instance ??= EditProfileProvider._init();
    return _instance!;
  }

  EditProfileProvider._init();

  String? _coverImage;

  String? _bannerImage;
  bool _isLoading = false;

  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  CountryCode? _selectedCountryCode;

  CountryCode? get selectedCountryCode => _selectedCountryCode;
  bool get isLoading => _isLoading;

  String? get coverImage => _coverImage;

  String? get bannerImage => _bannerImage;

  AutovalidateMode get autoValidateMode => _autoValidateMode;

  void changeSelectedCountryCode(CountryCode value) {
    _selectedCountryCode = value;
    notifyListeners();
  }

  void changeProfileImage(String value) {
    _coverImage = value;
    notifyListeners();
  }

  void changeBannerImage(String value) {
    _bannerImage = value;
    notifyListeners();
  }

  void changeAutoValidateMode(AutovalidateMode value) {
    _autoValidateMode = value;
    notifyListeners();
  }

  void changeLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }
}
