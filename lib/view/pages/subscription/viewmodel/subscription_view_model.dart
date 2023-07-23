part of '../view/subscription_view.dart';

abstract class SubscriptionViewModel extends State<SubscriptionView> {
  late final SubscriptionProvider _subscriptionProvider;
  late final SubscriptionService _subscriptionService;
  late final DashboardService _dashboardService;

  @override
  void initState() {
    super.initState();

    _subscriptionService = SubscriptionService(NetworkManager.instance.dio);
    _dashboardService = DashboardService(NetworkManager.instance.dio);
    _subscriptionProvider = SubscriptionProvider.instance;
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => getPlan().then((_) => getCurrentPlanDetails()));
  }

  Future<void> getCurrentPlanDetails() async {
    try {
      GetRestaurantMenusResponseModel response =
          await _dashboardService.getRestaurantMenus();

      if (response.isSuccess && response.errors.isEmpty) {
        int totalMenuCount = 0;
        for (var element in response.data) {
          totalMenuCount += element.productCount;
        }
        _subscriptionProvider.setCurrentProductCount(totalMenuCount);
        _subscriptionProvider.setCurrentMenuCount(response.data.length);
      }
    } catch (e) {
      throw Exception(e);
    }
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
