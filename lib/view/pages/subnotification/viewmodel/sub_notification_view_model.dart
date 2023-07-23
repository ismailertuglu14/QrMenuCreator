part of '../view/sub_notification_view.dart';

abstract class SubNotificationViewModel extends State<SubNotificationView> {
  late final SubscriptionService _subscriptionService;
  List<GetPlanData> features = [];

  bool _isLoading = false;

  int _selectedIndex = 0;

  bool _isYearly = false;

  void changeIsYearly(bool value) => setState(() => _isYearly = value);

  void changeSelectedIndex(int index) => setState(() => _selectedIndex = index);

  void changeLoadingState() => setState(() => _isLoading = !_isLoading);

  @override
  void initState() {
    super.initState();
    _subscriptionService = SubscriptionService(NetworkManager.instance.dio);
    getPlans();
  }

  Future<void> getPlans() async {
    try {
      changeLoadingState();
      GetPlanResponseModel response = await _subscriptionService.getPlan();
      if (response.isSuccess && response.errors.isEmpty) {
        features = response.data;
      }
      changeLoadingState();
    } catch (e) {
      throw Exception(e);
    }
  }
}
