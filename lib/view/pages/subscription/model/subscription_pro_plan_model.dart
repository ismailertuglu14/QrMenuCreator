class SubscriptionProPlanModel {
  final String features;

  SubscriptionProPlanModel({required this.features});
}

class SubscriptionProPlanModels {
  SubscriptionProPlanModels._();

  static final List<SubscriptionProPlanModel> proPlanList = [
    SubscriptionProPlanModel(features: "Everything in Basic plus"),
    SubscriptionProPlanModel(features: "Fully loaded Web Dashboard"),
    SubscriptionProPlanModel(features: "Orders,Offers,Payments,Inventory"),
    SubscriptionProPlanModel(features: "Waiter Watch App | Kitchen Display"),
    SubscriptionProPlanModel(features: "10+ Pro Menu Templates"),
  ];
}
