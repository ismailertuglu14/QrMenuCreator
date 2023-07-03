import 'package:flutter/material.dart';
import 'package:qrmenu/product/widget/countrycodepicker/country_codes.dart';

import '../../constans/cache/locale_keys_enum.dart';
import '../cache/local_storage.dart';

class BusinessProvider extends ChangeNotifier {
  static BusinessProvider? _instance;
  static BusinessProvider get instance {
    _instance ??= BusinessProvider._init();
    return _instance!;
  }

  BusinessProvider._init();
  String? _selectedCountryName;
  String? get selectedCountryName => _selectedCountryName;
  List<Map<String, String>> _localCountryCodes = [];
  List<Map<String, String>> get localCountryCodes => _localCountryCodes;

  void selectCountry(String? countryName, int index) {
    _selectedCountryName = countryName;
    LocaleStorage.instance.setStringValue(
        LocaleKeys.LANGUAGE, localCountryCodes[index][countryName] ?? '');
    notifyListeners();
  }

  void searchCountry(String searchTerm) {
    searchTerm.isEmpty
        ? _localCountryCodes = countryCodes
        : _localCountryCodes = List.from(countryCodes.where((element) =>
            element['name']!.toLowerCase().contains(searchTerm.toLowerCase()) ||
            element['dial_code']!.contains(searchTerm)));
    notifyListeners();
  }
}
