part of '../view/onboard_view.dart';

abstract class OnboardViewModel extends State<OnboardView> {
  late final PageController _pageController;
  int _currentPage = 0;

  _onChanged(index) => setState(() => _currentPage = index);
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void navigateToLogin(BuildContext context) {
    LocaleStorage.instance.setBoolValue(LocaleKeys.IS_FIRST, false);
    context.go(RouterKeys.LOGIN.route);
  }
}
