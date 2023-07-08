import 'package:flutter/material.dart';

import '../../constans/cache/locale_keys_enum.dart';
import '../../constans/enum/theme_mode_keys.dart';
import '../cache/local_storage.dart';

class ThemeProvider extends ChangeNotifier {
  static ThemeProvider? _instance;

  static ThemeProvider get instance {
    _instance ??= ThemeProvider._();
    return _instance!;
  }

  ThemeProvider._() {
    _isDark = LocaleStorage.instance.getBoolValue(LocaleKeys.THEME_MODE);
    _isDark ??= ThemeMode.system == ThemeMode.dark ? true : false;
  }

  bool? _isDark;
  bool? get isDark => _isDark;
  ThemeMode get getThemeMode => _getThemeMode();
  void changeTheme(bool value) {
    _isDark = value;
    LocaleStorage.instance.setBoolValue(LocaleKeys.THEME_MODE, value);
    notifyListeners();
  }

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
