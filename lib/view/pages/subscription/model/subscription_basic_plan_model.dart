class SubscriptionBasicPlanModel {
  final String features;

  SubscriptionBasicPlanModel({required this.features});
}

class SubscriptionBasicPlanModels {
  SubscriptionBasicPlanModels._();

  static final List<SubscriptionBasicPlanModel> basicPlanList = [
    SubscriptionBasicPlanModel(features: "Everything in Free Plan"),
    SubscriptionBasicPlanModel(features: "Waiter Managment"),
    SubscriptionBasicPlanModel(features: "Call a waiter feature"),
    SubscriptionBasicPlanModel(features: "App for Waiter"),
  ];
}
