part of '../view/home_view.dart';

abstract class HomeViewModels extends State<HomeView>
    with AutomaticKeepAliveClientMixin {
  late final HomeProvider _homeProvider;
  @override
  void initState() {
    super.initState();
    _homeProvider = HomeProvider.instance;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _homeProvider.changeCurrentIndex(0);
      Timer(PageDurations.max(),
          () => context.push(RouterKeys.SUB_NOTIFICATION.route));
    });
  }

  List<Widget> pageViewList = [
    DashboardView(),
    TemplatesView(),
    SubscriptionView(),
    BusinessView(),
  ];
}
