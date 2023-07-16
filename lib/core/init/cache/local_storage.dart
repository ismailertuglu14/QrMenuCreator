import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../constans/cache/locale_keys_enum.dart';

class LocaleStorage {
  static LocaleStorage? _instance;
  static LocaleStorage get instance {
    _instance ??= LocaleStorage._();
    return _instance!;
  }

  SharedPreferences? _preferences;

  LocaleStorage._() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }

  static Future preferencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> clearAll() async {
    await _preferences!.clear();
    
  }

  Future<void> clearAllSaveFirst() async {
    if (_preferences != null) {
      await _preferences!.clear();
      await setBoolValue(LocaleKeys.IS_FIRST, false);
    }
  }

  Future<void> setIntValue(LocaleKeys key, int value) async {
    await _preferences!.setInt(key.toString(), value);
  }

  Future<void> setStringValue(LocaleKeys key, String value) async {
    await _preferences!.setString(key.toString(), value);
  }

  Future<void> setBoolValue(LocaleKeys key, bool value) async {
    await _preferences!.setBool(key.toString(), value);
  }

  Future<void> setObject(LocaleKeys key, Object value) async {
    await _preferences!.setString(key.toString(), jsonEncode(value));
  }

  int getIntValue(LocaleKeys key) => _preferences?.getInt(key.toString()) ?? 0;

  String getStringValue(LocaleKeys key) =>
      _preferences?.getString(key.toString()) ?? '';

  bool getBoolValue(LocaleKeys key) =>
      _preferences!.getBool(key.toString()) ?? true;

  Map<String, dynamic>? getObject(LocaleKeys key) =>
      jsonDecode(_preferences!.getString(key.toString()) ?? '');
}
