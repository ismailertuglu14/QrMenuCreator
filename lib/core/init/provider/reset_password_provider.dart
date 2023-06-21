import 'package:flutter/material.dart';
import 'package:qrmenu/core/constans/enum/reset_password_stepper_keys.dart';

import '../../constans/enum/reset_password_type_keys.dart';

class ResetPasswordProvider extends ChangeNotifier {
  static ResetPasswordProvider? _instance;

  static ResetPasswordProvider get instance {
    _instance ??= ResetPasswordProvider._();
    return _instance!;
  }

  ResetPasswordProvider._();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  ResetPasswordTypeKeys _resetPasswordType = ResetPasswordTypeKeys.EMAIL;

  ResetPasswordTypeKeys get resetPasswordType => _resetPasswordType;

  void changeLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  void changeResetPasswordType(ResetPasswordTypeKeys resetPasswordType) {
    _resetPasswordType = resetPasswordType;
    notifyListeners();
  }
}
