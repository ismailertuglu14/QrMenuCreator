// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';

import '../../constans/cache/locale_keys_enum.dart';
import '../cache/local_storage.dart';

class LoginProvider extends ChangeNotifier {
  static LoginProvider? _instance;

  static LoginProvider get instance {
    _instance ??= LoginProvider._();
    return _instance!;
  }

  LoginProvider._() {
    formKey = GlobalKey<FormState>();
  }

  late final GlobalKey<FormState> formKey;
  bool _obscureText = true;
  bool _isLoading = false;

  String? _accessToken;

  String? get accessToken => _accessToken;
  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  bool get obscureText => _obscureText;
  GlobalKey<FormState> get getFormKey => formKey;
  bool get isLoading => _isLoading;
  AutovalidateMode get autovalidateMode => _autovalidateMode;

  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  Future<bool> isTokenValid() async {
    String? expiration;
    expiration = LocaleStorage.instance.getStringValue(LocaleKeys.EXPIRATION);
    if (expiration.isEmpty || expiration == null) {
      expiration = DateTime.now().toString();
      setAuthenticated(false);
      return false;
    }
    if (DateTime.parse(expiration).isBefore(DateTime.now())) {
      setAuthenticated(false);
      return true;
    }
    setAuthenticated(true);
    return true;
  }

  bool logout() {
    try {
      LocaleStorage.instance.clearAllSaveFirst();

      _isAuthenticated = false;

      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  void setAccessToken(String token) {
    _accessToken = token;
    notifyListeners();
  }

  void setAuthenticated(bool value) {
    _isAuthenticated = value;
    notifyListeners();
  }

  void changeIsLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  void changeAutovalidateMode(AutovalidateMode value) {
    _autovalidateMode = value;
    notifyListeners();
  }

  void changeVisiblePassword() {
    _obscureText = !_obscureText;
    notifyListeners();
  }
}
