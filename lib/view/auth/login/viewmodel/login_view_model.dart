// ignore_for_file: use_build_context_synchronously

part of "../view/login_view.dart";

abstract class LoginViewModels extends State<LoginView> with CacheInit {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final LoginProvider _loginProvider;
  late final LoginService _loginService;

  @override
  void initState() {
    super.initState();
    _loginService = LoginService(NetworkManager.instance.dio);
    _loginProvider = LoginProvider.instance;

    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();
  }

  Future<void> getBusiness() async {
    try {
      GetBusinessResponseModel response = await _loginService.getBusiness();

      if (response.isSuccess && response.errors.isEmpty) {
        LocaleStorage.instance
            .setStringValue(LocaleKeys.CURRENCY, response.data.defaultCurrency);

        LocaleStorage.instance
            .setStringValue(LocaleKeys.BUSINESS_NAME, response.data.name);
        LocaleStorage.instance
            .setStringValue(LocaleKeys.RESTAURANT_ID, response.data.id);

        LocaleStorage.instance.setDoubleValue(
            LocaleKeys.LOCATION_LATITUDE, response.data.location.latitude);
        LocaleStorage.instance.setDoubleValue(
            LocaleKeys.LOCATION_LONGITUDE, response.data.location.longitude);

        LocaleStorage.instance.setStringValue(
            LocaleKeys.COVER_IMAGE, response.data.profileImage ?? "");

        LocaleStorage.instance.setStringValue(
            LocaleKeys.PHONE_COUNTRY_CODE, response.data.phone.countryCode);

        LocaleStorage.instance.setStringValue(
            LocaleKeys.PHONE_NUMBER, response.data.phone.phoneNumber);
        LocaleStorage.instance.setStringValue(
            LocaleKeys.INSTAGRAM, response.data.socialMedias.instagram);
        LocaleStorage.instance.setStringValue(
            LocaleKeys.THREADS, response.data.socialMedias.threads);
        LocaleStorage.instance.setStringValue(
            LocaleKeys.FACEBOOK, response.data.socialMedias.facebook);

        LocaleStorage.instance.setStringValue(
            LocaleKeys.TWITTER, response.data.socialMedias.twitter);
        LocaleStorage.instance.setStringValue(
            LocaleKeys.WHATSAPP, response.data.socialMedias.whatsapp);
        LocaleStorage.instance.setStringValue(
            LocaleKeys.WEBSITE, response.data.socialMedias.website);
        LocaleStorage.instance.setStringValue(
            LocaleKeys.SUBSCRIPTION_NAME, response.data.purchase.plan.name);
        LocaleStorage.instance.setStringValue(
            LocaleKeys.SUBSCRIPTION_PERIOD, response.data.purchase.periodType);
        LocaleStorage.instance.setIntValue(
            LocaleKeys.SUBSCRIPTION_PRICE, response.data.purchase.price);
      } else {
        Fluttertoast.showToast(msg: "Failed to get business");
      }
    } catch (e) {
      throw Exception("Failed to get business");
    }
  }

  Future<void> login() async {
    if (_loginProvider.formKey.currentState!.validate()) {
      try {
        _loginProvider.changeIsLoading();
        LoginResponseModel response = await _loginService.login(
            requestModel: LoginRequestModel(
                email: _emailController.text,
                password: _passwordController.text));
        if (response.isSuccess && response.errors.isEmpty) {
          _loginProvider.setAccessToken(response.data.accessToken);
          Future.wait([
            LocaleStorage.instance.setStringValue(
                LocaleKeys.ACCESS_TOKEN, response.data.accessToken),
            LocaleStorage.instance.setStringValue(
                LocaleKeys.REFRESH_TOKEN, response.data.refreshToken),
            LocaleStorage.instance.setStringValue(
                LocaleKeys.EXPIRATION, response.data.expiration.toString()),
            LocaleStorage.instance
                .setStringValue(LocaleKeys.EMAIL, _emailController.text),
            LocaleStorage.instance
                .setStringValue(LocaleKeys.PASSWORD, _passwordController.text),
            getBusiness()
          ]).whenComplete(() => context.go(RouterKeys.HOME.route));

          Fluttertoast.showToast(msg: "Login Success");
        } else {
          Fluttertoast.showToast(msg: "Failed to login");
        }
        _loginProvider.changeIsLoading();
      } catch (e) {
        _loginProvider.changeIsLoading();
        Fluttertoast.showToast(msg: "Failed to login");
      }
    } else {
      Fluttertoast.showToast(msg: "Please fill in the blanks");
    }
  }
}
