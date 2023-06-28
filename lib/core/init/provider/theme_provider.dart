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
    _themeMode = ThemeModekeys
        .values[LocaleStorage.instance.getIntValue(LocaleKeys.THEME_MODE)];
  }

  ThemeModekeys? _themeMode;
  ThemeModekeys? get themeMode => _themeMode;
  ThemeMode get getThemeMode => _getThemeMode();
  void changeTheme(ThemeModekeys value) {
    _themeMode = value;

    LocaleStorage.instance.setIntValue(LocaleKeys.THEME_MODE, value.index);
    notifyListeners();
  }

  ThemeMode _getThemeMode() {
    switch (_themeMode) {
      case ThemeModekeys.LIGHT:
        return ThemeMode.light;

      case ThemeModekeys.DARK:
        return ThemeMode.dark;

      case ThemeModekeys.SYSTEM:
        return ThemeMode.system;
      default:
        return ThemeMode.system;
    }
  }
}
