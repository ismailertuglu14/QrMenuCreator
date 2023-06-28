class SubscriptionUltraPlanModel {
  final String features;

  SubscriptionUltraPlanModel({required this.features});
}

class SubscriptionUltraPlanModels {
  SubscriptionUltraPlanModels._();

  static final List<SubscriptionUltraPlanModel> ultraPlanList = [
    SubscriptionUltraPlanModel(features: "Custom post integration"),
    SubscriptionUltraPlanModel(features: "Custom Inventory Integration"),
    SubscriptionUltraPlanModel(
        features: "Connect with UberEats, Zomato, Swiggy"),
  ];
}
