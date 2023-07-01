part of '../view/home_view.dart';

abstract class HomeViewModels extends State<HomeView> {
  List<Widget> pageViewList = [
    DashboardView(),
    Container(),
    SubscriptionView(),
    BusinessView(),
  ];
}
