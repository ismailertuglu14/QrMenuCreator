import 'package:flutter/material.dart';

import '../../constans/enum/subscription_plan_keys.dart';

class SubscriptionProvider extends ChangeNotifier {
  static SubscriptionProvider? _instance;

  static SubscriptionProvider get instance {
    _instance ??= SubscriptionProvider._();
    return _instance!;
  }

  SubscriptionProvider._();

  SubscriptionPlanKeys _subscriptionPlanKeys = SubscriptionPlanKeys.Basic;
  bool _isYearly = false;

  SubscriptionPlanKeys get subscriptionPlanKeys => _subscriptionPlanKeys;

  bool get isYearly => _isYearly;

  void changeSubscriptionType(bool value) {
    _isYearly = value;
    notifyListeners();
  }

  void changeSubscriptionPlan(SubscriptionPlanKeys planKey) {
    _subscriptionPlanKeys = planKey;
    notifyListeners();
  }
}
