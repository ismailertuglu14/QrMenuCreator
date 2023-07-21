import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:qrmenu/core/constans/cache/locale_keys_enum.dart';
import 'package:qrmenu/core/init/cache/local_storage.dart';
import 'package:qrmenu/view/auth/login/model/get_business_response_model.dart';

import '../../../product/widget/countrycodepicker/country_code.dart';

import '../../constans/enum/add_media_link_keys.dart';
import '../../constans/enum/gender_keys.dart';

class EditBusinessProvider extends ChangeNotifier {
  static EditBusinessProvider? _instance;

  static EditBusinessProvider get instance {
    _instance ??= EditBusinessProvider._init();
    return _instance!;
  }

  EditBusinessProvider._init();

  String? _coverImage;

  bool _isLoading = false;
  String? _currentLocationName;

  String? _currentCurrency;

  LatLng? _currentLocation;

  String? get currentLocationName => _currentLocationName;

  String? get currentCurrency => _currentCurrency;

  LatLng? get currentLocation => _currentLocation;

  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  CountryCode? _selectedCountryCode;
  

  CountryCode? get selectedCountryCode => _selectedCountryCode;
  bool get isLoading => _isLoading;

  String? get coverImage => _coverImage;

  AutovalidateMode get autoValidateMode => _autoValidateMode;

  void changeCurrentCurrency(String value) {
    _currentCurrency = value;
    notifyListeners();
  }

  void changeCurrentLocationName(String value) {
    _currentLocationName = value;
    notifyListeners();
  }

  void changeCurrentLocation(LatLng value) {
    _currentLocation = value;
    notifyListeners();
  }

  void changeSelectedCountryCode(CountryCode value) {
    _selectedCountryCode = value;
    notifyListeners();
  }

  void changeCoverImage(String value) {
    _coverImage = value;
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
