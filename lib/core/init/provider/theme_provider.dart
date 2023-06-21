import 'package:flutter/material.dart';


import '../../constans/cache/locale_keys_enum.dart';
import '../cache/local_storage.dart';

class ThemeProvider extends ChangeNotifier {
  static ThemeProvider? _instance;

  static ThemeProvider get instance {
    _instance ??= ThemeProvider._();
    return _instance!;
  }

  ThemeProvider._() {
    _isDark = LocaleStorage.instance.getBoolValue(LocaleKeys.THEME_MODE);
  }

  bool? _isDark;
  bool? get isDark => _isDark;
  void changeTheme(bool value) {
    _isDark = value;
    LocaleStorage.instance.setBoolValue(LocaleKeys.THEME_MODE, value);
    notifyListeners();
  }

  ThemeMode get themeMode => _getThemeMode();

  ThemeMode _getThemeMode() {
    switch (_isDark) {
      case true:
        return ThemeMode.dark;

      case false:
        return ThemeMode.light;

      default:
        return ThemeMode.system;
    }
  }
}
