part of '../view/subscription_view.dart';

abstract class SubscriptionViewModel extends State<SubscriptionView> {
  late final SubscriptionProvider _subscriptionProvider;
  late final SubscriptionService _subscriptionService;

  @override
  void initState() {
    super.initState();
    _subscriptionService = SubscriptionService(NetworkManager.instance.dio);
    _subscriptionProvider = SubscriptionProvider.instance;
    getPlan();
  }

  Future<void> getPlan() async {
    try {
      _subscriptionProvider.changeLoading();
      GetPlanResponseModel response = await _subscriptionService.getPlan();
      if (response.statusCode == HttpStatus.ok) {
        _subscriptionProvider.setGetPlanData = response.data;
      }
      _subscriptionProvider.changeLoading();
    } catch (e) {
      throw Exception(e);
    }
  }
}
