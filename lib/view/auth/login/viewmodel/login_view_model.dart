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
    initAppState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();
  }

  checkUserIsValid() async {
    if (await context.read<LoginProvider>().isTokenValid()) {
      try {
        String email = LocaleStorage.instance.getStringValue(LocaleKeys.EMAIL);
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
    }
  }

  Future<void> initAppState() async {
    await cacheInit().then((value) => checkUserIsValid());
  }

  Future<void> login() async {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      try {
        _loginProvider.changeIsLoading();
        LoginResponseModel response = await _loginService.login(
            requestModel: LoginRequestModel(
                email: _emailController.text,
                password: _passwordController.text));
        if (response.isSuccess && response.errors.isEmpty) {
          LocaleStorage.instance.setStringValue(
              LocaleKeys.ACCESS_TOKEN, response.data.accessToken);
          LocaleStorage.instance.setStringValue(
              LocaleKeys.REFRESH_TOKEN, response.data.refreshToken);
          LocaleStorage.instance.setStringValue(
              LocaleKeys.EXPIRATION, response.data.expiration.toString());
          LocaleStorage.instance
              .setStringValue(LocaleKeys.EMAIL, _emailController.text);
          LocaleStorage.instance
              .setStringValue(LocaleKeys.PASSWORD, _passwordController.text);

          Fluttertoast.showToast(msg: "Login Success");

          context.go(RouterKeys.HOME.route);
        } else {
          Fluttertoast.showToast(msg: "Failed to login");
        }
        _loginProvider.changeIsLoading();
      } catch (e) {
        throw Exception(e);
      }
    } else {
      Fluttertoast.showToast(msg: "Please fill in the blanks");
    }
  }
}
