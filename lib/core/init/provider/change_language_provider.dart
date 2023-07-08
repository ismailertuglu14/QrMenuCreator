import 'package:flutter/material.dart';

import '../../../product/widget/countrycodepicker/country_code.dart';
import '../../../product/widget/countrycodepicker/country_codes.dart';
import '../../constans/cache/locale_keys_enum.dart';
import '../cache/local_storage.dart';

class ChangeLanguageProvider extends ChangeNotifier {
  static ChangeLanguageProvider? _instance;

  static ChangeLanguageProvider get instance {
    _instance ??= ChangeLanguageProvider._();
    return _instance!;
  }

  ChangeLanguageProvider._();

  String? _selectedCountryName;
  List<CountryCode>? _allCountryCodes;
  List<CountryCode>? get allCountryCodes => _allCountryCodes;
  String? get selectedCountryName => _selectedCountryName;
  List<Map<String, String>> _localCountryCodes = [];
  List<Map<String, String>> get localCountryCodes => _localCountryCodes;

  set setAllCountryCodes(List<CountryCode> countryCodes) {
    _allCountryCodes = countryCodes;
    _localCountryCodes = List.from(countryCodes
        .map((e) => {
              'name': e.name,
              'dial_code': e.dialCode,
              'flagUri': e.flagUri,
            })
        .toList());
    notifyListeners();
  }

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
            element['name']!.toLowerCase().contains(searchTerm.toLowerCase())));
    notifyListeners();
  }
}
