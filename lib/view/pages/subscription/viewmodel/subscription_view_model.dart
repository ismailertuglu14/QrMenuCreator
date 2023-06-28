part of '../view/subscription_view.dart';

abstract class SubscriptionViewModel extends State<SubscriptionView> {
  late final SubscriptionProvider _subscriptionProvider;

  @override
  void initState() {
    super.initState();
    _subscriptionProvider = SubscriptionProvider.instance;
  }
}
