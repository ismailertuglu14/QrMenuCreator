import 'package:flutter/material.dart';

class DeleteBusinessProvider extends ChangeNotifier {
  static DeleteBusinessProvider? _instance;

  static DeleteBusinessProvider get instance {
    _instance ??= DeleteBusinessProvider._();
    return _instance!;
  }

  DeleteBusinessProvider._();

  bool _isConfirm = false;
  bool _hidePassword = true;

  bool get hidePassword => _hidePassword;
  

  bool get isConfirm => _isConfirm;

  void changeHidePassword() {
    _hidePassword = !_hidePassword;
    notifyListeners();
  }

  void changeConfirm(bool value) {
    _isConfirm = value;
    notifyListeners();
  }
}
