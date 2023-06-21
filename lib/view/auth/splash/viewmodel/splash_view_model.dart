part of '../view/splash_view.dart';

abstract class SplashViewModels extends State<SplashView> with CacheInit {
  bool _isFirstInit = false;
  late final UpdateService _updateService;

  @override
  void initState() {
    super.initState();

    _updateService =
        UpdateService(NetworkManager.instance.dio, AppVersionUpdate());
    initAppState();
  }

  Future<void> initAppState() async {
    await cacheInit();
    Timer(const PageDurations.normal(), () => _changeAnimationInit());
    Future.delayed(
        const PageDurations.height(), () => navigateToOnboardOrLogin());
  }

  void _changeAnimationInit() => setState(() => _isFirstInit = true);

  void navigateToOnboardOrLogin() {
    LocaleStorage.instance.getBoolValue(LocaleKeys.IS_FIRST)
        ? context.go(RouterKeys.ONBOARD.route)
        : context.go(RouterKeys.LOGIN.route);

    /*_updateService.checkAppUpdate().then((result) async {
      if (result.canUpdate!) {
        await AppVersionUpdate.showAlertUpdate(
            appVersionResult: result,
            context: context,
            title: 'New version of the app is available',
            content:
                'You are currently using an old version. To continue using the application, you need to update it. New version: ${result.storeVersion}',
            updateButtonText: 'Update',
            cancelButtonText: 'Cancel',
            mandatory: false);
      } else {
        context.go(RouterKeys.onboard.route);

        LocaleStorage.instance.getBoolValue(LocaleKeys.IS_FIRST)
            ? context.go(RouterKeys.onboard.route)
            : context.go(RouterKeys.authentication.route);
      }
    });*/
  }
}
