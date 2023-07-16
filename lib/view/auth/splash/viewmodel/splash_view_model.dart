// ignore_for_file: use_build_context_synchronously

part of '../view/splash_view.dart';

abstract class SplashViewModels extends State<SplashView> with CacheInit {
  bool _isFirstInit = false;
  late final UpdateService _updateService;
  late final LoginService _loginService;

  @override
  void initState() {
    super.initState();

    _updateService =
        UpdateService(NetworkManager.instance.dio, AppVersionUpdate());
    _loginService = LoginService(NetworkManager.instance.dio);
    initAppState();
  }

  Future<void> initAppState() async {
    Timer(const PageDurations.medium(), () => _changeAnimationInit());
    Future.delayed(const PageDurations.max(), () async {
      await cacheInit().then((_) => checkUserIsValid());
    });
  }

  checkUserIsValid() async {
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

    if (LocaleStorage.instance.getBoolValue(LocaleKeys.IS_FIRST)) {
      context.go(RouterKeys.ONBOARD.route);
    } else {
      if (await context.read<LoginProvider>().isTokenValid()) {
        try {
          String email =
              LocaleStorage.instance.getStringValue(LocaleKeys.EMAIL);
          String password =
              LocaleStorage.instance.getStringValue(LocaleKeys.PASSWORD);
          LoginRequestModel request =
              LoginRequestModel(email: email, password: password);

          LoginResponseModel response =
              await _loginService.login(requestModel: request);
          if (response.isSuccess && response.errors.isEmpty) {
            context.read<LoginProvider>().setAuthenticated(true);
            context.go(RouterKeys.HOME.route);
          }
        } catch (e) {
          context.read<LoginProvider>().setAuthenticated(false);
        }
      } else {
        context.read<LoginProvider>().setAuthenticated(false);
        context.go(RouterKeys.LOGIN.route);
      }
    }
  }

  void _changeAnimationInit() => setState(() => _isFirstInit = true);
}
