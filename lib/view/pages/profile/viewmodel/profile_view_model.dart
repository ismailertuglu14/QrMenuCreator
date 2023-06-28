part of '../view/profile_view.dart';

abstract class ProfileViewModel extends State<ProfileView> {
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
