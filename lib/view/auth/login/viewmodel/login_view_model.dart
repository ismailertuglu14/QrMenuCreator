// ignore_for_file: use_build_context_synchronously

part of "../view/login_view.dart";

abstract class LoginViewModels extends State<LoginView>
    with CacheInit, SaveBusinessMixin {
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

  Future<void> login() async {
    if (_loginProvider.formKey.currentState!.validate()) {
      try {
        _loginProvider.changeIsLoading();
        LoginResponseModel response = await _loginService.login(
            requestModel: LoginRequestModel(
                email: _emailController.text,
                password: _passwordController.text));
        if (response.isSuccess && response.errors.isEmpty) {
          saveRequestBody(
              response, _emailController.text, _passwordController.text);
          getBusiness();
        } else {
          Fluttertoast.showToast(msg: "Failed to login");
        }
      } catch (e) {
        _loginProvider.changeIsLoading();
        Fluttertoast.showToast(msg: "Failed to login");
      }
    } else {
      Fluttertoast.showToast(msg: "Please fill in the blanks");
    }
  }

  Future<void> getBusiness() async {
    try {
      GetBusinessResponseModel response = await _loginService.getBusiness();
      if (response.isSuccess && response.errors.isEmpty) {
        Future.microtask(() => saveBusinessInfo(response))
            .whenComplete(() => context.go(RouterKeys.HOME.route));
      } else {
        Fluttertoast.showToast(msg: "Failed to get business info");
      }
      _loginProvider.changeIsLoading();
    } catch (e) {
      throw Exception(e);
    }
  }
}

void saveRequestBody(
    LoginResponseModel response, String email, String password) {
  LocaleStorage.instance
      .setStringValue(LocaleKeys.ACCESS_TOKEN, response.data.accessToken);
  LocaleStorage.instance
      .setStringValue(LocaleKeys.REFRESH_TOKEN, response.data.refreshToken);
  LocaleStorage.instance.setStringValue(
      LocaleKeys.EXPIRATION, response.data.expiration.toString());
  LocaleStorage.instance.setStringValue(LocaleKeys.EMAIL, email);
  LocaleStorage.instance.setStringValue(LocaleKeys.PASSWORD, password);
}
