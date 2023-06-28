part of '../view/dashboard_view.dart';

abstract class DashboardViewModel extends State<DashboardView> {
  late final HomeProvider _homeProvider;

  @override
  void initState() {
    super.initState();
    _homeProvider = HomeProvider.instance;
  }
}
