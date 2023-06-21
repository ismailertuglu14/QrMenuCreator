import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  static LoginProvider? _instance;

  static LoginProvider get instance {
    _instance ??= LoginProvider._();
    return _instance!;
  }

  LoginProvider._();
  bool _visiblePassword = false;
  GlobalKey<FormState> formKey = GlobalKey();
 
  bool get visiblePassword => _visiblePassword;

  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  AutovalidateMode get autovalidateMode => _autovalidateMode;

  void changeAutovalidateMode(AutovalidateMode value) {
    _autovalidateMode = value;
    notifyListeners();
  }

  void changeVisiblePassword() {
    _visiblePassword = !_visiblePassword;
    notifyListeners();
  }
}
