import 'package:flutter/material.dart';

import '../../constans/enum/gender_keys.dart';
import '../../constans/enum/register_stepper_keys.dart';

class RegisterProvider extends ChangeNotifier {
  static RegisterProvider? _instance;

  static RegisterProvider get instance {
    _instance ??= RegisterProvider._init();
    return _instance!;
  }

  RegisterProvider._init();

  int _currentStep = 0;
  bool _isLoading = false;
  final List<bool> _isError = [
    false,
    false,
    false,
  ];
  GenderKeys? _selectedGender;
  bool _isPasswordVisible = true;

  bool get isPasswordVisible => _isPasswordVisible;
  int get currentStep => _currentStep;
  bool get isLoading => _isLoading;
  List<bool> get isError => _isError;
  GenderKeys? get selectedGender => _selectedGender;
  bool get isStepActive => _isStepActive(_currentStep);
  AutovalidateMode get autoValidateMode => _autoValidateMode;
  List<GlobalKey<FormState>> get registerFormKeys => _registerFormKeys;

  bool _isStepActive(int stepIndex) => _currentStep >= stepIndex ? true : false;
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  final List<GlobalKey<FormState>> _registerFormKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  void changePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void changeValidateMode(AutovalidateMode value) {
    _autoValidateMode = value;
    notifyListeners();
  }

  void onStepContinue() {
    _currentStep += 1;
    notifyListeners();
  }

  void onStepCancel() {
    if (_currentStep > 0 && _currentStep < RegisterStepKeys.values.length) {
      _currentStep -= 1;
      notifyListeners();
    }
  }

  void changeCurrentStep(int value) {
    _currentStep = value;
    notifyListeners();
  }

  void changeLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  void setError(bool value, List<int> index) {
    for (var i in index) {
      _isError[i] = value;
    }
    notifyListeners();
  }

  void changeSelectedGender(GenderKeys? value) {
    _selectedGender = value;
    notifyListeners();
  }

  StepState stepState(int stepIndex) {
    if (stepIndex < RegisterStepKeys.confirmation.index) {
      if (_isError[stepIndex]) {
        return StepState.error;
      } else {
        if (_currentStep > stepIndex) {
          return StepState.complete;
        } else if (_currentStep == stepIndex) {
          return StepState.editing;
        } else {
          return StepState.indexed;
        }
      }
    } else {
      if (_currentStep == RegisterStepKeys.confirmation.index) {
        return StepState.editing;
      } else {
        return StepState.indexed;
      }
    }
  }
}
