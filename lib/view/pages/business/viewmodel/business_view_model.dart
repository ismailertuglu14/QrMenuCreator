part of '../view/business_view.dart';

abstract class BusinessViewModel extends State<BusinessView> {
  late final HomeProvider _homeProvider;
  late final LoginProvider _loginProvider;

  @override
  void initState() {
    super.initState();

    _homeProvider = HomeProvider.instance;
    _loginProvider = LoginProvider.instance;
  }
}
