part of '../view/business_view.dart';

abstract class BusinessViewModel extends State<BusinessView> {
  late final HomeProvider _homeProvider;

  @override
  void initState() {
    super.initState();
    _homeProvider = HomeProvider.instance;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
