import 'package:flutter/material.dart';

import '../../../view/pages/subscription/model/get_plan_response_model.dart';

class SubscriptionProvider extends ChangeNotifier {
  static SubscriptionProvider? _instance;

  static SubscriptionProvider get instance {
    _instance ??= SubscriptionProvider._();
    return _instance!;
  }

  SubscriptionProvider._();
  List<GetPlanData>? _planData;

  bool _isLoading = false;

  double _customMenuLimit = 0;
  double _customProductCount = 0;

  int _selectedPlanIndex = 0;

  List<GetPlanData>? get planData => _planData;

  bool get isLoading => _isLoading;

  int get selectedPlanIndex => _selectedPlanIndex;

  double get customMenuLimit => _customMenuLimit;

  double get customProductCount => _customProductCount;

  bool _isYearly = false;

  bool get isYearly => _isYearly;

  void setSelectedPlanIndex(int value) {
    _selectedPlanIndex = value;
    notifyListeners();
  }

  void setCustomMenuLimit(double value) {
    _customMenuLimit = value;
    notifyListeners();
  }

  void setCustomProductCount(double value) {
    _customProductCount = value;
    notifyListeners();
  }

  void changeLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  set setGetPlanData(List<GetPlanData>? value) {
    _planData = value;
    notifyListeners();
  }

  void changeSubscriptionType(bool value) {
    _isYearly = value;
    notifyListeners();
  }
}
