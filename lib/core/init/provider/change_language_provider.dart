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

  String? get selectedCountryName => _selectedCountryName;

  void selectCountry(String? countryName) {
    _selectedCountryName = countryName;
    LocaleStorage.instance
        .setStringValue(LocaleKeys.LANGUAGE, countryName ?? "");
    notifyListeners();
  }

  void changeCountry(String? countryName) {
    _selectedCountryName = countryName;
    notifyListeners();
  }
}
